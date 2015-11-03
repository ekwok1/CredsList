require 'rails_helper'

describe Txn do
  
  [:buyer_id, :seller_rating, :buyer_rating].each do |prop|
    it { should respond_to prop }
  end

  it { should belong_to :user }
  it { should belong_to :item }

end
