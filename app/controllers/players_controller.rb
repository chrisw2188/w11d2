class PlayersController < ApplicationController

  def index
    players = Player.where({team: params[:team_id]})
    render(json: players.as_json({include: :team}))
  end

  def show
    player = Player.where({team: params[:team_id], id: params[:id]})
    # player = player.find(params[:id])
    render(json: player.as_json(include: :team))
  end

  def create
    player = Player.create({
      name: params[:name],
      age: params[:age],
      team_id: params[:team_id]
    })
    render(json: player.as_json(include: :team))
  end

  # def update
  #   player = Player.where({team: params[:team_id], id: params[:id]})
  #   player.update({
  #     name: params[:name],
  #     age: params[:age],
  #     team_id: params[:team_id]
  #   })
  #   render(json: player)
  # end

  def update()
      # player = Player.find( params[:id] )
      player = Player.where({team: params[:team_id], id: params[:id]}).first
      player.update({
        name: params[:name], 
        age: params[:age], 
        team_id: params[:team_id]
      })
      render(json: player);
  end

  def destroy
    player = Player.where({team: params[:team_id], id: params[:id]}).first
    # player = Player.find(params[:id])
    player.destroy()
    index()
  end



end