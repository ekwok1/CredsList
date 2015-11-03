require 'rails_helper'

describe Item do
  
  [:name, :description, :pic_url, :price].each do |prop|
    it { should respond_to prop }
  end

  it { should validate_presence_of :name }
  it { should validate_presence_of :description }
  it { should validate_presence_of :pic_url }
  it { should validate_presence_of :price }

  it { should belong_to :user }
  it { should have_one :txn }

end
