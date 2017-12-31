class PagesController < ApplicationController
  def index
  end

  def about
    @team_members = JSON.parse(File.read('public/json/team_members.json'))
  end

  def faq
    @treatments = JSON.parse(File.read('public/json/treatments.json'))
  end

  def products
  end

  def services
  end

  def contact
  end
end
