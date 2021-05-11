class AddUseridToArticle < ActiveRecord::Migration[5.2]
  def change
    add_column :articles, :userid, :integer
  end
end
