require 'sinatra'
require 'sinatra/reloader'
require_relative 'yelp_api.rb'

get '/' do
  erb :index
  # "CLIENT_ID: #{CLIENT_ID} CLIENT_SECRET: #{CLIENT_SECRET}"
  #token = bearer_token
  #JSON.pretty_generate(token)
end

post '/search' do
  # search(params[:term])
  output = params[:term]
  response = search(output, DEFAULT_LOCATION)
  JSON.pretty_generate(response)
  # erb :search #, :locals {:number => number}
end
