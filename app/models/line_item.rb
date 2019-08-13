class LineItem < ApplicationRecord
  belongs_to :offer, required: false

  validates_presence_of :name, :quantity, :price, :description
end
