class JsonImporter < Importer
  def setup(string)
    @data = JSON.parse(string)
  end

  def import
    ["name", "author", "metadata"].each do |attribute|
      instance_variable_set(attribute, @data.fetch(attribute, ""))
    end
    
    @name = @data["name"]
    @author = @data["author"]
    @metadata = @data["metadata"]

    unless @data["parts"].nil?
      @parts = @data["parts"].map { |part| Importer::Part.new(part["name"], part["content"]) }
    end
  end
end
