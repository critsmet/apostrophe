class CreatePublications < ActiveRecord::Migration[5.2]
  def change
    create_table :publications do |t|
      t.string :title
      t.string :tagline, :null => true
      t.string :url
      t.string :cover_image_url
      t.string :description
      t.string :email, :null => true
      t.string :team, :null => true
      t.string :genres
      t.string :tags
      t.integer :apostrophe_publisher_id, default: "null"
      t.timestamps
    end
  end
end
