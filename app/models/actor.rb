class Actor < ApplicationRecord
  def self.ransackable_attributes(auth_object = nil)
    ["name", "surname", "rating"]
  end
end
