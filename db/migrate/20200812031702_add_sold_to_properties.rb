class AddSoldToProperties < ActiveRecord::Migration[5.2]
  def change
    add_column :properties, :sold, :boolean, :default => false
  end
end
