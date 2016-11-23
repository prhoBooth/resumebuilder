class CreateBullets < ActiveRecord::Migration
  def change
    create_table :bullets do |t|
      t.integer :organization_id
      t.integer :user_id
      t.string :type
      t.string :body

      t.timestamps

    end
  end
end
