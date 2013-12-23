class GamesImport
  def initialize(file, user)
    @file = file
    @user = user
  end

  def create_records
    games_attributes.each { |game_attributes| Game.create(game_attributes) }
  end


  protected

  def games_attributes
    workbook.map do |line|
      variant = Variant.with_name(line[2])
      casino = Casino.with_name(line[3])

      {
          buyin: line[0].to_i,
          prize: line[1].to_i,
          variant_id: variant.id,
          casino_id: casino.id,
          user_id: @user.id
      }
    end
  end

  def workbook
    case File.extname(@file.original_filename)
      when ".xls"
        Roo::Excel.new(@file.path, file_warning: :ignore)
      when ".xlsx"
        Roo::Excelx.new(@file.path, file_warning: :ignore)
      when ".csv"
        Roo::Csv.new(@file.path, file_warning: :ignore)
      else
        raise ImportError, "File type was not recognised."
    end
  end

  class ImportError < RuntimeError
  end
end
