require 'rails_helper'

RSpec.describe Product, :type => :model do
    
    before(:all) do
        @region = create(:region)
    end
    
    subject { 
         described_class.new(title: "testProduct", 
                             price: 3000,
                             sku: "TEST_sku",
                             stock: 3,
                             region_id: @region.id
         )  
    }

    describe "Validations" do
        it "is valid with valid attributes" do
            expect(subject).to be_valid
        end

        it "is not valid without a title" do
            subject.title = nil
            expect(subject).to_not be_valid
        end

        it "is not valid without an price" do
            subject.price = nil
            expect(subject).to_not be_valid
        end

        it "is not valid without an sku" do
            subject.sku = nil
            expect(subject).to_not be_valid
        end

        it "is not valid without an stock" do
            subject.stock = nil
            expect(subject).to_not be_valid
        end
    end

    describe "Associations" do
        it { should belong_to(:region).without_validating_presence }
        it { should have_many(:product_orders) }
        it { should have_many(:orders) }
    end

end