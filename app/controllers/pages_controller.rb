class PagesController < ApplicationController
  def index
    @articles = Article.where(status: :published).order("created_at DESC").limit(3)
    @hours = JSON.parse(File.read('public/json/hours.json'))
  end

  def faq
    @treatments = JSON.parse(File.read('public/json/treatments.json'))
  end

  def services
    @primary_services = JSON.parse(File.read('public/json/primary_services.json'))
    @secondary_services = JSON.parse(File.read('public/json/secondary_services.json'))
  end

  def products
    @logos = JSON.parse(File.read('public/json/logos.json'))
  end

  def contact
    @hours = JSON.parse(File.read('public/json/hours.json'))
  end
end
