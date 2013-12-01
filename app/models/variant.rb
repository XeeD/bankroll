class Variant < ActiveRecord::Base
  attr_accessible :name
  has_many :games

  def prizes_sum
    games.sum(:prize)
  end
end
