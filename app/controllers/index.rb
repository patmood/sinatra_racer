get '/' do
  @activegame = Game.find(session[:game]) if session[:game]
  erb :index
end

post '/' do
  p1 = Player.find_or_create_by_name(name: params["player1"])
  p2 = Player.find_or_create_by_name(name: params["player2"])
  # session[:player1] = p1.id
  # session[:player2] = p2.id
  @activegame = Game.create!(players: [p1, p2])
  session[:game] = @activegame.id
  erb :index
end

get '/logout' do
  session[:game] = nil
  redirect '/'
end

post '/update' do
  game = Game.find(params[:game_id])
  game.complete = true
  game.duration = params[:game_time]
  game.winner = params[:winner]
  winner = Player.find(game.winner)
  winner.wins += 1
  game.save
  winner.save
end
