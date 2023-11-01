class AddStatusToCompanies < ActiveRecord::Migration[7.0]
  def change
    add_column :companies, :status, :string, default: 'pending'
  end
end
