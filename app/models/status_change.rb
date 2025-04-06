class StatusChange < ApplicationRecord
  belongs_to :user
  belongs_to :project

  validates :from_status, presence: true
  validates :to_status, presence: true
  validates :reason, presence: true

  def timeline_type
    "status_change"
  end
end
