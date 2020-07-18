class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :name, null: false
      t.integer :book_count, null: false, default: 0

      t.timestamps
    end
  end
end
