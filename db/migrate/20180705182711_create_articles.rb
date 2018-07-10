class CreateArticles < ActiveRecord::Migration[5.2]
  def change
    create_table :articles do |t|
      t.string :title
      t.string :body
      t.references :issue, foreign_key: true

      t.timestamps
    end
  end
end