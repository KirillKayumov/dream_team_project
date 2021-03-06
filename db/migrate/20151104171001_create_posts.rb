class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title, default: "", null: false
      t.text :text, default: "", null: false
      t.references :user, index: true

      t.timestamps
    end
  end
end
