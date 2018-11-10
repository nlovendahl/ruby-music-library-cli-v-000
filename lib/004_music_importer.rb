class MusicImporter

  attr_accessor :path

  def initialize(path)
    @path = path
  end

  def files
    files = Dir["#{self.path}/**/*.mp3"]
    files.map {|file| File.basename(file)}
  end


  def self.import
    files.each do |filename|
      Song.new_from_filename(filename)
    end
  end

end
