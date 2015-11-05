class AddForeignKeysToRelationships < ActiveRecord::Migration
  def change
    add_foreign_key :relationships, :users
    add_foreign_key :relationships, :users, column: :follower_id
  end
end
