class ScoresController < ApplicationController
  def new
    @score = Score.new
  end

  def create
    @score = Score.new(score_params)
    if @score.save
      redirect_to score_path(@score)
    else
      render :new
    end

  end

  def show
    @score = Score.find(params[:id])
  end





  private

  def score_params
    params.require(:score).permit(:user_id, :title, :composer, :public, :original_image, :sound_clip, :music_xml)
  end




end
