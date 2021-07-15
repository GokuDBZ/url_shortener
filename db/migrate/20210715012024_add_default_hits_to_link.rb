class AddDefaultHitsToLink < ActiveRecord::Migration[5.2]
  def change
    change_column :links, :hits, :integer, :default => 0
  end
end
