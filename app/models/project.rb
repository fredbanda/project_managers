class Project < ApplicationRecord
  has_many :comments, dependent: :destroy
  has_many :status_changes, dependent: :destroy

  validates :title, presence: true
  validates :status, presence: true, inclusion: { in: [ "Not Started", "In Progress", "On Hold", "Completed" ] }

  def timeline_items
    (comments + status_changes).sort_by(&:created_at).reverse
  end
end
