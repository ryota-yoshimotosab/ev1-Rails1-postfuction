class ContactsController < ApplicationController
  before_action :admin_authenticate, only: [:index, :edit, :update, :destroy]
  
  
  
  layout "nosidebar"
  
  def index
  end

  def new
    @contact = Contact.new
  end

def create
  @contact = Contact.new(contact_params)
  if @contact.save
    redirect_to contact_path(@contact)
    ContactMailer.thanks_mail(@contact).deliver
    ContactMailer.received_mail(@contact).deliver
  else
    render "new"
  end
end 

  def edit
  end

  def show
    @contact = Contact.find params[:id]
  end
  
  def contact_params
    params.require(:contact).permit(:name, :email, :content)
  end 
  
  
  
end
