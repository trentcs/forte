class ScoresController < ApplicationController
  def new
    @score = Score.new
  end


  def create
    @score = Score.new(score_params)
    @score.user_id = current_user.id
    if @score.save
      redirect_to score_path(@score)
    else
      render :new
    end

  end

  def show
    gon.scores = Score.find(params[:id])
    @score = Score.find(params[:id])
  end

  def analyze
    gon.data1 = ['data1', 30, 200, 100, 400, 150, 250]
    gon.data2 = ['data2', 50, 20, 10, 40, 15, 25]
  end



  private

  def score_params
    params.require(:score).permit(:user_id, :title, :composer, :music_xml, :sound_clip, :music_xml)
  end




end
