require "json"

class ContactsController < ApplicationController
  before_action :set_contact, only: %i[show edit update destroy]

  def index
    @contacts = policy_scope(Contact)
    @contacts = @contacts.search_contact(params[:query]) if params[:query].present?
    respond_to do |format|
      format.html { render :index }
      format.json do
        render json: {
          contacts_html: render_to_string(partial: "contacts/list", formats: :html, locals: { contacts: @contacts})
        }.to_json
      end
    end
  end

  def show
    authorize @contact
  end

  def new
    @contact = Contact.new
    authorize @contact
    respond_to do |format|
      format.html { render :new }
      format.json do
        render json: {
          new_contact_html: render_to_string(partial: "contacts/form", formats: :html, locals: { contact: @Contact })
        }.to_json
      end
    end
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
