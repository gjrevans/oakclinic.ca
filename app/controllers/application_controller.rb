class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception
    before_filter :set_locale
    
    private
    def set_locale
        I18n.locale = params[:locale].present? ? params[:locale] : "en"
    end

    def default_url_options(options = {})
        {locale: I18n.locale}
    end
end
