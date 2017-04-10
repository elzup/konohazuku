class Article < ApplicationRecord
  has_many :approvals
  has_many :assigned_users, through: :approvals, :source => :user
  belongs_to :author, class_name: 'User'

  def email_lines
    assigned_users.map(&:email) .join("\n")
  end
end
