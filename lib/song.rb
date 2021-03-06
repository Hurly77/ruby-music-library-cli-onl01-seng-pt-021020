require 'pry'
class Song
attr_accessor :name
attr_reader :artist

@@all = []

def initialize(name, artist = nil, genre = nil)
  @name = name
  if artist != nil
  self.artist = artist
    end
  if genre != nil
    self.genre = genre
  end
end

def self.all
  @@all
end

def self.destroy_all
  @@all.clear
end

def save
  @@all << self
end

def self.create(name)
song = new(name)
song.save
song
end

def artist
@artist
end

def artist=(artist)
@artist = artist
artist.add_song(self)
end

def genre
  @genre
end

def genre=(genre)
 @genre = genre
 self.genre == self unless
  self.genre != self
 genre.songs << self unless
 genre.songs.include?(self)
 end

def self.find_by_name(name)
  all.find {|song| song.name == name}
end

def self.find_or_create_by_name(name)
  find_by_name(name) || create(name)
end

def self.new_from_filename(file)
 artist, song, genre = file.chomp(".mp3").split(" - ")
 artist = Artist.find_or_create_by_name(artist)
 genre = Genre.find_or_create_by_name(genre)
 new(song, artist, genre)
end

def self.create_from_filename(file)
  new_from_filename(file).save

end

end
