class RenameDatabaseColumn < ActiveRecord::Migration
  def up
    rename_column :receivers, :user_create, :user_id
  end

  def down
    rename_column :receivers, :user_id, :user_create
  end
end
