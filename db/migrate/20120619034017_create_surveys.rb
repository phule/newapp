class CreateSurveys < ActiveRecord::Migration
  def change
    create_table :surveys do |t|
      t.integer :num_question
      t.date :date
      t.integer :responses
      t.float :percent_responses
      t.string :vs_other_companies
      t.string :add_note

      t.timestamps
    end
  end
end
