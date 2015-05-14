require 'epub/parser'

class EpubImporter < Importer
  def setup(path)
    @epub = EPUB::Parser.parse(path)
  end

  def import
    @author = @epub.metadata.creators[0].content

    @epub.resources.each do |res|
      unless res.media_type.include?('css')
        @parts << res.read
      end
    end
  end
end
