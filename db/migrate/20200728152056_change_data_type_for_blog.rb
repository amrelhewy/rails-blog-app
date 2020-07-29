class ChangeDataTypeForBlog < ActiveRecord::Migration[6.0]
  def change
    change_column :bloggs, :blog, :text
  end
end
