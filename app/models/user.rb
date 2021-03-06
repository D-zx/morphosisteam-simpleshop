class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable

  enum role: {customer: 0, admin: 1}
  has_many :orders
  
  validates_presence_of :password, :email

  def activated?
    self.confirmed_at?
  end
end
