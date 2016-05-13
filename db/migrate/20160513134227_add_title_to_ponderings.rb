class AddTitleToPonderings < ActiveRecord::Migration
  def change
    add_column :ponderings, :title, :string
  end
end
