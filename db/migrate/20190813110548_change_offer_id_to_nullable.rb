class ChangeOfferIdToNullable < ActiveRecord::Migration[6.0]
  def change
  	change_column_null :line_items, :offer_id, true
  end
end
