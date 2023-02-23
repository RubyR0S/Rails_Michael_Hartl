class DeleteColumFromTable < ActiveRecord::Migration[5.1]
  def change
    remove_column :users, :remeber_digest
  end
end
