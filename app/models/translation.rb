class Translation < ActiveRecord::Base
  validates :papa, presence: true
  validates :pontifice, presence: true

  scope :active, -> {where(active: true)}
end
