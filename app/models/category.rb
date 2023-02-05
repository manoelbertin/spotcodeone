class Category < ApplicationRecord
  has_many :albums

  validates :name, presence: true
  has_one_attached :image

  def artists
    Artist.join(:albums).where(albums: { id: self.albums.ids })
  end

  def songs
  end
end
