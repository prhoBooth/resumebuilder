class CreateSavedStatements < ActiveRecord::Migration
  def change
    create_table :saved_statements do |t|
      t.integer :statement_id
      t.integer :resume_id

      t.timestamps

    end
  end
end
