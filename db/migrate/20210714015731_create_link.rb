class CreateLink < ActiveRecord::Migration[5.2]
  def change
    create_table :links do |t|
      t.string :slug
      t.string :origional_url
      t.integer :hits
    end
  end
end
