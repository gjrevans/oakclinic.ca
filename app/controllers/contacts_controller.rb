class ContactsController < ApplicationController
    def create
        ContactMailer.contact_confirmation(Contact.new(params[:contact])).deliver
        flash[:info] = "Thanks, your message was sent!"
        redirect_to root_path
    end
end
