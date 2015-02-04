class AlertLaw

  @start: (options={}) ->
    alert = new AlertLaw(options)
    alert.alertOrNot()

  constructor: (options={}) ->
    @cookieUrl      = options.cookieUrl      ? '/cookies'
    @messageTitle   = options.messageTitle   ? 'Cookies'
    @messageContent = options.messageContent ? 'En poursuivant votre navigation sur notre site, vous en acceptez l‘utilisation pour vous proposer un service personnalisé, des publicités ciblées adaptées à vos centres d’intérêts et réaliser des statistiques de visites.'
    @cookieName     = options.cookieName     ? 'cookies_law'

  getCookie: ->
    search      = @cookieName + "="
    returnvalue = ""

    if document.cookie.length
      offset = document.cookie.indexOf(search)

      if offset != -1
        offset += search.length
        end = document.cookie.indexOf(";", offset)
        if end == -1
           end = document.cookie.length

        returnvalue = unescape(document.cookie.substring(offset, end))

    return returnvalue

  expirationDate: ->
    month_number    = 13
    current_date    = new Date()
    expiration_date = current_date.setMonth(current_date.getMonth() + month_number)
    expiration_date.toUTCString()

  alertOrNot: ->
    @loadAlert() if @getCookie() == ''

  buildAlert: ->
    "<div id='js-law--alert' style='display: none;'>
      <a href='#' id='js-law--close'>&#10006;</a>
      <p class='m-law--title'>#{@messageTitle}</p>
      <p>#{@messageContent}</p>
      <a href='#{@cookieUrl}'>En savoir plus</a>
    </div>"

  loadAlert: ->
    message = @buildAlert()
    $('body').prepend(message)
    $('#js-law--alert').slideDown(300)

    $('#js-law--close').on 'click', (event) =>
      event.preventDefault()
      $("#js-law--alert").slideUp(300)

    $('a').on 'click', (event) =>
      document.cookie = "#{@cookieName}=yes;expires='#{@expirationDate()}';path=/"

$ ->
  AlertLaw.start()
  # alert = new AlertLaw { cookieUrl: 'foo' }
  # alert.alertOrNot()
