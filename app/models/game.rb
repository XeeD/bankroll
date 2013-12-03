class Game < ActiveRecord::Base
  attr_accessible :buyin, :casino_id, :prize, :variant_id
  belongs_to :casino
  belongs_to :variant
  belongs_to :user

  validates :buyin, numericality: { greater_than_or_equal_to: 0 }
  validates :prize, numericality: { greater_than_or_equal_to: 0 }
  def self.prizes_sum(id)
    Game.where(:user_id => id).sum(:prize) - Game.where(:user_id => id).sum(:buyin)
  end
end
