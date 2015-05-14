class Importer
  # Base class for importers. It should not be directly instanciated.
  def initialize
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
