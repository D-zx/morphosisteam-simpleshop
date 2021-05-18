require 'rails_helper'

RSpec.describe Order, :type => :model do
    
    before(:all) do
        Order.skip_callback(:create, :after, :set_payment)
        ProductOrder.skip_callback(:create, :after, :update_product_stock)
        ProductOrder.skip_callback(:create, :after, :update_order)
    end

    after(:all) do
        Order.set_callback(:create, :after, :set_payment) 
        ProductOrder.set_callback(:create, :after, :update_order)
        ProductOrder.set_callback(:create, :after, :update_product_stock)
    end
    
    subject { 
         described_class.new(name: "TEST",
                             address: "Yangon",
                             phone: "+959798452",
                             user_id: 1
         )  
    }

    
    describe "Validations" do
        it "is valid with valid attributes" do
            expect(subject).to be_valid
        end

        it "is not valid without a name" do
            subject.name = nil
            expect(subject).to_not be_valid
        end

        it "is not valid without an address" do
            subject.address = nil
            expect(subject).to_not be_valid
        end

        it "is not valid without an phone" do
            subject.phone = nil
            expect(subject).to_not be_valid
        end

        it "is not valid with different region" do
            @region1 = create(:region, title: "region1", currency: "currency1")
            @region2 = create(:region, title: "region2", currency: "currency2")
            @product1 = create(:product, title: "product1",stock: 3, region_id: @region1.id)
            @product2 = create(:product, title: "product2",stock: 3, region_id: @region2.id)
            subject.product_orders.build([{quantity: 1, product_id: @product1.id},{quantity: 1, product_id: @product2.id}])
            subject.save
            expect(subject).to_not be_valid
        end
    end

    describe "Associations" do
        it { should have_many(:product_orders) }
        it { should have_many(:products) }
        it { should belong_to(:user).without_validating_presence }
        it { should have_one(:payment) }
    end

end

