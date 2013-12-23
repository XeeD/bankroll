class Variant < ActiveRecord::Base
  attr_accessible :name
  has_many :games, :dependent => :destroy

  validates :name, presence: true

  def prizes_sum(variant)
    variant.games.sum(:prize) - variant.games.sum(:buyin)
  end

  def self.with_name(name)
    where('name LIKE ?', name).first_or_create(name: name)
  end
end
