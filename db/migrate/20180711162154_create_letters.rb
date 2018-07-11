class CreateLetters < ActiveRecord::Migration[5.2]
  def change
    create_table :letters do |t|
      t.string :name
      t.string :author
      t.text :letter
      t.integer :user_id

      t.timestamps
    end
  end
end
