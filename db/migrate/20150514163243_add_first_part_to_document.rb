class AddFirstPartToDocument < ActiveRecord::Migration
  def change
    add_reference :documents, :first_part, references: :parts, index: true
  end
end
