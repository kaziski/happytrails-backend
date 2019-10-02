class CreateTrails < ActiveRecord::Migration[5.2]
  def change
    create_table :trails do |t|
      t.string :name
      t.float :length
      t.string :url
      t.string :imgSmallMed
      t.string :summary
      t.decimal :longitude
      t.decimal :latitude
      t.integer :user_id
      t.timestamps
    end
  end
end
