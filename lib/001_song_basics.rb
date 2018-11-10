class Song

  attr_accessor :name, :artist, :genre

  @@all = []

  def initialize(name, artist = "None", genre = "None")
    @name = name
    if artist != "None"
      self.artist=(artist)
    end
    if genre != "None"
      self.genre=(genre)
    end
  end

  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end

  def genre=(genre)
    @genre = genre
    genre.add_song(self)
  end

  def save
    @@all << self
  end

  def self.find_by_name(name)
    all.detect {|s| s.name == name}
  end

  def self.find_or_create_by_name(name)
    find_by_name(name) ? find_by_name(name) : create(name)
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all.clear
  end

  def self.create(name)
    song = Song.new(name)
    song.save
    song
  end

  def self.new_from_filename(filename)
    name = filename.split(" - ")[0]
    artist_name = filename.split(" - ")[1]
    song = self.new(name)
    song.artist = artist_name
    #artist = Artist.find_or_create_by_name(artist_name)
  end

  def self.create_from_filename(filename)
    song = self.new_from_filename(filename)
    song.save
  end

end