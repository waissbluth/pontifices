class Translation < ActiveRecord::Base
  validates [:papa, :pontifice], presence: true

  scope :active, -> {where(active: true)}
end
