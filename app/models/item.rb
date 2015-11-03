class Item < ActiveRecord::Base
  
  validates :name, :description, :pic_url, :price, presence: true

  belongs_to :user
  has_one :txn
  
end

