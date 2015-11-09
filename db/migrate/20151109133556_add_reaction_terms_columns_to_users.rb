class AddReactionTermsColumnsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :term_for_positive_reaction, :string, null: false, default: "Like"
    add_column :users, :term_for_negative_reaction, :string, null: false, default: "Dislike"
  end
end
