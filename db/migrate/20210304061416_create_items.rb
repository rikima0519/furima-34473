class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|

      t.string :name,           null: false
      t.integer :price,         null: false
      t.text :explain,          null: false
      t.integer :category_id,   null: false
      t.integer :status_id,     null: false
      t.integer :cost_id,       null: false
      t.integer :prefecture_id, null: false
      t.integer :by_send_id,    null: false
      t.references :user,       null: false, foreign_key: true
      t.references  :category, foreign_key: true 
      t.timestamps
    end
  end
end
