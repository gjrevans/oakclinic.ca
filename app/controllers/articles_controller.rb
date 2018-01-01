class ArticlesController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_article, only: [:show, :edit, :update, :destroy]

  def index
    if current_user
      @articles = Article.all.order("created_at DESC")
    else
      @articles = Article.where(status: :published).order("created_at DESC")
    end
  end

  def show
    if @article.unpublished?
      flash[:danger] = "Oh no, that article is unpublushed!"
      redirect_to root_path
    end
    @articles = Article.where(status: :published).order("created_at DESC").limit(3)
  end


  def new
    @article = Article.new
  end

  def edit
  end

  def create
    @article = current_user.articles.new(article_params)
    if @article.save
      flash[:success] = 'Article was successfully created!'
      redirect_to @article
    else
      render :new
    end
  end

  def update
    # Explicitly set slug to nil so that the friendly id is regenerated
    @article.slug = nil

    # Save the article with the new nil slug
    if @article.update(article_params)
      flash[:success] = 'Article was successfully updated!'
      redirect_to @article
    else
      render :edit
    end
  end

  def destroy
    @article.destroy
    flash[:success] = 'Article was successfully deleted!'
    redirect_to articles_url
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_article
    @article = Article.friendly.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def article_params
    params.require(:article).permit(:title, :image, :body, :link, :status)
  end
end
