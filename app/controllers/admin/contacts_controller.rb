class Admin::ContactsController < ApplicationController

 def index
  @contacts = Contact.all
 end

 def show
  @contact = Contact.find(params[:id])
 end

 private

    def contact_params
      params.require(:contact).permit(:name, :subject, :message)
    end
end
