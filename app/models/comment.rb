class Comment < ActiveRecord::Base
  validates :comment, presence: true
  belongs_to :item
  # Added 1 to many relationship, user and comments
  belongs_to :user
end
