class PagesController < ApplicationController
    def index
    end

    def about
        @team_members = JSON.parse(File.read('public/json/team_members.json'))
    end

    def naturopathic_medicine
        @treatments = JSON.parse(File.read('public/json/treatments.json'))
    end
end
