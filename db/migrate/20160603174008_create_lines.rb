class CreateLines < ActiveRecord::Migration[5.0]
  def change
    create_table :lines do |t|
      t.integer :user_id
      t.integer :tale_id
      t.text :content
      t.boolean :done, default: false
      t.timestamps
    end

    add_index :lines, :user_id
    add_index :lines, :tale_id
  end
end
