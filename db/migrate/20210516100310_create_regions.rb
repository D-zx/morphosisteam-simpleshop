class CreateRegions < ActiveRecord::Migration[6.0]
  def change
    create_table :regions do |t|
      t.string :title,        null: false, default: ""
      t.string :country,      null: false, default: ""
      t.string :currency,     null: false, default: ""
      t.float :tax,         null: false, default: ""

      t.timestamps
    end
  end
end
