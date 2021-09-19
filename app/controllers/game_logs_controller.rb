class GameLogsController < ApplicationController
  def index
    game_logs = GameLog.order(:created_at, :desc).limit(10)
    res = []
    # TODO: N+1が起こっているが件数が少ない、時間がないので無視
    game_logs.each do |game_log|
      user_1 = User.find(game_log.user_id_1)
      user_2 = game_log.user_id_2 == -1 ? nil : User.find(game_log.user_id_2)
      res << {id: game_log.id, win_user: game_log.win_user, user_1_name: user_1.name, user_2_name: user_2 ? user_2.name : "CPU"}
    end
    render json: res
  end

  def create
    game_log = GameLog.new(win_user: params[:win_user])
    if params[:user_id]
      game_log.user_id_1 = params[:user_id]
      game_log.user_id_2 = -1
    else
      game_log.user_id_1 = params[:user_id_1]
      game_log.user_id_2 = params[:user_id_2]
    end

    if game_log.save
      render json: {}
    else
      render json: {err: game_log.errors }
    end
  end
end
