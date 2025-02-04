class Series < ApplicationRecord
  def self.ransackable_attributes(auth_object = nil)
    ["title", "rating", "release_date"]
  end
end
