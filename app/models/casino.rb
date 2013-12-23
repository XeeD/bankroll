class Casino < ActiveRecord::Base
  attr_accessible :name
  has_many :games, :dependent => :destroy
  belongs_to :user

  validates :name, presence: true

  def prizes_sum
    games.sum(:prize) - games.sum(:buyin)
  end

  def self.with_name(name)
    where('name LIKE ?', name).first_or_create(name: name)
  end
end
