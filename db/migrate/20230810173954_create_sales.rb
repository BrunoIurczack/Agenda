class CreateSales < ActiveRecord::Migration[7.0]
  def change
    create_table :sales do |t|
      t.references :product, null: false, foreign_key: true
      t.references :company, null: false, foreign_key: true
      t.integer :amount_cents
      t.integer :product_number

      t.timestamps
    end
  end
end
