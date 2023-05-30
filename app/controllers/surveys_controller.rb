class SurveysController < ApplicationController
  before_action :set_survey, only: [:show, :update, :destroy]

  # GET /surveys
  def index
    surveys = Survey.all
    render json: {status: 200, surveys: surveys}
  end

  # GET /surveys/1
  def show
    survey = Survey.find(params[:id])
    render json: {status: 200, survey: survey}
  end

  # POST /surveys
  def create
    survey = Survey.new(survey_params)
    if survey.save
      render json: {status: 201, survey: survey}
    else
        render json: {status: 422, survey: survey}
    end
  end

  # PATCH/PUT /surveys/1
  def update
    survey = Survey.find(params[:id])
    survey.update(survey_params)
    render json: {status: 200, survey: survey}
  end

  def destroy
    survey = Survey.destroy(params[:id])
    render json: {status: 204}
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_survey
      @survey = Survey.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def survey_params
      params.require(:survey).permit(:answer0, :answer1, :answer2, :answer3, :answer4, :answer5)
    end
end
