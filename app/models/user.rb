class User < ApplicationRecord
  has_many :playlists
  validates :name, uniqueness: true
end
