## Description

Simple [Dashing](http://shopify.github.com/dashing) widget (and associated job) to display the most recently listened to track via LastFM or the song that is currently playing. Uses the [LastFM API](http://www.last.fm/api).

##Dependencies

[xml-simple](http://rubygems.org/gems/xml-simple)

Add it to dashing's gemfile:

    gem 'xml-simple'
    
and run `bundle install`. Everything should work now :)

##Usage

To use this widget, copy `lastfm.html`, `lastfm.coffee`, and `lastfm.scss` into the `/widgets/lastfm` directory. Put the `lastfm.rb` file in your `/jobs` folder.

To include the widget in a dashboard, add the following snippet to the dashboard layout file:

    <li data-row="1" data-col="1" data-sizex="1" data-sizey="1">
      <div data-id="lastfm" data-view="lastfm"></div>
    </li>
    
##Settings

You'll need to add the LastFM username of the account you wish to use for the widget and also a API key for you to be able to accesss the data.

##Preview

![](http://f.cl.ly/items/0L0y472Y3P1K0t0z1E0s/NowPlaying.jpg)
![](http://f.cl.ly/items/0g2p2p0I3U3r2m2V0Y0Z/LastPlayed.jpg)

##Notes

This is currently a work in progress, feel free to build on this or improve it in anyway you want