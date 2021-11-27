class PagesController < ApplicationController
  def index
    @articles = Article.where(status: :published).order("created_at DESC").limit(3)
    @hours = JSON.parse(File.read('public/json/hours.json'))
    @specialties = JSON.parse(File.read('public/json/specialties.json'))
    @team_members = JSON.parse(File.read('public/json/team_members.json'))
  end

  def naturopathy
    @treatments = JSON.parse(File.read('public/json/treatments.json'))
  end

  def services
    @primary_services = JSON.parse(File.read('public/json/primary_services.json'))
    @secondary_services = JSON.parse(File.read('public/json/secondary_services.json'))
  end

  def iv_therapy
    @steps = JSON.parse(File.read('public/json/steps.json'))
  end

  def nst
  end

  def products
    @logos = JSON.parse(File.read('public/json/logos.json'))
  end

  def team
    @team_members = JSON.parse(File.read('public/json/team_members.json'))
    @team_members_secondary = JSON.parse(File.read('public/json/team_members_secondary.json'))

  end

  def conditions_treated
    @team_members = JSON.parse(File.read('public/json/conditions.json'))
  end

  def contact
    @hours = JSON.parse(File.read('public/json/hours.json'))
  end
end
