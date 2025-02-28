class Funding < ApplicationRecord
  belongs_to :user
  has_many :payment
  has_many :contributors, through: :payments, source: :user
end
