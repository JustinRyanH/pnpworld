# frozen_string_literal: true

class CharactersController < ApplicationController
  before_action :set_character, only: %i[edit update destroy]
  before_action :authenticate_user!

  # GET /characters or /characters.json
  def index
    @characters = Character.all
  end

  # GET /characters/1 or /characters/1.json
  def show
    respond_to do |format|
      if character.present?
        format.js
        format.html do
          @characters = Character.all
          render :show
        end
        format.turbo_stream
      else
        format.js
        format.html { redirect_to characters_url, danger: 'Character does not exist' }
      end
    end
  end

  # GET /characters/new
  def new
    @character = Character.new
  end

  # GET /characters/1/edit
  def edit; end

  # POST /characters or /characters.json
  def create
    @character = Character.create_with(keeper: current_user).new(character_params)

    respond_to do |format|
      if @character.save
        format.html { redirect_to character_url(@character), success: 'Character was successfully created.' }
        format.json { render :show, status: :created, location: @character }
        format.turbo_stream
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @character.errors, status: :unprocessable_entity }
        format.turbo_stream do
          render(turbo_stream: turbo_stream.replace(
            "#{helpers.dom_id(@character)}_form",
            partial: 'form',
            locals: { character: @character }
          ))
        end
      end
    end
  end

  # PATCH/PUT /characters/1 or /characters/1.json
  def update
    respond_to do |format|
      if character.update(character_params)
        format.html { redirect_to character_url(character), success: 'Character was successfully updated.' }
        format.json { render :show, status: :ok, location: character }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: character.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /characters/1 or /characters/1.json
  def destroy
    character.destroy

    respond_to do |format|
      format.turbo_stream
      format.html { redirect_to characters_url, success: 'Character was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_character
    @character = Character.find(params[:id])
  end

  def character
    @character ||= Character.find_by(id: params[:id])
  end

  # Only allow a list of trusted parameters through.
  def character_params
    params.require(:character).permit(:name)
  end
end
