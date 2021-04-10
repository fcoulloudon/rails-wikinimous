class ArticlesController < ApplicationController
  def index
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
  end

  def create
    @article = Article.new(article_params)
    @article.save
    redirect_to articles_path
  end

  def new
    @article = Article.new
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])
    @article.update(article_params)
    # Will raise ActiveModel::ForbiddenAttributesError
    redirect_to article_path
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    # no need for app/views/articles/destroy.html.erb
    redirect_to articles_path
  end

  private

  def restaurant_params
    params.require(:article).permit(:title, :content)
  end

end
