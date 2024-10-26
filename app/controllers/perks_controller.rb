class PerksController < ApplicationController
  before_action :set_perk, only: %i[ show edit update destroy ]

  # GET /perks or /perks.json
  def index
    @perks = Perk.all
  end

  # GET /perks/1 or /perks/1.json
  def show
  end

  # GET /perks/new
  def new
    @perk = Perk.new
  end

  # GET /perks/1/edit
  def edit
  end

  # POST /perks or /perks.json
  def create
    @perk = Perk.new(perk_params)

    respond_to do |format|
      if @perk.save
        format.html { redirect_to @perk, notice: "Perk was successfully created." }
        format.json { render :show, status: :created, location: @perk }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @perk.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /perks/1 or /perks/1.json
  def update
    respond_to do |format|
      if @perk.update(perk_params)
        format.html { redirect_to @perk, notice: "Perk was successfully updated." }
        format.json { render :show, status: :ok, location: @perk }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @perk.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /perks/1 or /perks/1.json
  def destroy
    @perk.destroy

    respond_to do |format|
      format.html { redirect_to perks_path, status: :see_other, notice: "Perk was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_perk
      @perk = Perk.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def perk_params
      params.require(:perk).permit(:title, :amount, :description, :quantity, :project_id)
    end
end
