class PagesController < ApplicationController
  def index
  end

  def about
    @team_members = JSON.parse(File.read('public/json/team_members.json'))
  end

  def faq
    @treatments = JSON.parse(File.read('public/json/treatments.json'))
  end

  def services
    @services = JSON.parse(File.read('public/json/services.json'))
  end

  def products
    @logos = JSON.parse(File.read('public/json/logos.json'))
  end

  def contact
  end
end
