class CreateOrganizations < ActiveRecord::Migration
  def change
    create_table :organizations do |t|
      t.string :organization
      t.string :start_month
      t.string :end_month
      t.integer :user_id

      t.timestamps

    end
  end
end
