class AddWalletToOrders < ActiveRecord::Migration[5.2]
  def change
    add_column :orders, :wallet, :decimal, default: 10000
  end
end
