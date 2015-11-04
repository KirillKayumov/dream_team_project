class CreateRelationship < ActiveRecord::Migration
  def change
    create_table :relationships do |t|
      t.references :user, index: true
      t.references :follower, index: true
    end
  end
end
