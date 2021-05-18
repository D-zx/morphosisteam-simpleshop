class Product < ApplicationRecord
    validates_presence_of :title, :price, :sku, :stock
    belongs_to :region
    mount_uploader :image, ImageUploader
    has_many :product_orders
    has_many :orders, through: :product_orders
end
