(function() {
  this.AlertLaw = (function() {
    AlertLaw.start = function(options) {
      var alert;
      if (options == null) {
        options = {};
      }
      alert = new AlertLaw(options);
      return alert.loadAlert();
    };

    function AlertLaw(options) {
      var _ref, _ref1, _ref2, _ref3;
      if (options == null) {
        options = {};
      }
      this.cookieUrl = (_ref = options.cookieUrl) != null ? _ref : '/cookies';
      this.messageTitle = (_ref1 = options.messageTitle) != null ? _ref1 : 'Cookies';
      this.messageContent = (_ref2 = options.messageContent) != null ? _ref2 : 'En poursuivant votre navigation sur notre site, vous en acceptez l‘utilisation pour vous proposer un service personnalisé, des publicités ciblées adaptées à vos centres d’intérêts et réaliser des statistiques de visites.';
      this.cookieName = (_ref3 = options.cookieName) != null ? _ref3 : 'cookies_law';
    }

    AlertLaw.prototype.buildAlert = function() {
      return "<div id='js-law--alert' style='display: none;'> <a href='#' id='js-law--close'>&#10006;</a> <p class='m-law--title'>" + this.messageTitle + "</p> <p>" + this.messageContent + "</p> <a href='" + this.cookieUrl + "'>En savoir plus</a> </div>";
    };

    AlertLaw.prototype.cookieAlreadyAccepted = function() {
      return this.cookieContent() !== '';
    };

    AlertLaw.prototype.cookieContent = function() {
      var cookieContent, endString, search, startString;
      search = this.cookieName + "=";
      startString = document.cookie.indexOf(search);
      if (startString === -1) {
        return '';
      }
      startString += search.length;
      endString = document.cookie.indexOf(';', startString);
      endString = endString === -1 ? endString : document.cookie.length;
      cookieContent = document.cookie.substring(startString, endString);
      return unescape(cookieContent);
    };

    AlertLaw.prototype.defineEvents = function() {
      $('#js-law--close').on('click', (function(_this) {
        return function(event) {
          event.preventDefault();
          return $("#js-law--alert").slideUp(300);
        };
      })(this));
      return $('a').on('click', (function(_this) {
        return function(event) {
          return document.cookie = _this.cookieName + "=yes; expires='" + (_this.expirationDate()) + "'; path=/";
        };
      })(this));
    };

    AlertLaw.prototype.displayAlert = function() {
      var message;
      message = this.buildAlert();
      $('body').prepend(message);
      return $('#js-law--alert').slideDown(300);
    };

    AlertLaw.prototype.expirationDate = function() {
      var current_date, expiration_date, month_number;
      month_number = 13;
      current_date = expiration_date = new Date();
      expiration_date.setMonth(current_date.getMonth() + month_number);
      return expiration_date.toUTCString();
    };

    AlertLaw.prototype.loadAlert = function() {
      if (!this.cookieAlreadyAccepted()) {
        this.displayAlert();
        return this.defineEvents();
      }
    };

    return AlertLaw;

  })();

}).call(this);
(function() {
  $(function() {
    return AlertLaw.start();
  });

}).call(this);
