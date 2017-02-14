class ContactsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @contacts = Contact.all
    if @user
      @contacts = Contact.where(user_id: @user.id)
    end
    render json: @contacts
  end

  def new
  end

  def create
    contact = Contact.new(contact_params)
    if contact.save
      render json: contact
    else
      render json: contact.errors.full_messages, status: :unprocessable_entity
    end
  end

  def show
    @contact = Contact.find_by_id(params[:id])
    if @contact
      render json: @contact
    else
      render json: "Item not found", status: :not_found
    end
  end

  def update
    @contact = Contact.find_by_id(params[:id])
    if @contact.update(contact_params)
      render json: @contact
    else
      render json: @contact.errors.full_messages, status: :not_found
    end
  end

  def destroy
    @contact = Contact.find_by_id(params[:id])
    if @contact.destroy
      render json: @contact
    else
      render json: @contact.errors.full_messages
    end
  end

  private
  def contact_params
    params.require(:contact).permit(:name, :email, :user_id)
  end
end
