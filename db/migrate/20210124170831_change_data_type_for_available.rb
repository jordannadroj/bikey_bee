class ChangeDataTypeForAvailable < ActiveRecord::Migration[6.0]
  def change
    change_column_default :bikes, :available, true
  end
end
