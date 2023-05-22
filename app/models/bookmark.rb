class Bookmark < ApplicationRecord
  belongs_to :movie
  belongs_to :list

  validates :comment, length: { minimum: 6 }, allow_blank: true
  validates :movie_id && :list_id, uniqueness: true
end
