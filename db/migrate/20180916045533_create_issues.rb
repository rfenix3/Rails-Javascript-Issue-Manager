class CreateIssues < ActiveRecord::Migration[5.2]
  def change
    create_table :issues do |t|
      t.string :title
      t.string :status
      t.string :owner 
      t.datetime :created
      t.integer :effort
      t.datetime :completion_date
      t.belongs_to :employee, foreign_key: true
      t.belongs_to :user, foreign_key: true

      t.timestamps
    end
  end
end
