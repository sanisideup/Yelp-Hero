require 'sinatra'
require 'sinatra/reloader'
require_relative 'yelp_api.rb'
require 'json'

get '/' do
  erb :index
  # "CLIENT_ID: #{CLIENT_ID} CLIENT_SECRET: #{CLIENT_SECRET}"
  # token = bearer_token
  # JSON.pretty_generate(token)
end

post '/search' do
  # search(params[:term])
  response = search(params[:term], DEFAULT_LOCATION)
  rating = response["businesses"][0]["rating"]
  phone_number = response["businesses"][0]["display_phone"]
  price = response["businesses"][0]["price"]
  address1 = response["businesses"][0]["location"]["display_address"][0]
  address2 = response["businesses"][0]["location"]["display_address"][1]
  url = response["businesses"][0]["url"]
  name = response["businesses"][0]["name"]
  image_url = response["businesses"][0]["image_url"]
  review_count = response["businesses"][0]["review_count"]
  #["Name: #{name}", "Address: #{address1} #{address2}", "Phone number: #{phone_number}",
  # "Rating: #{rating}", "Reviews: #{review_count}", "Price: #{price}",
  # "URL: #{url}"].join("<br>")
  erb :search, :locals => {:name => name,
                           :address1 => address1,
                           :address2 => address2,
                           :phone_number => phone_number,
                           :rating => rating,
                           :review_count => review_count,
                           :price => price
                           }
end

get '/location' do
  erb :location
end

post '/go' do
    @lat = params[:lat]
    @lon = params[:lon]
    erb :go

end
