class CategoryUser < ActiveRecord::Base
  belongs_to :category
  belongs_to :user
  validates :category_id, :user_id, presence: true
  validates :user_id, uniqueness: {scope: :category_id}
end
