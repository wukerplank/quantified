class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.text :data, null: false
      t.integer :scope_id, null: false, index: true
      t.integer :event_type_id, null: false, index: true

      t.timestamps null: false
    end
  end
end
