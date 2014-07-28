class ScoresController < ApplicationController
  def index
    @scores = Score.all
  end



  def new
    require_login
    @score = Score.new
  end


  def create
    require_login
    @score = Score.new(score_params)
    @score.user_id = current_user.id
    if @score.save
      redirect_to score_path(@score)
    else
      render :new
    end

  end

  def show
    require_login
    gon.scores = Score.find(params[:id])
    @score = Score.find(params[:id])
  end

  def analyze
    require_login
    gon.data1 = ['data1', 30, 200, 100, 400, 150, 250]
    gon.data2 = ['data2', 50, 20, 10, 40, 15, 25]
  end

  def search

    @results = Score.search(params[:search])
    redirect_to score_path(@results[0]) if @results.length == 1

  end

  def destroy
    require_login
    @score = Score.find(params[:id])
    @score.destroy

    redirect_to user_path(current_user)
  end


  private

  def score_params
    params.require(:score).permit(:user_id, :title, :composer, :music_xml, :sound_clip, :music_xml)
  end




end
