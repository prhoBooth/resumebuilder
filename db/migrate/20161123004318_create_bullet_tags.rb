class CreateBulletTags < ActiveRecord::Migration
  def change
    create_table :bullet_tags do |t|
      t.integer :bullet_id
      t.integer :tag_id

      t.timestamps

    end
  end
end
