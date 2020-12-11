class CreatePosts < ActiveRecord::Migration[6.0]
  def change
    create_table :posts do |t|
      t.text :url, null: false
      t.string :year, null: false
      t.string :month, null: false
      t.references :user, null: false
      t.references :zine, null: false
      t.timestamps
    end
  end
end
