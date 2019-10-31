require 'pry'
class Song
  attr_accessor :name
  attr_reader :artist, :genre
  @@all = []
  
  def initialize(name, artist = nil, genre = nil)
    @name = name
    artist.add_song(self) unless artist == nil
    self.genre = genre unless genre == nil
  end
  
  def self.all
    @@all
  end
  
  def save
    Song.all << self
    self
  end
  
  def self.destroy_all
    self.all.clear
  end
  
  def self.create(name)
    self.new(name).save
  end
  
  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end
  
  def genre=(genre)
    @genre = genre
    genre.songs << self unless genre.songs.include?(self)
  end
  
  def Song.new_from_filename(filename)
    name = filename.split("-")[1]
    song = Song.create(name)
    artist = Artist.create(filename.split("-")[0])
    genre = Genre.create(filename.split("-")[2].split(".").shift)
    binding.pry
  end
end