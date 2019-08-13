pclass CreateLineItems < ActiveRecord::Migration[6.0]
  def change
    create_table :line_items do |t|
      t.string :name
      t.decimal :price
      t.integer :quantity
      t.string :description
      t.belongs_to :offer, null: false, foreign_key: true

      t.timestamps
    end
  end
end
