class AddWallpaperIdColumnToUsers < ActiveRecord::Migration
  def change
    add_column :users, :wallpaper_id, :string
  end
end
