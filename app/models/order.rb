class Order < ApplicationRecord
    validates_presence_of :name, :address, :phone
    validate :validate_region
    
    has_many :product_orders
    has_many :products, through: :product_orders
    belongs_to :user
    has_one :payment
    validates_associated :product_orders
    after_create :set_payment

    def currency
        self.regions.first.currency
    end

    def tax
        tax_percent = 0.0
        tax_percent = self.regions.first.tax
        tax_percent/100
    end

    def update_total_amount
        tax = self.total_price + self.tax
    end

    def regions
        Region.find_by_sql(['
                 SELECT r.* FROM regions r
                    INNER JOIN "products" p ON p.region_id = r.id
                    INNER JOIN "product_orders" po ON po.product_id = p.id
                    WHERE po.order_id = ?', self.id])
    end

    def validate_region
        if self.regions.pluck(:title).uniq.size > 1
            errors.add(:product, "all products should be same region")
        end
    end

    private
    def set_payment
        method = ["Paypal", "Visa", "Master", "Bank"]
        @payment = self.create_payment(method: method.sample)
        @payment.save
        status = ["success", "fail"]
        UpdatePaymentStatusWorker.perform_at(1.minutes.from_now, @payment.id, status.sample)
    end

end
