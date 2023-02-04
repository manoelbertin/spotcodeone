
1
2
3
4
5
6
7
8
9
10
11
12
13
14
15
16
17
18
19
20
21
22
23
24
25
class Api::V1::DashboardController < ApplicationController
  def index
    load_recent_heard
    load_recommendations
  end
 
 
  private
 
 
  def load_recent_heard
    @recent_albums = current_user.recently_heards.order("created_at DESC").limit(4).map(&:album)
  end
 
 
  def load_recommendations
    heard_categories = @recent_albums.map(&:category)
    if heard_categories.present?
      @recommended_albums = Album.joins(:category, :songs).where(category: heard_categories)
                                 #.order('songs.played_count')
                                 .select('distinct albums.*').limit(12)
    else
      @recommended_albums = Album.all.limit(12)
    end
  end
end