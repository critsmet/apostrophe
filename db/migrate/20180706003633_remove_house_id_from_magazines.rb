class RemoveHouseIdFromMagazines < ActiveRecord::Migration[5.2]
  def change
    remove_column :zines, :house_id
  end
end
