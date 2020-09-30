class CreateMessages < ActiveRecord::Migration[6.0]
  def change
    create_table :messages do |t|
      t.string :comment,        null: false
      t.integer :user_id,       null: false
      t.integer :post_id,       null: false
      t.timestamps
    end
  end
end
