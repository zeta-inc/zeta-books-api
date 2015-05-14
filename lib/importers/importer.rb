class Importer
  # Representation of a Part in an importer
  Part = Struct.new(:name, :content)

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
end
