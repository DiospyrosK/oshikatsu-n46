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
  has_many :bookmarks
  has_one_attached :image

  def bookmarked_by?(user)
    bookmarks.where(user_id: user.id).exists?
  end
end
