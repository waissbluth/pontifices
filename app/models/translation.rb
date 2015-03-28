class Translation < ActiveRecord::Base
  validates :papa, presence: true
  validates :pontifice, presence: true, if: :active
  validates :pontifice, uniqueness: {scope: :papa}

  scope :active, -> { where(active: true) }
  scope :random, -> { order('bad asc, random()') }
  scope :sorted, -> { order(:active, :bad, :papa)}

  def self.safe_random
    result = []
    pending = []
    rest = []
    random.each do |t|
      if result.length >=5
        rest.push(t)
      else
        if t.allowed_first
          result.push(t)
        else
          pending.push(t)
        end
      end
    end
    result + pending + rest
  end

end
