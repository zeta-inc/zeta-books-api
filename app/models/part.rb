class Part < ActiveRecord::Base
  belongs_to :document
  
  belongs_to :next, class_name: "Part"
  belongs_to :previous, class_name: "Part"
end
