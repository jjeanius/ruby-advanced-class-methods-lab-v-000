require 'pry'

class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.create
    song = self.new
    song.save
    song
  end

  def self.new_by_name(song_name)
    new_song = self.new
    new_song.name = song_name
    new_song
  end

  def self.create_by_name(song_name)
    song = self.new
    song.name = song_name
    song.save
    song
  end

  def self.find_by_name(song_name)
    self.all.detect { |song| song.name == song_name}
  end

  def self.find_or_create_by_name(song_name)
    self.find_by_name(song_name) || self.create_by_name(song_name)
  end

def self.alphabetical
  @@all.sort_by! {|song| song.name}
end

def self.new_from_filename(file_name)
  new_song = self.new
  binding.pry
  new_song.name = file_name.split(" - ")[1].split(".")[0]
  new_song.artist_name = file_name.split(" - ")[0]
  new_song
end

def self.create_from_filename(file_name)
  new_song = self.new
  new_song.save
  new_song.name = file_name.split(' - ')[1].split(".")[0]
  new_song.artist_name = file_name.split(" - ")[0]
  @@all << new_song
end

  def self.destroy_all  # Passed
    @@all.clear
  end

  def self.all  # Giving
    @@all
  end

  def save   # Giving
    self.class.all << self
  end

end
