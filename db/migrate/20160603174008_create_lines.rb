class CreateLines < ActiveRecord::Migration[5.0]
  def change
    create_table :lines do |t|
      t.belongs_to :user, foreign_key: true
      t.belongs_to :tale, foreign_key: true
      t.text :content
      t.boolean :done, default: false
      t.timestamps
    end

    add_index :lines, :user_id
    add_index :lines, :tale_id
  end
end
