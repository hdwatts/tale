class CreateTales < ActiveRecord::Migration[5.0]
  def change
    create_table :tales do |t|
      t.string :prompt
      t.integer :owner_id, foreign_key: true

      t.timestamps
    end
  end
end
