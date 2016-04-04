class Dashing.lastfm extends Dashing.Widget

  ready: ->
    status = $(@node).find('p.status')
    if status.html() == 'ok'
      status.remove()

  onData: (data) ->
    console.log( data );