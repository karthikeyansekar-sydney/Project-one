class RemoveImageFromProperties < ActiveRecord::Migration[5.2]
  def change
    remove_column :properties, :image, :text
  end
end
