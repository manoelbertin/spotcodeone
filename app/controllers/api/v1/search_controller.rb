class Api::V1::SearchController < ApplicationController
  def index
    @songs = Song.where('title ILIKE ?', "%#{params[:query]}%")
    @albums = Album.where('title ILIKE ?', "%#{params[:query]}%")
    @artists = Artist.where('name ILIKE ?', "%#{params[:query]}%")
  end
end
