class LettersController < ApplicationController
  before_action :set_letter, only: [:show, :update, :destroy]
  before_action :authenticate_user!


  # GET /letters
  def index
    @letters = Letter.all
    json_response(@letters)
  end

  # POST /letters
  def create
    @letter = Letter.create!(letter_params)
    json_response(@letter, :created)
  end

  # GET /letters/:id
  def show
    json_response(@letter)
  end

  # PUT /letters/:id
  def update
    @letter.update(letter_params)
    head :no_content
  end

  # DELETE /letters/:id
  def destroy
    @letter.destroy
    head :no_content
  end

  private

  def letter_params
    # whitelist params
    params.permit(:name, :author, :letter, :user_id)
  end

  def set_letter
    @letter = Letter.find(params[:id])
  end
end
