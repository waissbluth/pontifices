class Translation < ActiveRecord::Base
  validates :papa, presence: true, uniqueness: true

  scope :active, -> { where(active: true) }
  scope :random, -> { order('random()') }
end
