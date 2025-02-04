class Movie < ApplicationRecord
  def self.ransackable_attributes(auth_object = nil)
    ["created_at", "description", "id", "length", "rating", "release_date", "title", "updated_at"]
  end
  def self.ransackable_associations(auth_object = nil)
    []
  end
end
