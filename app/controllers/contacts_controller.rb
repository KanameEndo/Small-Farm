class ContactsController < ApplicationController
  def index
    @contact = Contact.new
  end

  def confirm
    @contact = Contact.new(contact_params)
    if @contact.valid?
      render confirm_path
    else
      render contacts_path
    end
  end

  def done
    @contact = Contact.new(contact_params)
    if params[:back]
      render contacts_path
    else
      ContactMailer.send_mail(@contact).deliver_now
      render done_path
    end
  end

  private

  def contact_params
    params.require(:contact).permit(:name, :email, :content)
  end
end
