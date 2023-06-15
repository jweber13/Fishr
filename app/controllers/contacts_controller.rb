class ContactsController < ApplicationController
  before_action :set_contact, only: %i[show edit update destroy]

  def index
    @contacts = policy_scope(Contact)
  end

  def show
    authorize @contact
  end

  def new
    @contact = Contact.new
    authorize @contact
  end

  def create
    @contact = Contact.new(contact_params)
    @contact.user = current_user
    authorize @contact
    if @contact.save
      redirect_to contacts_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    authorize @contact
  end

  def update
    authorize @contact
    @contact.update(contact_params)
    redirect_to contact_path(@contact)
  end

  def destroy
    authorize @contact
    @contact.destroy
    redirect_to contacts_path, status: :see_other
  end

  private

  def contact_params
    params.require(:contact).permit(:user_id, :company_id, :firstname, :lastname, :email, :phone, :insta, :linkedin, :twitter)
  end

  def set_contact
    @contact = Contact.find(params[:id])
  end
end
