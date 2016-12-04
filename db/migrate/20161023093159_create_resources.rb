class CreateResources < ActiveRecord::Migration
  def change
    create_table :resources do |t|
      t.string :name
      t.text :description
      t.string :link
      t.date :last_modified
	  t.integer :user_id
	  t.integer :score
	  t.references :category, foreign_key: true

      t.timestamps
    end
  end
end
