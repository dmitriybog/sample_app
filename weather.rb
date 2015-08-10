require "nokogiri"
require "open-uri"

# link = "https://query.yahooapis.com/v1/public/yql?q=select%20item.condition%20from%20weather.forecast%20where%20(woeid%20%3D%20638242%20and%20u%3D'c')&format=xml&env=store%3A%2F%2Fdatatables.org%2Falltableswithkeys" #2123260 this code of my city
# data = Nokogiri::XML(open(link,ssl_verify_mode: OpenSSL::SSL::VERIFY_NONE))
# date = data.xpath("//item//@date")[0].to_s
# temp = data.xpath("//item//@temp")[0].to_s

# # <%= yield(temp)>
# # #=> "<yweather:condition text=\"Cloudy\" code=\"26\" temp=\"-6\" date=\"Tue, 10 Dec 2013 3:30 pm MSK\"/>"


class Temperature
	attr_accessor :time, :temp, :link

	def initialize()
		@link = "https://query.yahooapis.com/v1/public/yql?q=select%20item.condition%20from%20weather.forecast%20where%20(woeid%20%3D%20638242%20and%20u%3D'c')&format=xml&env=store%3A%2F%2Fdatatables.org%2Falltableswithkeys"
		@data = Nokogiri::XML(open(link,ssl_verify_mode: OpenSSL::SSL::VERIFY_NONE))
		@time = @data.xpath("//item//@date")[0].to_s
		@temp = @data.xpath("//item//@temp")[0].to_s
	end

	def upd
		@data = Nokogiri::XML(open(link,ssl_verify_mode: OpenSSL::SSL::VERIFY_NONE))
		@time = @data.xpath("//item//@date")[0].to_s
		@temp = @data.xpath("//item//@temp")[0].to_s
	end

	# def print_temp

	# end

end 