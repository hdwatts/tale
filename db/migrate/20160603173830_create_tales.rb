class CreateTales < ActiveRecord::Migration[5.0]
  def change
    create_table :tales do |t|
      t.string :title
      t.string :prompt
      t.integer :owner_id, foreign_key: true
      t.boolean :open, default: true
      t.timestamps
    end
  end
end