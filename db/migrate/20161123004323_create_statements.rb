class CreateStatements < ActiveRecord::Migration
  def change
    create_table :statements do |t|
      t.integer :user_id
      t.text :body
      t.string :category

      t.timestamps

    end
  end
end
