class CreatePayments < ActiveRecord::Migration[6.0]
  def change
    create_table :payments do |t|
      t.string :method
      t.integer :status, default: 0
      t.references :order, foreign_key: true
      t.timestamps
    end
  end
end
