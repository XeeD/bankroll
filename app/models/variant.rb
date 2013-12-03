class Variant < ActiveRecord::Base
  attr_accessible :name
  has_many :games, :dependent => :destroy

  validates :name, presence: true

  def prizes_sum(id)
    games.where(:user_id => id).sum(:prize) - games.where(:user_id => id).sum(:buyin)
  end
end
