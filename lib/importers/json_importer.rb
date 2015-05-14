class JsonImporter < Importer
  def setup(string)
    @data = JSON.parse(string)
  end

  def import
    @name = @data["name"]
    @author = @data["author"]
    @metadata = @data["metadata"]

    unless @data["parts"].nil?
      @parts = @data["parts"].map { |part| Importer::Part.new(part["name"], part["content"]) }
    end
  end
end
