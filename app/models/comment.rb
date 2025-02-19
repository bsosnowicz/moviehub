class Comment < ApplicationRecord
  after_create_commit { broadcast_append_to("comments") }
  belongs_to :user
  belongs_to :movie, optional: true
  belongs_to :series, optional: true
  belongs_to :actors, optional: true

  validates :content, presence: true
end
