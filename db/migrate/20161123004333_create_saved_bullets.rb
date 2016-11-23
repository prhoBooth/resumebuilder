class CreateSavedBullets < ActiveRecord::Migration
  def change
    create_table :saved_bullets do |t|
      t.integer :bullet_id
      t.integer :resume_id

      t.timestamps

    end
  end
end
