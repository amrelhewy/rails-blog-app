class AddBlogGenreToBloggs < ActiveRecord::Migration[6.0]
  def change
    add_column :bloggs, :blog_genre, :string

  end
end
