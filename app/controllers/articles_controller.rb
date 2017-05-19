class ArticlesController < ApplicationController
  def index
    puts "hello there"
    @articles = Article.all
    #json_response(@articles,:created)
  end
 
  def show
    @article = Article.find(params[:id])
    
    @comments= Comment.all.where('article_id': params[:id])
    
     #json_response(@article,:created)

  end
 
  def new
    
  end
  def edit
    @article = Article.find(params[:id])
     json_response(@article,:created)
  end
 
  def create
    @article = Article.new(article_params)

    if @article.save
      json_response(@article)
    else
      render 'new'
    end
  end
 
  def update
    @article = Article.find(params[:id])
 
    if @article.update(article_params)
      redirect_to @article
    else
      render 'edit'
    end
  end
 
  def destroy
    @article = Article.find(params[:id])
    @article.destroy
 
    redirect_to articles_path
  end
 
  private
    def article_params
      params.require(:article).permit(:title, :text)
    end
    def json_response(object, status = :ok)
    render json: object, status: status
  end
end