class ProductOrder < ApplicationRecord
  belongs_to :order, inverse_of: :product_orders
  belongs_to :product, inverse_of: :product_orders
  validate :validate_stock
  after_create :update_order, :update_product_stock

  def validate_stock
    if self.product.stock < self.quantity
        errors.add(:quantity, "cant be grater than stock")
    end
  end

  private
  def update_order
    price = self.product.price * 3
    total_price = self.order.total_price + price
    self.order.total_price=total_price
    tax = self.order.tax
    total_amount= total_price + (total_price * tax)
    self.order.update_attributes(total_price: total_price, total_amount: total_amount)
  end

  def update_product_stock
    product= self.product
    stock = self.product.stock - self.quantity
    self.product.update_attributes(stock: stock)
  end

end
