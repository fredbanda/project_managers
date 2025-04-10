class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :project

  validates :content, presence: true

  def timeline_type
    "comment"
  end
end
