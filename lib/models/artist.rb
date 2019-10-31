class Artist
  attr_accessor :name
  attr_reader :songs
  @@all = []
  
  def initialize(name)
    @name = name
    @songs = []
  end
  
  def self.all
    @@all
  end
  
  def save
    Artist.all << self
    self
  end
  
  def self.destroy_all
    self.all.clear
  end
  
  def self.create(name)
    self.new(name).save
  end
  
  def add_song(song)
    @songs << song unless @songs.include?(song)
    song.artist = self if song.artist == nil
  end
  
end