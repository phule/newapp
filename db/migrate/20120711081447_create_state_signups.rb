class CreateStateSignups < ActiveRecord::Migration
  def change
    create_table :state_signups do |t|
      t.string :email
      t.integer :active
      t.string :token_signup
      t.timestamps
    end
  end
end
