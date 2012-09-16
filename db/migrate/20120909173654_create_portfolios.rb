class CreatePortfolios < ActiveRecord::Migration
  def change
    create_table :portfolios do |t|
      t.integer :user_id
      t.string :script_symbol
      t.string :buyorsale
      t.integer :quantity
      t.integer :user_price

      t.timestamps
    end
  end
end
