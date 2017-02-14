class ContactSharesController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @contacts_shares = ContactShare.all
    if @user
      @contacts_shares = @user.contact_shares.contact
    end
    render json: @contacts_shares
  end

  def new
  end

  def create
    contact_share = ContactShare.new(contact_share_params)
    if contact_share.save
      render json: contact_share
    else
      render json: contact_share.errors.full_messages, status: :unprocessable_entity
    end
  end

  def show
    @contacts_share = ContactShare.find_by_id(params[:id])
    if @contacts_share
      render json: @contacts_share
    else
      render json: "Item not found", status: :not_found
    end
  end

  def update
    @contacts_share = ContactShare.find_by_id(params[:id])
    if @contacts_share.update(contacts_share_params)
      render json: @contacts_share
    else
      render json: @contacts_share.errors.full_messages, status: :not_found
    end
  end

  def destroy
    @contacts_share = ContactShare.find_by_id(params[:id])
    if @contacts_share.destroy
      render json: @contacts_share
    else
      render json: @contacts_share.errors.full_messages
    end
  end

  private
  def contact_share_params
    params.require(:contact_share).permit(:contact_id, :user_id)
  end
end
