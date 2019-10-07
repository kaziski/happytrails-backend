class CreateReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
      t.string :comment
      t.integer :trail_id
      t.integer :api_trail_id
      t.string :api_trail_name
      t.string :api_trail_url
      t.integer :user_id
      t.timestamps
    end
  end
end
