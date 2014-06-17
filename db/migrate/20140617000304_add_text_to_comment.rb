class AddTextToComment < ActiveRecord::Migration
  def change
    add_column :comments, :text_comment, :string
  end
end
