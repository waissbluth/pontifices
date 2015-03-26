class Translation < ActiveRecord::Base
  validates :papa, presence: true
  validates :pontifice, presence: true, if: :active
  validates :pontifice, uniqueness: {scope: :papa}

  scope :active, -> { where(active: true) }
  scope :random, -> { order('random()') }
  scope :sorted, -> { order(:active, :papa)}
end
