class Topic < ActiveRecord::Base
  has_many :votes, dependent: :destroy

  validates :title, presence: true
  validates :description, presence: true

  scope :votes_count, -> { Topic.order('votes_count DESC') }
end
