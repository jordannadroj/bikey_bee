class AddPictureToBikes < ActiveRecord::Migration[6.0]
  def change
    add_column :bikes, :picture, :string
  end
end
