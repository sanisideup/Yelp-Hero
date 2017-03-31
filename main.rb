require 'sinatra'
require 'sinatra/reloader'
require_relative 'yelp_api.rb'

get '/' do
  erb :index
end

post '/search' do

  # search(params[:term])
  output = params[:term]
  output
  # erb :search #, :locals {:number => number}
end
