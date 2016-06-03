class CreateTagsTales < ActiveRecord::Migration[5.0]
  def change
    create_table :tags_tales do |t|
      t.integer :tag_id
      t.integer :tale_id
    end
  end
end
