class CreateSupports < ActiveRecord::Migration[5.2]
  def change
    create_table :supports do |t|
      t.string :name
      t.string :password_digest
      t.string :role

      t.timestamps
    end
  end
end
