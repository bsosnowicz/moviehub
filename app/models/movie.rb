class Movie < ApplicationRecord
  validates :title, presence: true, length: { minimum: 2, maximum: 100 }
  validates :description, presence: true, length: { minimum: 10, maximum: 1000 }
  validates :rating, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 10 }
  validates :release_date, presence: true
  validates :length, numericality: { only_integer: true, greater_than: 30, less_than: 300 }
  validates :category, presence: true
  has_one_attached :my_file
  validates :image_url, format: { with: URI::DEFAULT_PARSER.make_regexp(%w[http https]), message: "must be a valid URL" }, allow_blank: true

  def self.ransackable_attributes(auth_object = nil)
    ["created_at", "description", "id", "length", "rating", "release_date", "title", "updated_at"]
  end

  def self.ransackable_associations(auth_object = nil)
    []
  end
end