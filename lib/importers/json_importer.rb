class JsonImporter < Importer
  def setup(string)
    @data = JSON.parse(string)
  end

  def import
    @name = @data["name"]
    @author = @data["author_name"]
    @metadata = @data["metadata"]

    unless @data["parts"].nil?
      @parts = @data["parts"].map { |part| Importer::BookPart.new(part["name"], part["content"]) }
    end
  end
end

# '{"name": "Le Rouge et le Noir", "author_name": "Stendhal", "parts": [{"name": "Chapitre 1", "content": "Lorem ipsum"}, {"name": "Chapitre 2", "content": "dolor sit amet"}]}'
