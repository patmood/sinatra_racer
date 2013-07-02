
get '/' do
  session[:game] = Game.create!(players: [Player.find(session[:player1]), Player.find(session[:player2])]).id if session[:player1] && session[:player2]
  if session[:game]
    current_game = Game.find(session[:game])
    current_game.time_start = Time.now()
    current_game.save
  end
  erb :index
end

post '/' do
  p1 = Player.find_or_create_by_name(name: params["player1"])
  p2 = Player.find_or_create_by_name(name: params["player2"])
  session[:player1] = p1.id
  session[:player2] = p2.id
  redirect '/'
end

get '/logout' do
  session.clear
  redirect '/'
end

post '/update' do
 p params
  @winner = Player.find(params[:winner])

  @winner.wins += 1
  @winner.save
  p @winner
  @loser = Player.find(params[:loser])
  @loser.losses += 1
  @loser.save
  p @loser
  @game = Game.find(params[:game])
  @game.winner = @winner.id
  @game.complete = true
  @game.time_end = Time.now()
  p @game
  @game.save
  redirect '/'
end


