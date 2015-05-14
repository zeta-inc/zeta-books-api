class CreateDocuments < ActiveRecord::Migration
  def change
    create_table :documents do |t|
      t.string :name
      t.json :metadata
      t.json :parts_ids
      t.references :author, index: true, foreign_key: true
      
      t.timestamps null: false
    end
  end
end
