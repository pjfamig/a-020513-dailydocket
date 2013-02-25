class Comment < ActiveRecord::Base
  belongs_to :post
  attr_accessible :body, :commenter, :post_id, :user_id
end
