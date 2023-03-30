class AddFieldsToValuation < ActiveRecord::Migration[7.0]
  def change
    add_monetize :valuations, :price, null: false, default: 0
    add_column :valuations, :has_offer, :boolean, default: false, null: false
    add_reference :valuations, :property, null: false, foreign_key: true, unique: true
  end
end
