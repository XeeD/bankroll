class Casino < ActiveRecord::Base
  attr_accessible :name
  has_many :games, :dependent => :destroy
  belongs_to :user

  validates :name, presence: true

  def prizes_sum
    games.sum(:prize) - games.sum(:buyin)
  end
end
