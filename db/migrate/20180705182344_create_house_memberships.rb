class CreateHouseMemberships < ActiveRecord::Migration[5.2]
  def change
    create_table :house_memberships do |t|
      t.references :house, foreign_key: true
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
