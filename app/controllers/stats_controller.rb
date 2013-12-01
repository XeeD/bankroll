class StatsController < ApplicationController
  def index
  end

  def show
    @filter = Game.column_names
    @id = params[:id]
  end
end
