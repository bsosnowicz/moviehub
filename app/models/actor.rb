class Actor < ApplicationRecord
  validates :name, presence: true, length: { minimum: 2, maximum: 50 }
  validates :surname, presence: true, length: { minimum: 2, maximum: 50 }
  validates :date_of_birth, presence: true
  validates :place_of_birth, presence: true
  validates :height, numericality: { only_integer: true, greater_than: 50, less_than: 250 }
  validates :rating, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 10 }
  has_one_attached :my_file
  validates :image_url, format: { with: URI::DEFAULT_PARSER.make_regexp(%w[http https]), message: "must be a valid URL" }, allow_blank: true
    ["name", "surname", "rating"]

  has_and_belongs_to_many :movies
  has_and_belongs_to_many :series
  end
