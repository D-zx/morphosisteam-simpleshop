require 'rails_helper'

RSpec.describe ProductOrder, :type => :model do
    
    before(:all) do
        Order.skip_callback(:create, :after, :set_payment) 
        ProductOrder.skip_callback(:create, :after, :update_product_stock)
        ProductOrder.skip_callback(:create, :after, :update_order)
        @product = create(:product)
        @order = build(:order)
        @order.save(:validate => false)
    end

    after(:all) do
        Order.set_callback(:create, :after, :set_payment) 
        ProductOrder.set_callback(:create, :after, :update_order)
        ProductOrder.set_callback(:create, :after, :update_product_stock)
    end
    
    subject { 
         described_class.new(quantity: 1,
                             order_id: @order.id,
                             product_id: @product.id
         )  
    }

    describe "Validations" do
        it "is valid with valid attributes" do
            expect(subject).to be_valid
        end

        it "is not valid over stock" do
            subject.quantity = 10
            expect(subject).to_not be_valid
        end
    end

    describe "Associations" do
        it { should belong_to(:order).without_validating_presence }
        it { should belong_to(:product).without_validating_presence }
    end

end

