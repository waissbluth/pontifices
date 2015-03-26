class Translation < ActiveRecord::Base
  validates :papa, presence: true
  validates :pontifice, presence: true, if: :active

  scope :active, -> { where(active: true) }
  scope :random, -> { order('random()') }
  scope :sorted, -> { order(:papa)}
end
