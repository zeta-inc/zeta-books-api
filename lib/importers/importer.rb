class Importer
  # Representation of a Part in an importer
  BookPart = Struct.new(:name, :content)

  # Base class for importers. It should not be directly instanciated.
  def initialize
    @name = ''
    @author = ''
    @metadata = {}
    @parts = []
  end

  def setup

  end

  # Called before retrieving results, performs the actual import
  def import

  end

  def create
    author = Author.find_or_create_by(author_name: @author)

    document = Document.create(name: @name, metadata: @metadata, author: author)

    parts_ids = []
    previous_part = nil
    @parts.each do |part|
      p = Part.create(name: part.name, content: part.content, document: document)

      # no previous part == first part
      if previous_part.nil?
        document.first_part = p
      else
        previous_part.next = p
        p.previous = previous_part

        previous_part.save
        p.save
      end

      parts_ids << p.id
      previous_part = p
    end

    document.parts_ids = parts_ids
    document.save
  end
end
