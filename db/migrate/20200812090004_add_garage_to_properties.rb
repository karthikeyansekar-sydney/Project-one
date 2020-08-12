class AddGarageToProperties < ActiveRecord::Migration[5.2]
  def change
    add_column :properties, :garage, :integer
  end
end
