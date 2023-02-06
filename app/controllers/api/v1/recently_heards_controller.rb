class Api::V1::RecentlyHeardsController < ApplicationController
  def create
    @recently_heards = current_user.recently_heards.create(album_id: params[:album_id])
    @recently_heard.save
    head :ok
  end
end
