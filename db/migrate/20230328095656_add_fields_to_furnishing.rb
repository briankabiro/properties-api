class AddFieldsToFurnishing < ActiveRecord::Migration[7.0]
  def change
    add_column :furnishings, :chairs, :integer, null: false, default: 0
    add_column :furnishings, :tables, :integer, null: false, default: 0
    add_column :furnishings, :beds, :integer, null: false, default: 0
    
    add_reference :furnishings, :property, null: false, foreign_key: true, unique: true
  end
end
