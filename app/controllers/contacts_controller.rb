class ContactsController < ApplicationController
    def create
        #Create Gibbon Object
        gibbon = Gibbon::Request.new(api_key: ENV['MAILCHIMP_API_KEY'], debug: true)
        gibbon.timeout = 30

        #If we're missing date redirect and show an error
        if params[:email].blank? || params[:first_name].blank? || params[:last_name].blank?
            flash[:danger] = t('alerts.subscribe_failure_missing_fields')
            return redirect_to root_path
        end

        #Create the user and catch errors
        begin
            gibbon.lists(ENV['MAILCHIMP_LIST_ID']).members.create(body: {email_address: params[:email], status: "pending", merge_fields: {FNAME: params[:first_name], LNAME: params[:last_name]}})
            flash[:success] = t('alerts.subscribe_success')
            redirect_to root_path
        rescue Gibbon::MailChimpError => error
            flash[:danger] = error.title
            redirect_to root_path
        end
    end
end
