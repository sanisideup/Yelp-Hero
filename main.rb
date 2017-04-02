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
  @lat = params[:lat].to_f
  @lon = params[:lon].to_f

  response = search(params[:term], @lat, @lon)
  puts response

  # SEARCH RESULT ONE
  @name = response["businesses"][0]["name"]
  @address = [response["businesses"][0]["location"]["display_address"][0],
            response["businesses"][0]["location"]["display_address"][1]]
  @rating = response["businesses"][0]["rating"]
  @review_count =response["businesses"][0]["review_count"]
  @phone_number = response["businesses"][0]["display_phone"]
  @price = response["businesses"][0]["price"]
  @category = response["businesses"][0]["categories"][0]["title"]
  @url = response["businesses"][0]["url"]
  @image_url = response["businesses"][0]["image_url"]
  @lat_1 = response["businesses"][0]["coordinates"]["latitude"]
  @lon_1 = response["businesses"][0]["coordinates"]["longitude"]

  # SEARCH RESULT TWO

  # SEARCH RESULT THREE


  erb :search, :locals => {
    :lat => @lat,
    :lon => @lon,

    :name => @name,
    :address => @address,
    :rating => @rating,
    :review_count => @review_count,
    :phone_number => @phone_number,
    :price => @price,
    :category => @category,
    :image_url => @image_url,
    :lat_1 => @lat_1,
    :lon_1 => @lon_1
  }

end

get '/location' do
  erb :location
end

post '/go' do
    @lat = params[:lat]
    @lon = params[:lon]

    puts @lat
    puts @lon

    erb :go

end
