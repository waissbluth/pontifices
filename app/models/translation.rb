class Translation < ActiveRecord::Base
  validate [:papa, :pontifice], presence: true

  scope :active, -> {where(active: true)}
end
