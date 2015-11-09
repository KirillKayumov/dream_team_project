class CreateAttachedImages < ActiveRecord::Migration
  def change
    create_table :attached_images do |t|
      t.references :attachable, polymorphic: true
      t.string :file_id

      t.timestamps
    end
  end
end
