class GamesController < ApplicationController

  # Possire_import

  # GET /games
  # GET /games.json
  def index
    @games = current_user.games

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @games }
    end
  end


  # GET /games/new
  # GET /games/new.json
  def new
    @game = Game.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @game }
    end
  end

  # GET /games/1/edit
  def edit
    @game = Game.find(params[:id])
  end

  def prepare_import
  end

  def import
    GamesImport.new(params[:file], current_user).create_records

    redirect_to games_url, notice: 'Hry byly importovány'
  end

  # POST /games
  # POST /games.json
  def create
    @game = Game.new(params[:game])
    @game.user_id = current_user.id

    if @game.save
      redirect_to games_url, notice: 'Game was successfully created.'
    else
      render action: "new"
    end
  end

  # PUT /games/1
  # PUT /games/1.json
  def update
    @game = Game.find(params[:id])

    respond_to do |format|
      if @game.update_attributes(params[:game])
        format.html { redirect_to games_url, notice: 'Game was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @game.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /games/1
  # DELETE /games/1.json
  def destroy
    @game = Game.find(params[:id])
    @game.destroy

    respond_to do |format|
      format.html { redirect_to games_url }
      format.json { head :no_content }
    end
  end



end
