class TranslationsController < ApplicationController
  before_action :set_translation, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:random, :create]

  # GET /translations
  # GET /translations.json
  def index
    @translations = Translation.all.sorted
  end

  # GET /translations/1
  # GET /translations/1.json
  def show
  end

  def random
    @translations = Translation.active.random
    render json: @translations, only: [:papa, :pontifice]
  end

  # GET /translations/new
  def new
    @translation = Translation.new
  end

  # GET /translations/1/edit
  def edit
  end

  # POST /translations
  # POST /translations.json
  def create
    @translation = Translation.new(translation_params)

    respond_to do |format|
      if @translation.save
        format.html { redirect_to translations_url, notice: 'Translation was successfully created.' }
        format.json { render :show, status: :created, location: @translation }
      else
        format.html { render :new }
        format.json { render json: @translation.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /translations/1
  # PATCH/PUT /translations/1.json
  def update
    respond_to do |format|
      if @translation.update(translation_params)
        format.html { redirect_to translations_url, notice: 'Translation was successfully updated.' }
        format.json { render :show, status: :ok, location: @translation }
      else
        format.html { render :edit }
        format.json { render json: @translation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /translations/1
  # DELETE /translations/1.json
  def destroy
    @translation.destroy
    respond_to do |format|
      format.html { redirect_to translations_url, notice: 'Translation was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_translation
      @translation = Translation.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def translation_params
      whitelisted = params.require(:translation).permit(:papa, :pontifice, :active, :allowed_first)
      whitelisted[:active] = false unless current_user.try(:admin)
      whitelisted
    end
end
