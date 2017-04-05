require 'sinatra'
require 'json'
require_relative 'yelp_api.rb'

get '/' do
  erb :index
end

post '/search' do
  @lat = params[:lat].to_f
  @lon = params[:lon].to_f


  response = search(params[:term], params[:location], @lat, @lon)
  puts response

  # Coudln't find a way to access Ruby array's in HTML
  # SEARCH RESULT ONE
  @name_0 = response["businesses"][0]["name"]
  @address_0 = [response["businesses"][0]["location"]["display_address"][0],
            response["businesses"][0]["location"]["display_address"][1]]
  @rating_0 = response["businesses"][0]["rating"].to_f
  @review_count_0 =response["businesses"][0]["review_count"]
  @phone_number_0 = response["businesses"][0]["display_phone"]
  @price_0 = response["businesses"][0]["price"]
  @category_0 = response["businesses"][0]["categories"][0]["title"]
  @url_0 = response["businesses"][0]["url"]
  @image_url_0 = response["businesses"][0]["image_url"]
  @lat_0 = response["businesses"][0]["coordinates"]["latitude"]
  @lon_0 = response["businesses"][0]["coordinates"]["longitude"]

  # SEARCH RESULT TWO
  @name_1 = response["businesses"][1]["name"]
  @address_1 = [response["businesses"][1]["location"]["display_address"][0],
            response["businesses"][1]["location"]["display_address"][1]]
  @rating_1 = response["businesses"][1]["rating"].to_f
  @review_count_1 =response["businesses"][1]["review_count"]
  @phone_number_1 = response["businesses"][1]["display_phone"]
  @price_1 = response["businesses"][1]["price"]
  @category_1 = response["businesses"][1]["categories"][0]["title"]
  @url_1 = response["businesses"][1]["url"]
  @image_url_1 = response["businesses"][1]["image_url"]
  @lat_1 = response["businesses"][1]["coordinates"]["latitude"]
  @lon_1 = response["businesses"][1]["coordinates"]["longitude"]

  # SEARCH RESULT THREE
  @name_2 = response["businesses"][2]["name"]
  @address_2 = [response["businesses"][2]["location"]["display_address"][0],
            response["businesses"][2]["location"]["display_address"][1]]
  @rating_2 = response["businesses"][2]["rating"].to_f
  @review_count_2 =response["businesses"][2]["review_count"]
  @phone_number_2 = response["businesses"][2]["display_phone"]
  @price_2 = response["businesses"][2]["price"]
  @category_2 = response["businesses"][2]["categories"][0]["title"]
  @url_2 = response["businesses"][2]["url"]
  @image_url_2 = response["businesses"][2]["image_url"]
  @lat_2 = response["businesses"][2]["coordinates"]["latitude"]
  @lon_2 = response["businesses"][2]["coordinates"]["longitude"]


  erb :search, :locals => {
    :name_0 => @name_0,
    :address_0 => @address_0,
    :rating_0 => @rating_0,
    :review_count_0 => @review_count_0,
    :phone_number_0 => @phone_number_0,
    :price_0 => @price_0,
    :category_0 => @category_0,
    :image_url_0 => @image_url_0,
    :lat_0 => @lat_0,
    :lon_0 => @lon_0,
  }

end
