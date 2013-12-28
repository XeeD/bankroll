class CasinosController < ApplicationController
  # GET /casinos
  # GET /casinos.json
  def index
    @casinos = current_user.casinos

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @casinos }
    end
  end

  # GET /casinos/1
  # GET /casinos/1.json
  def show
    @casino = Casino.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @casino }
    end
  end

  # GET /casinos/new
  # GET /casinos/new.json
  def new
    @casino = Casino.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @casino }
    end
  end

  # GET /casinos/1/edit
  def edit
    @casino = Casino.find(params[:id])
  end

  # POST /casinos
  # POST /casinos.json
  def create
    @casino = Casino.new(params[:casino])
    @casino.user_id = current_user.id
    @casino.visible = true

    respond_to do |format|
      if @casino.save
        format.html { redirect_to @casino, notice: 'Casino was successfully created.' }
        format.json { render json: @casino, status: :created, location: @casino }
      else
        format.html { render action: "new" }
        format.json { render json: @casino.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /casinos/1
  # PUT /casinos/1.json
  def update
    @casino = Casino.find(params[:id])

    respond_to do |format|
      if @casino.update_attributes(params[:casino])
        format.html { redirect_to @casino, notice: 'Casino was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @casino.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /casinos/1
  # DELETE /casinos/1.json
  def destroy
    @casino = Casino.find(params[:id])
    @casino.destroy

    respond_to do |format|
      format.html { redirect_to casinos_url }
      format.json { head :no_content }
    end
  end
end
