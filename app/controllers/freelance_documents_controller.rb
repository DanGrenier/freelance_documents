class FreelanceDocumentsController < ApplicationController
  before_action :set_freelancedocument, only: [:show, :update, :destroy]

  # GET /freelancedocuments
  def index
    @freelancedocuments = FreelanceDocument.all

    render json: @freelancedocuments
  end

  # GET /freelancedocuments/1
  def show
    render json: @freelancedocument
  end

  # POST /freelancedocuments
  def create
    @freelancedocument = FreelanceDocument.new(freelancedocument_params)

    if @freelancedocument.save
      render json: @freelancedocument, status: :created, location: @freelancedocument
    else
      render json: @freelancedocument.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /freelancedocuments/1
  def update
    if @freelancedocument.update(freelancedocument_params)
      render json: @freelancedocument
    else
      render json: @freelancedocument.errors, status: :unprocessable_entity
    end
  end

  # DELETE /freelancedocuments/1
  def destroy
    @freelancedocument.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_freelancedocument
      @freelancedocument = FreelanceDocument.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def freelancedocument_params
      params.require(:freelancedocument).permit(:title, :description, :file_url, :image_url)
    end
end
