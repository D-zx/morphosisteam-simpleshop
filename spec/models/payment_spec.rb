require 'rails_helper'

RSpec.describe Payment, :type => :model do
    
    describe "Associations" do
        it { should belong_to(:order).without_validating_presence }
    end

end