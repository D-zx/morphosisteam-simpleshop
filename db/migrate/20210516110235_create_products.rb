class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.string :title         
      t.text :description    
      t.string :image          
      t.float :price          
      t.string :sku           
      t.integer :stock         
      t.references :region, foreign_key: true

      t.timestamps
    end
  end
end
