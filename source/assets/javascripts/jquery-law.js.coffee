class @AlertLaw

  @start: (options={}) ->
    alert = new AlertLaw(options)
    alert.loadAlert()

  constructor: (options={}) ->
    @cookieUrl      = options.cookieUrl      ? 'cookies'
    @messageTitle   = options.messageTitle   ? 'Cookies'
    @messageContent = options.messageContent ? 'En poursuivant votre navigation sur notre site, vous en acceptez l‘utilisation pour vous proposer un service personnalisé, des publicités ciblées adaptées à vos centres d’intérêts et réaliser des statistiques de visites.'
    @cookieName     = options.cookieName     ? 'cookies_law'

  buildAlert: ->
    "<div id='js-law--alert' style='display: none;'>
      <a href='#' id='js-law--close'>&#10006;</a>
      <p class='m-law--title'>#{@messageTitle}</p>
      <p>#{@messageContent}</p>
      <a href='#{@cookieUrl}'>En savoir plus</a>
    </div>"

  cookieAlreadyAccepted: ->
    @cookieContent() != ''

  cookieContent: ->
    search      = @cookieName + "="
    startString = document.cookie.indexOf(search)

    return '' if startString == -1

    startString   += search.length
    endString     = document.cookie.indexOf(';', startString)
    endString     = if endString == -1 then endString else document.cookie.length
    cookieContent = document.cookie.substring(startString, endString)
    unescape(cookieContent)

  defineEvents: ->
    $('#js-law--close').on 'click', (event) =>
      event.preventDefault()
      $("#js-law--alert").slideUp(300)

    $('a').on 'click', (event) =>
      document.cookie = "#{@cookieName}=yes; expires='#{@expirationDate()}'; path=/"

  displayAlert: ->
    message = @buildAlert()
    $('body').prepend(message)
    $('#js-law--alert').slideDown(300)

  expirationDate: ->
    month_number = 13
    current_date = expiration_date = new Date()
    expiration_date.setMonth(current_date.getMonth() + month_number)
    expiration_date.toUTCString()

  loadAlert: ->
    unless @cookieAlreadyAccepted()
      @displayAlert()
      @defineEvents()
