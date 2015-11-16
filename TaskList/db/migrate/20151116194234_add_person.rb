class AddPerson < ActiveRecord::Migration
  def change
    add_column :tasks, :person_id, :integer
    add_index :tasks, :person_id
  end
end
