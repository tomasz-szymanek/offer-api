require 'rails_helper'

RSpec.describe LineItem, type: :model do
  it { should belong_to(:offer) }
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:price) }
  it { should validate_presence_of(:quantity) }
  it { should validate_presence_of(:description) }
end
