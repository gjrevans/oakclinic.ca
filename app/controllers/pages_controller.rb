class PagesController < ApplicationController
  def index
    @articles = Article.where(status: :published).order("created_at DESC").limit(3)
    @hours = JSON.parse(File.read('public/json/hours.json'))
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
    @hours = JSON.parse(File.read('public/json/hours.json'))
  end
end
