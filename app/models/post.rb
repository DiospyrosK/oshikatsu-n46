class Post < ApplicationRecord
  with_options presence: true do
    validates :title
    validates :explanation
    validates :category_id
  end
  
  belongs_to :category
  belongs_to :user
  has_many :post_members, dependent: :destroy
  has_many :members, through: :post_members
end
