class ArticlesController < ApplicationController

  def index
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
  end

  def new
    @article = Article.new()
  end

  def create
    Article.create(permitparams)
    redirect_to articles_path
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    Article.find(params[:id]).update(permitparams)
    redirect_to articles_path
  end

  def destroy
    Article.find(params[:id]).destroy
    redirect_to articles_path
  end


  private

  def permitparams
    return params.require("article").permit(:title, :content)
  end
end
