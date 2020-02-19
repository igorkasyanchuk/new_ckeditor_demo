class AddTemplateColumn < ActiveRecord::Migration[6.0]
  def change
    add_column :posts, :template, :string
  end
end
