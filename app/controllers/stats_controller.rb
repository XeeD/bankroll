class StatsController < ApplicationController
  def index
    @casinos = Casino.for_user_and_visible(current_user.id)
  end

  def show
    @filter = Game.column_names
    @id = params[:id]
  end
end
