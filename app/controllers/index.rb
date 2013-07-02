
get '/' do
  # Look in app/views/index.erb
  @p1 = session[:player1] if session[:player1]
  @p2 = session[:player2] if session[:player2]
  @game = session[:game] if session[:game]
  erb :index
end

post '/' do
  p1 = Player.find_or_create_by_name(name: params["player1"])
  p2 = Player.find_or_create_by_name(name: params["player2"])
  session[:player1] = p1.id
  session[:player2] = p2.id
  session[:game] = Game.create!(players: [p1, p2]).id
  redirect '/'
end

get '/logout' do
  session.clear
  redirect '/'
end

post '/update' do
 p params
  @winner = Player.find(params[:winner])

  @winner.wins = 0 if @winner.wins == nil #default this shit to 0
  @winner.wins += 1
  @winner.save
  p @winner
  @loser = Player.find(params[:loser])
  @loser.losses = 0 if @loser.losses == nil #default this shit to 0
  @loser.losses += 1
  @loser.save
  p @loser
  @game = Game.find(params[:game])
  @game.winner = @winner.id
  @game.complete = true
  p @game
  @game.save
  erb :index 
end


