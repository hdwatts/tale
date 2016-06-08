class CreateTales < ActiveRecord::Migration[5.0]
  def change
    create_table :tales do |t|
      t.string :title
      t.string :prompt
      t.integer :owner_id
      t.boolean :open, default: true
      t.timestamps
    end

    add_index :tales, :owner_id
  end
end