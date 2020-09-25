class CreateProfiles < ActiveRecord::Migration[6.0]
  def change
    create_table :profiles do |t|
      t.string :postal, null: false
      t.integer :prefecture_id, null: false
      t.string :city, null: false
      t.string :house_number, null: false
      t.string :building
      t.string :phone_number, null: false
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
