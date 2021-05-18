class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.string :name         
      t.string :address
      t.string :phone    
      t.text :summary          
      t.float :total_price , default: 0.0      
      t.float :total_amount , default: 0.0          
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
