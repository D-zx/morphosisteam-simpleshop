class Region < ApplicationRecord
    validates_presence_of :title, :country, :currency, :tax
    has_many :products

end
