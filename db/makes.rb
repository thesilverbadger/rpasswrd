require "rubygems"
require "json"
require "net/http"
require "uri"

uri = URI.parse("http://smgautohubdev.azurewebsites.net/api/makes")

http = Net::HTTP.new(uri.host, uri.port)
request = Net::HTTP::Get.new(uri.request_uri)

response = http.request(request)

if response.code == "200"
  result = JSON.parse(response.body)

  result.each do |doc|
    puts "Vehicle Type"
    puts doc["Name"] #reference properties like this
                     #puts doc # this is the result in object form

                     #puts doc

    makes = doc["Makes"]
                     #puts makes

    makes.each do |make|
      puts "Make:"
      puts make["Name"]

      models = make["Models"]

      puts "Models"
      models.each do |model|
        puts model["Name"]
      end
    end

    puts ""
    puts ""
  end
else
  puts "ERROR!!!"
end

