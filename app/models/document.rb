class Document < ActiveRecord::Base
  belongs_to :author
  belongs_to :first_part, class_name: "Part"

  before_save :set_parts_ids

  def set_parts_ids
    self.parts_ids = [] if self.parts_ids.nil?
  end
end
