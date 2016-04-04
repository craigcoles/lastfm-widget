require 'net/http'
require 'json'

username = ENV['LASTFM_USERNAME'] || 'XXX'
api_key = ENV['LASTFM_API_KEY'] || 'XXX'
max_length = 12

SCHEDULER.every '1m', :first_in => 0 do |job|
	http = Net::HTTP.new('ws.audioscrobbler.com')
  response = http.request(Net::HTTP::Get.new("/2.0/?method=user.getrecenttracks&user=#{username}&api_key=#{api_key}&format=json"))
	response_status = XmlSimple.xml_in(response.body, { 'ForceArray' => false })

	if response.code != "200"

    send_event('lastfm', status: failed)

  else
    data = JSON.parse(response.body)
    songs = Array.new
    data['recenttracks']['track'].each do |song|
      track_status = song.has_key? '@attr' ?  "Now Playing" : "Last Played"
      # songs.push({
      #   status: 'ok',
      #   cover: song['image'][2]['content'].nil? ? "assets/no-album-art.jpg" : song['image'][2]['content'],
      #   artist: song['artist']['#text'],
      #   track: song['name'],
      #   title: track_status
      # })
    end
    # send_event('lastfm', song: songs.slice(0, 1))
    # send_event('lastfm_cover', songs: songs.slice(0, max_length))
  end

end