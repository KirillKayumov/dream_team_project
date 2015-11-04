class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.text :text, null: false, default: ""
      t.references :user, index: true
      t.references :post, index: true

      t.timestamps
    end
  end
end
