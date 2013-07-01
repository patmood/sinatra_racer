
get '/' do
  # Look in app/views/index.erb
  @p1 = session[:player1] if session[:player1]
  @p2 = session[:player1] if session[:player2]
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
  session[:]
end
