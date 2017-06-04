class ContactsController < ApplicationController
    def create
        #Create Gibbon Object
        gibbon = Gibbon::Request.new(api_key: ENV['MAILCHIMP_API_KEY'], debug: true)
        gibbon.timeout = 30

        gibbon.lists(ENV['MAILCHIMP_LIST_ID']).members.create(body: {email_address: params[:email], status: "pending", merge_fields: {FNAME: params[:first_name], LNAME: params[:last_name]}})

        flash[:success] = t('alerts.subscribe_success')
        redirect_to root_path
    end
end
