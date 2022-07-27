require 'rails_helper'

RSpec.describe Like, type: :model do
  #pending "add some examples to (or delete) #{__FILE__}"

  it "Like should be uniq for each user" do
    user = User.second
    product = user.products.first
    like1 = user.likes.new(likeable_id: product.id, likeable_type: "Product")
    like1.save!
    like2 = user.likes.new(likeable_id: product.id, likeable_type: "Product")
    expect  {like2.save! }.to raise_error
  end
end
