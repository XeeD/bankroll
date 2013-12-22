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
    workbook(file).map do |line|  
      create(
        buyin: line[0].to_i
        prize: line[1].to_i
        variant_id: line[2].to_i
        casino_id: line[3].to_i
        user_id: user.id
      )
    end
  end

  def self.workbook(file)
    workbook = {}
    extension = File.extname(file.original_filename)

    case extension
    when ".xls"
      Roo::Excel.new(file.path, file_warning: :ignore)
     when ".xlsx"
      Roo::Excelx.new(file.path, file_warning: :ignore)
    when == ".csv"
      Roo::Csv.new(file.path, file_warning: :ignore)
    else
      raise "File type was not recognised."
    end
  end
end
