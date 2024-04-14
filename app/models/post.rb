class Post < ApplicationRecord
  with_options presence: true do
    validates :title
    validates :explanation
    validates :category_id
  end
  
  belongs_to :category
  belongs_to :user
end
