class CreateFurnishings < ActiveRecord::Migration[7.0]
  def change
    create_table :furnishings do |t|

      t.timestamps
    end
  end
end
