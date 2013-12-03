class Variant < ActiveRecord::Base
  attr_accessible :name
  has_many :games, :dependent => :destroy

  validates :name, presence: true

  def prizes_sum(variant)
    variant.games.sum(:prize) - variant.games.sum(:buyin)
  end
end
