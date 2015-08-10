require "nokogiri"
require "open-uri"

module WeatherHelper
	def temp()
		t={}
		link = "https://query.yahooapis.com/v1/public/yql?q=select%20item.condition%20from%20weather.forecast%20where%20(woeid%20%3D%20638242%20and%20u%3D'c')&format=xml&env=store%3A%2F%2Fdatatables.org%2Falltableswithkeys"
		data = Nokogiri::XML(open(link,ssl_verify_mode: OpenSSL::SSL::VERIFY_NONE))
		t[:time] = data.xpath("//item//@date")[0].to_s
		t[:temperature] = data.xpath("//item//@temp")[0].to_s
		return "On #{t[:time]} the temperature in Berlin is #{t[:temperature]}°C"
	end
end 