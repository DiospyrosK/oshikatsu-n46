class Member < ApplicationRecord
  has_many :post_members, dependent: :destroy
  has_many :posts, through: :post_members
end
