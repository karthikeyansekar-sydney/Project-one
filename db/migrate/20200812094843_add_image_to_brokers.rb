class AddImageToBrokers < ActiveRecord::Migration[5.2]
  def change
    add_column :brokers, :image, :text
  end
end
