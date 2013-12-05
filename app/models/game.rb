class Game < ActiveRecord::Base
  attr_accessible :buyin, :casino_id, :prize, :variant_id
  belongs_to :casino
  belongs_to :variant
  belongs_to :user

  validates :buyin, numericality: { greater_than_or_equal_to: 0 }
  validates :prize, numericality: { greater_than_or_equal_to: 0 }

  def self.prizes_sum(user)
    user.games.sum(:prize) - user.games.sum(:buyin)
  end

  def self.import(file, user)
    workbook = create_workbook file
    workbook.each do |param|
      @game = Game.new
      @game.buyin = param[0] || 0
      @game.prize = param[1] || 0
      @game.variant_id = param[2] || 0
      @game.casino_id = param[3] || 0
      @game.user_id = user.id
      @game.save
    end
  end

  def self.create_workbook(file)
    workbook = {}
    extension = File.extname(file.original_filename)

    if extension == ".xls"
      workbook = Roo::Excel.new(file.path, file_warning: :ignore)
    elsif extension == ".xlsx"
      workbook = Roo::Excelx.new(file.path, file_warning: :ignore)
    elsif extension == ".csv"
      workbook = Roo::Csv.new(file.path, file_warning: :ignore)
    else
      raise "File type was not recognised."
    end
    workbook
  end
end
