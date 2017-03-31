require 'sinatra'
# require 'sinatra/reloader'

get '/' do
  erb :index
end

get '/search' do

  erb :search #, :locals {:number => number}
end
