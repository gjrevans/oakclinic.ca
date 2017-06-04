class PagesController < ApplicationController
    def index
    end

    def about
        #@contact = Contact.new
    end

    def naturopathic_medicine
        @elements = JSON.parse(File.read('public/json/elements.json'))
    end
end
