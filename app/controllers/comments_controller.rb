class CommentsController < ApplicationController
    before_action :is_admin?, only: [:destroy]
    
    def create
       @post = Post.find(params[:post_id])
       @comment = @post.comments.new(comment_params)
       @comment.user_id = current_user.id
       if @comment.save
           redirect_to @post
       else
           render 'posts/show'
       end
    end
    
    def destroy
        
    end
    
    
    private
    
        def comment_params
            params.require(:comment).permit(:content, :post_id)
        end
   
end