class Document < ActiveRecord::Base
  belongs_to :author
  belongs_to :first_part, class_name: "Part"
end
