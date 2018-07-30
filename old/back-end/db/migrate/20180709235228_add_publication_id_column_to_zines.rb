class AddPublicationIdColumnToZines < ActiveRecord::Migration[5.2]
  def change
    add_column :zines, :publication_id, :integer
  end
end
