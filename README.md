# jquery-cookie-alerter

Why ?

To be in compliance with the ["Cookies" CNIL](http://www.cnil.fr/vos-obligations/sites-web-cookies-et-autres-traceurs/outils-et-codes-sources/la-mesure-daudience/) recommendation

![Illustration for Mobile first cookie alerter]()

Features :

- Content is injected with JavaScript for seo-friendly
- Mobile first
- Options for custom text and translations

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

How to get the script ?

- Use bower : `bower install jquery-cookie-alerter --save`
- Download the latest version

## Use

    AlertLaw.start();

If you want to have a custom message you have some options available :

    AlertLaw.start({
      cookieUrl: "path/to/info-page.html"
      messageTitle: "Cookies"
      messageContent: "By continuing your visit to our site, you agree to (...) and make visits statistics."
      cookieName: "cookies_law"
    });

## Demo

Want to see the result ? [Visit hte demo page]()

### License

Licensed under [MIT license](LICENSE).
