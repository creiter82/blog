class Post < ActiveRecord::Base
    belongs_to :user
    has_many   :comments
    validates  :title, :content, presence: true
    
    def comments_count
        comments.count
    end
    
end
