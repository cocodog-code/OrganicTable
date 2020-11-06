class CreateStores < ActiveRecord::Migration[6.0]
  def change
    create_table :stores do |t|
      t.string :name
      t.string :genre
      t.string :phone
      t.string :access
      t.string :hour
      t.string :website
      t.string :address

      t.timestamps
    end
  end
end
