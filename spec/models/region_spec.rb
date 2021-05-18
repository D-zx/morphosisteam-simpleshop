require 'rails_helper'

RSpec.describe Region, :type => :model do
    subject { 
         described_class.new(title: "TestRegion", 
                             country: "testcountry",
                             currency: "Test",
                             tax: 7
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

        it "is not valid without an country" do
            subject.country = nil
            expect(subject).to_not be_valid
        end

        it "is not valid without an currency" do
            subject.currency = nil
            expect(subject).to_not be_valid
        end

        it "is not valid without an tax" do
            subject.tax = nil
            expect(subject).to_not be_valid
        end
    end

    describe "Associations" do
        it { should respond_to(:products) }
    end

end