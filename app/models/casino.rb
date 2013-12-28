class Casino < ActiveRecord::Base
  attr_accessible :name, :public
  has_many :games, :dependent => :destroy
  belongs_to :user

  validates :name, presence: true

  def prizes_sum(user)
    games.where(:user_id => user.id).sum(:prize) - games.where(:user_id => user.id).sum(:buyin)
  end

  def self.with_name(name)
    where('name LIKE ?', name).first_or_create(name: name)
  end

  scope :for_user_and_visible, ->(user_id) { where("user_id = ? OR (visible = ? AND public = ?)", user_id, true, true) }
end
