class CreatePortfolios < ActiveRecord::Migration
  def change
    create_table :portfolios do |t|
      t.string :user_id
      t.string :script_symbol
      t.string :buyorsale
      t.string :quantity
      t.string :user_price

      t.timestamps
    end
  end
end
