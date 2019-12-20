class Artist < ApplicationRecord
  has_many :albums,
    class_name: 'Album',
    foreign_key: :artist_id,
    primary_key: :id

  def n_plus_one_tracks
    albums = self.albums
    tracks_count = {}
    albums.each do |album|
      tracks_count[album.title] = album.tracks.length
    end

    tracks_count
  end

  # Count all of the tracks on each album by a given artist.

  def better_tracks_query
    albums = self.albums.select('albums.*, COUNT(*) AS count_track').joins(:tracks).group('albums.id')

    tracks_count = {}
    albums.each { |album| tracks_count[album.title] = album.count_track }
    
    tracks_count
  end
end
