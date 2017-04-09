class CreateApprovals < ActiveRecord::Migration[5.0]
  def change
    create_table :approvals do |t|
      t.references :user
      t.references :article
      t.boolean :is_approved
      t.datetime :approved_at
    end
  end
end
