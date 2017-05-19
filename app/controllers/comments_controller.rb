class CommentsController < ApplicationController
    
	def index
		@article = Article.find(params[:article_id])
		@comments=@article.comment.all;
		json_response(@comments, @article,:created)
	end
	
    def new
		@article=Article.new
	end

	def create
		puts params
		@article = Article.find(params[:article_id])
        @comments = @article.comment.create(commenter: params[:commenter],body: params[:body])
        @comments.save
        #json_response(@comments,:created)
        #redirect_to article_comment_path(@comments) 
        redirect_to article_comment_url(id: @comments.id)
        
    end
    def show 
        @article = Article.find(params[:article_id])
        @comments = @article.comment.find(params[:id])
        json_response(@article,@comments,:created)
    end

    private  def comment_params
    	 params.require(:comment).permit(:commenter,:body)
    end
    def json_response(object,object2, status = :ok)
    
    render :json => {
     :o1 => object.as_json,
     :o2 => object2.as_json
   }
  end
end
