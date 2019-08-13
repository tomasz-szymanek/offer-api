class Offer < ApplicationRecord
  belongs_to :user
  has_many :line_items, dependent: :destroy

  validates_presence_of :line_items
end
