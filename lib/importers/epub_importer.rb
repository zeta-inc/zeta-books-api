require 'epub/parser'

class EpubImporter < Importer
  def setup(path)
    @epub = EPUB::Parser.parse(path)
  end

  def import
    @name = @epub.metadata.title
    @author = @epub.metadata.creators[0].content

    @epub.resources.each do |res|
      @parts << Importer::BookPart.new("", res.read) unless res.media_type.include?('css')
    end
  end
end
