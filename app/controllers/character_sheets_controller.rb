# frozen_string_literal: true

class CharacterSheetsController < ApplicationController
  before_action :authenticate_user!
  before_action :character
  before_action :set_character_sheet, only: %i[show edit update destroy]

  # GET /character_sheets or /character_sheets.json
  def index
    @character_sheets = character.sheets.all
    respond_to do |format|
      format.json { @character_sheets }
      if @character_sheets.present?
        format.html { render :index }
      else
        format.html { redirect_to new_character_sheet_url }
      end
    end
  end

  def new; end

  # GET /character_sheets/1 or /character_sheets/1.json
  def show; end

  # GET /character_sheets/1/edit
  def edit; end

  # POST /character_sheets or /character_sheets.json
  def create
    @character_sheet = CharacterSheet
                       .create_with(character_sheet_params)
                       .find_or_initialize_by(character: @character, keeper: current_user)

    respond_to do |format|
      if @character_sheet.save
        format.html do
          redirect_to character_sheets_url(@character, @character_sheet),
                      notice: 'Character sheet was successfully created.'
        end
        format.json { render :show, status: :created, location: @character_sheet }
      else
        format.json { render json: @character_sheet.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /character_sheets/1 or /character_sheets/1.json
  def update
    respond_to do |format|
      if @character_sheet.update(character_sheet_params)
        format.html do
          redirect_to character_sheet_url(@character_sheet), notice: 'Character sheet was successfully updated.'
        end
        format.json { render :show, status: :ok, location: @character_sheet }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @character_sheet.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /character_sheets/1 or /character_sheets/1.json
  def destroy
    @character_sheet.destroy

    respond_to do |format|
      format.html { redirect_to character_sheets_url, notice: 'Character sheet was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def from_template
    @template = params[:template]
    @character_sheet = CharacterSheet.new
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_character_sheet
    @character_sheet = CharacterSheet.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def character_sheet_params
    params.require(:character_sheet).permit(:keeper_id, :character_id, :level, :data, :version)
  end

  def character
    @character = Character.find(params[:character_id])
  end
end
