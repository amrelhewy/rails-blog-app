class CreateBloggs < ActiveRecord::Migration[6.0]
  def change
    create_table :bloggs do |t|
      t.string :blog_name
      t.string :blog
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
