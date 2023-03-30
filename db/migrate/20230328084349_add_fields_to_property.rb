class AddFieldsToProperty < ActiveRecord::Migration[7.0]
  def change
    add_column :properties, :name, :string, null: false
    add_column :properties, :description, :string, null: false
    add_column :properties, :city, :string, null: false
  end
end
