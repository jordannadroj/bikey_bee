class CreateBikes < ActiveRecord::Migration[6.0]
  def change
    create_table :bikes do |t|
      t.string :name
      t.string :category
      t.string :size
      t.integer :price
      t.boolean :available
      t.string :location

      t.timestamps
    end
  end
end
