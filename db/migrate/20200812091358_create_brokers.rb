class CreateBrokers < ActiveRecord::Migration[5.2]
  def change
    create_table :brokers do |t|
      t.text :name
      t.text :agency
      t.text :phno
      t.text :mailid

      t.timestamps
    end
  end
end
