class Playlist < ApplicationRecord
  belongs_to :user
  validates :user, uniqueness: true
  has_many :songs
end
