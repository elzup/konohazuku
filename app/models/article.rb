class Article < ApplicationRecord
  has_many :approvals
  has_many :target_users, through: :approvals
  belongs_to :author, class_name: 'User', :foreign_key => 'author_id'
end
