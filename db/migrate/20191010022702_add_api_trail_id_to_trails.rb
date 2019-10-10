class AddApiTrailIdToTrails < ActiveRecord::Migration[5.2]
  def change
    add_column :trails, :api_trail_id, :integer
  end
end
