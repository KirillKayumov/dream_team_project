class RemoveTitleColumnFromPosts < ActiveRecord::Migration
  def change
    remove_column :posts, :title, :text
  end
end
