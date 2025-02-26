class User < ApplicationRecord
  has_secure_password
  has_many :sessions, dependent: :destroy
  has_many :comments, dependent: :destroy

  pay_customer stripe_attributes: :stripe_attributes

  alias_attribute :email, :email_address

  normalizes :email_address, with: ->(e) { e.strip.downcase }

  def stripe_attributes(pay_customer)
    {
      address:{
        city: pay_customer.owner.city,
        country: pay_customer.owner.country
      },
      metadata:{
        pay_customer_id: pay_customer.id,
        user_id: id
      }
    }
  end
end
