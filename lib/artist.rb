require 'pry'
class Artist
extend Concerns::Findable
attr_accessor :name
@@all = []

def initialize(name)
  @name = name
  @songs = []
  end

def self.all
  @@all
end

def self.destroy_all
  @@all.clear
end

def save
  self.class.all << self
end

def self.create(artist)
  new_artist = Artist.new(artist)
  new_artist.save
  new_artist
end

def songs
   @songs
end

def add_song(song)
   song.artist = self unless
   song.artist
     @songs << song unless
     @songs.include?(song)
   end

def genres
  songs.map(&:genre).uniq
  end

end
