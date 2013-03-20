require 'open-uri'
require 'xmlsimple'

username = 'xxx'
api_key = 'xxx'

SCHEDULER.every '1m', :first_in => 0 do |job|
	http = Net::HTTP.new('ws.audioscrobbler.com')
	response = http.request(Net::HTTP::Get.new("/2.0/?method=user.getrecenttracks&user=#{username}&api_key=#{api_key}"))
	response_status = XmlSimple.xml_in(response.body, { 'ForceArray' => false })

	if response_status['status'] == "failed"

		failed = response_status['error']['content']

		send_event('lastfm', { :status => failed })

	else

		user_id = XmlSimple.xml_in(response.body, { 'ForceArray' => false })['recenttracks']
		song = XmlSimple.xml_in(response.body, { 'ForceArray' => false })['recenttracks']['track'][0]

		if song['nowplaying'] == "true"
			track_status = "Now Playing"
		else
			track_status = "Last Played"
		end

		if song['image'][2]['content'].nil?
			image = "http://placekitten.com/g/126/126"
		else
			image = song['image'][2]['content']
		end

		send_event('lastfm', { :status => 'ok', :cover => image, :artist => song['artist']['content'], :track => song['name'], :title => track_status})

	end

end