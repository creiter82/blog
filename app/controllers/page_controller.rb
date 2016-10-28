class PageController < ApplicationController
    
    def index
        @posts = Post.all.order('created_at DESC').take(5)
        @comments = Post.all.sort_by(&:comments_count).reverse.take(5)
    end
    
end