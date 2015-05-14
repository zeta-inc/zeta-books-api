class CreateAuthors < ActiveRecord::Migration
  def change
    create_table :authors do |t|
      t.string :author_name
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
