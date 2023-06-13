class JobsController < ApplicationController
  before_action :set_job, only: %i[show update]
  before_action :set_trip, only: %i[index new edit create]

  def index
    @jobs = policy_scope(Job)
  end

  def show
    authorize @job
  end

  def new
    @job = Job.new
    authorize @job
  end

  def create
    @job = Job.new(job_params)
    @job.trip = @fishing_trip
    authorize @job
    if @job.save
      redirect_to fishing_trip_path(@job.fishing_trip)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    authorize @job
  end

  def update
    authorize @job
    @job.update(job_params)
    redirect_to job_path(@job)
  end

  private

  def set_trip
    @fishing_trip = FishingTrip.find(params[:id])
  end

  def set_job
    @job = Job.find(params[:job_id])
  end

  def job_params
    params.require(:job).permit(:company_id, :url, :content, :status, :tags, :title, :tag_list)
  end
end
