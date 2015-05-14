require 'epub/parser'

class EpubImporter < Importer
  def setup(path)
    @epub = EPUB::Parser.parse(path)
  end

  def import
    @author = @epub.metadata.creators[0].content

    @epub.resources.each { |res| @parts << res.read unless res.media_type.include?('css') }
  end
end
