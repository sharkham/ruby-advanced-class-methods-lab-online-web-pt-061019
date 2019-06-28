require 'pry'

class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create
    new_song = self.new
    @@all << new_song
    new_song
  end

  def self.new_by_name(name)
    new_song = self.new
    new_song.name = name
    new_song
  end

  def self.create_by_name(name)
    new_song = self.new
    new_song.name = name
    self.all << new_song
    new_song
  end

  def self.find_by_name(song_name)
    self.all.find{|song| song.name == song_name}
  end

  def self.find_or_create_by_name(song_name)
    #use find_by_name on song_name, which is a string, to see if
    #there is an object with a name property matching that
    #string. If so, return the object.
    #If not, run create_by_name with that string.
    if self.find_by_name(song_name)
      self.find_by_name(song_name)
    else
      self.create_by_name(song_name)
    end
  end

  def self.alphabetical
    #need to access the string property in each object and sort
    #those alphabetically
    #NOPE need to iterate over the object itself and sort by name;
    #that sorts the entire object.
    self.all.sort do |a, b|
      a.name <=> b.name
    end
  end

#   def self.new_from_filename(filename)
#     new_song = self.new
#
# #   split_sentences = self.split(/[.?!]/)
# #   split_sentences.delete("")
#     delimiters = [' - ', '.']
#     filename2 = filename.split(Regexp.union(delimiters))
#     new_song.name = filename2[1]
#     new_song.artist_name = filename2[0]
#     new_song
#   end

  def self.new_from_filename(filename)
    new_song = self.new
    filename2 = filename.split(" - ")
    new_song.artist_name = filename2[0]
    song_name = filename2[1].chomp(".mp3")
    new_song.name = song_name
    new_song
  end

  def self.create_from_filename(filename)
    self.all << self.new_from_filename(filename)
  end

  def self.destroy_all
    self.all.clear
  end 
end
