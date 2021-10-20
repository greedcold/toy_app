class ArticlesController < ApplicationController

  #attr accessors?
  def index
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    @article.save

    redirect_to article_path(@article)
  end

  def destroy
    Article.find(params[:id]).destroy

    redirect_to articles_path
  end

  def article_params
    params.require(:article).permit(:title, :body)
  end


end
