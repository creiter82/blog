class PostsController < ApplicationController
    before_action :is_admin?, except: [:index, :show]
    
    def index
        @posts = Post.all
    end
    
    def new
        @post = Post.new 
    end
    
    def create 
        @post = Post.new(post_params)
        @post.user_id = current_user.id
        if @post.save
          flash[:notice] = "#{@post.title} was created"
          redirect_to posts_path
        else 
            render 'new'
        end
    end
    
    def edit
       @post = Post.find(params[:id]) 
    end
    
    def update
       @post = Post.find(params[:id])
       if @post.update(post_params)
           flash[:success] = "#{@post.title} has been edited"
           redirect_to posts_path
       else
           render 'edit'
       end
    end
    
    def show
       @post = Post.find(params[:id]) 
       @comment = Comment.new(post_id: @post.id)
       @comments = @post.comments.order("created_at DESC").all
    end
    
    
    private
    
        def post_params
           params.require(:post).permit(:title, :content) 
        end
    
end