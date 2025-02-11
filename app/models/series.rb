class Series < ApplicationRecord
  validates :title, presence: true, length: { minimum: 2, maximum: 100 }
  validates :description, presence: true, length: { minimum: 10, maximum: 1000 }
  validates :rating, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 10 }
  validates :release_date, presence: true
  validates :no_of_seasons, numericality: { only_integer: true, greater_than_or_equal_to: 1, less_than: 50 }
  validates :category, presence: true
  validates :image_url, format: { with: URI::DEFAULT_PARSER.make_regexp(%w[http https]), message: "must be a valid URL" }, allow_blank: true
  def self.ransackable_attributes(auth_object = nil)
    ["title", "rating", "release_date"]
  end
end
