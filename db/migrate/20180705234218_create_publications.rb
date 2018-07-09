class CreatePublications < ActiveRecord::Migration[5.2]
  def change
    create_table :publications do |t|
      t.integer :publisher_id
      t.string :publisher_type
      t.integer :zine_id

      t.timestamps
    end
  end
end
