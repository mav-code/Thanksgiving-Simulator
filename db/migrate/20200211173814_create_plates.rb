class CreatePlates < ActiveRecord::Migration[5.2]
  def change
    create_table :plates do |t|
      t.integer :person_id
      t.integer :thanksgiving_id
    end
  end
end
