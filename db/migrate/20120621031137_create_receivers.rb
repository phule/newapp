class CreateReceivers < ActiveRecord::Migration
  def change
    create_table :receivers do |t|
      t.string :name
      t.string :email
      t.integer :user_create

      t.timestamps
    end
  end
end
