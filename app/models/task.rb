class Task < ApplicationRecord
  belongs_to :user
  # dependent: :destroy == ensures that all tasks associated with a user are deleted when that user is deleted.
  validates :title, presence: true
end
