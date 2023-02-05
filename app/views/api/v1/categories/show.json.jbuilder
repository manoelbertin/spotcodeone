
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
json.name @category.name
json.image_url url_for(@category.image)
 
json.songs @category.songs.each do |song|
  json.id song.id
  json.title song.title
  json.artist_name song.album.artist.name
  json.file_url url_for(song.file)
end
 
json.artists @category.artists.each do |artist|
  json.id artist.id
  json.name artist.name
  json.photo_url url_for(artist.photo)
end
 
json.albums @category.albums.each do |album|
  json.id album.id
  json.title album.title
  json.artist_name album.artist.name
  json.cover_url url_for(album.cover)
end