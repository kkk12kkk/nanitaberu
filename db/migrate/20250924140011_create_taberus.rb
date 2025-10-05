class CreateTaberus < ActiveRecord::Migration[6.1]
  def change
    create_table :taberus do |t|
      t.string :title
      t.string :body
      t.timestamps
      t.integer :user_id
    end
  end
end
