# jquery-cookie-alerter

###### Why ?

To be in compliance with the ["Cookies" CNIL](http://www.cnil.fr/vos-obligations/sites-web-cookies-et-autres-traceurs/outils-et-codes-sources/la-mesure-daudience/) recommendation

![Illustration for Mobile first cookie alerter](https://raw.githubusercontent.com/siliconsalad/jquery-cookie-alerter/master/source/assets/images/mobile.png)

###### Features

- Content is injected with JavaScript for __seo-friendly__
- __Mobile first__
- Options for __custom text and translations__

###### Preprocessing
- [Slim](http://slim-lang.com) *[for html]*
- [SCSS](http://sass-lang.com) *[for css]*
- [CoffeeScript](http://coffeescript.org) *[for js]*

###### Tools
- [Middleman](http://middlemanapp.com) *[static site generator made easy]*
- [Bower](http://bower.io) *[js package management]*
- [GitHub Pages](http://pages.github.com) *[deployment/hosting]*

## Getting Started

    $ bundle
    $ middleman server
    $ middleman build

## Installation

- Use bower : `bower install jquery-cookie-alerter --save`
- [Download the latest version](https://github.com/siliconsalad/jquery-cookie-alerter/archive/master.zip)

## Use

``` javascript
  AlertLaw.start();
```

If you want to have a custom message you have some options available :

``` javascript
  AlertLaw.start({
    cookieUrl:      "path/to/info-page.html",
    messageTitle:   "Cookies",
    messageContent: "By continuing your visit to our site, you agree to (...) and make visits statistics.",
    findOutMore:    "Find out more",
    cookieName:     "cookies_law",
  });
```

## Demo

Want to see the result ? [Visit the demo page](http://siliconsalad.github.io/jquery-cookie-alerter/)

### License

Licensed under [MIT license](LICENSE).
