class CreateReactions < ActiveRecord::Migration
  def change
    create_table :reactions do |t|
      t.boolean :positive, null: false, default: true
      t.integer :reactive_id, index: true
      t.string :reactive_type, index: true
      t.references :user, index: true
    end
  end
end
