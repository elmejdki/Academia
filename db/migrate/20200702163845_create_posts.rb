class CreatePosts < ActiveRecord::Migration[6.0]
  def change
    create_table :posts do |t|
      t.references :author
      t.text :text

      t.timestamps
    end

    add_foreign_key :posts, :users, column: :author_id
  end
end
