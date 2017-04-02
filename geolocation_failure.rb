def set_location(lat,lon)
    if (lat.nil?|| lon.nil?) then #if html5 location isn't passed, revert to this method
      page = "http://freegeoip.net/json/"
      doc = Nokogiri::HTML(open(page, 'User-Agent' => 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_9_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/35.0.1916.153 Safari/537.36'))
      loc = /(latitude)(\":)(\d+.\d+)(,\"longitude\":)(-\d+.\d+)/.match(doc.text)
      @lat = loc[3]
      @lon = loc[5]
    else
      @lat = lat
      @lon = lon
    end
end
