class CreateParts < ActiveRecord::Migration
  def change
    create_table :parts do |t|
      t.string :name
      t.json :metadata
      t.text :content
      t.references :next, references: :parts, index: true
      t.references :previous, references: :parts, index: true
      t.references :document, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
