class RenameTransferBalanceCents < ActiveRecord::Migration[7.0]
  def change
    rename_column :transfers, :balance_cents, :amount_cents
  end
end
