class ArticlesController < ApplicationController

  #attr accessors?
  def index
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
    @comment = Comment.new
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    @article.save
    flash.notice = "Article #{@article.title} created"

    redirect_to article_path(@article)
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])
    @article.update(article_params)

    flash.notice = "Article #{@article.title} updated"

    redirect_to articles_path
  end

  def destroy
    Article.find(params[:id]).destroy
    flash.notice = "Article deleted"

    redirect_to articles_path
  end

  def article_params
    params.require(:article).permit(:title, :body, :tag_list)
  end


end
