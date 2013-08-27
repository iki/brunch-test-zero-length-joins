exports.config =
  # See docs at https://github.com/brunch/brunch/blob/master/docs/config.md.

  # Enable or disable minifying of result js / css files.
  optimize: no

  # Install growlnotify to get notifications ~ https://github.com/brunch/brunch/issues/294
  notifications: yes

  conventions:
    dontwatch: /// # not implemented in brunch yet
      \.(html|css|json|md|xml|png|jpe?g|svg|otf|eot|ttf|woff|jar|git.*)$
      ///
    ignored: ///
      ( (^|\\|/)(node_modules|build|dist|tests?|docs|scripts)($|\\|/)
      | ^vendor.*\.(sass|scss|less|styl|coffee|min\.js)$
      | (^|\\|/)[_.!]
      )///
    assets: /^app[\\\/]assets[\\\/]/

  modules:
    definition: false
    wrapper: false

  paths:
    public: '.build'
    jadeCompileTrigger: '.compile-jade'  # Defaults to 'js/dontUseMe'.

  files:
    javascripts:
      joinTo:
        'js/app.js': /^app[\\\/](?!config)(?!ie8)/
        'js/ie8.js': /(^app[\\\/]ie8|[\\\/](html5shiv)\.js$)/  # fixme: html5shiv.js is not joined
        'js/config.js': /^app[\\\/]config\..*$/
        'js/vendor.js': /// # vendor lib for common browsers except IE, uses zepto + fixme: zepto sources not joined
          ^vendor.*[\\/](
                console-polyfill[\\/]index
              # zepto[\\/]zepto
              | zepto-sources[\\/]src[\\/](zepto|ajax|data|detect|event|form|fx|fx_methods|polyfill|selector|touch)
              # zepto-sources[\\/]src[\\/](zepto|ajax|assets|data|detect|event|form|fx|fx_methods|gesture|polyfill|selector|stack|touch)
                # be sure to include data, selector and detect modules for bootstrap support
                # https://github.com/madrobby/zepto/commit/1d5daef9f8abd9b92340c135bfbb11a7ce1a83a6
              | zepto-replace-jquery
              # html5shiv
              # html5shiv-printshiv
              | angular
              # angular-cookies
              # angular-mocks
              # angular-resource
              # angular-sanitize
              # bootstrap-affix
              | bootstrap-alert
              | bootstrap-button
              | bootstrap-carousel
              # bootstrap-collapse
              | bootstrap-dropdown
              # bootstrap-modal
              # bootstrap-popover
              # bootstrap-scrollspy
              | bootstrap-tab
              # bootstrap-tooltip
              # bootstrap-transition
              # bootstrap-typeahead
            )\.js$
          ///
        'js/vendor-ie.js': /// # vendor lib for IE, uses jquery
          ^vendor.*[\\/](
                console-polyfill[\\/]index
              | jquery
              # jquery-migrate
              # html5shiv
              # html5shiv-printshiv
              | angular
              # angular-cookies
              # angular-mocks
              # angular-resource
              # angular-sanitize
              # bootstrap-affix
              | bootstrap-alert
              | bootstrap-button
              | bootstrap-carousel
              # bootstrap-collapse
              | bootstrap-dropdown
              # bootstrap-modal
              # bootstrap-popover
              # bootstrap-scrollspy
              | bootstrap-tab
              # bootstrap-tooltip
              # bootstrap-transition
              # bootstrap-typeahead
            )\.js$
          ///
        'test/scenarios.js': /^test[\\\/]e2e/
      order:
        before: [
          'vendor/html5shiv/src/html5shiv.js'
          'vendor/html5shiv/src/html5shiv-printshiv.js'
          'vendor/console-polyfill/index.js'
          'vendor/zepto/zepto.js'
          'vendor/zepto-sources/src/zepto.js'
          'vendor/zepto-sources/src/ajax.js'
          'vendor/zepto-sources/src/assets.js'
          'vendor/zepto-sources/src/data.js'
          'vendor/zepto-sources/src/detect.js'
          'vendor/zepto-sources/src/event.js'
          'vendor/zepto-sources/src/form.js'
          'vendor/zepto-sources/src/fx.js'
          'vendor/zepto-sources/src/fx_methods.js'
          'vendor/zepto-sources/src/gesture.js'
          'vendor/zepto-sources/src/polyfill.js'
          'vendor/zepto-sources/src/selector.js'
          'vendor/zepto-sources/src/stack.js'
          'vendor/zepto-sources/src/touch.js'
          'vendor/zepto-replace-jquery/zepto-replace-jquery.js'
          'vendor/jquery/jquery.js'
          'vendor/angular/angular.js'
          'vendor/angular-cookies/angular-cookies.js'
          'vendor/angular-resource/angular-resource.js'
          'vendor/angular-sanitize/angular-sanitize.js'
          'vendor/bootstrap/js/bootstrap-affix.js'
          'vendor/bootstrap/js/bootstrap-alert.js'
          'vendor/bootstrap/js/bootstrap-button.js'
          'vendor/bootstrap/js/bootstrap-carousel.js'
          'vendor/bootstrap/js/bootstrap-collapse.js'
          'vendor/bootstrap/js/bootstrap-dropdown.js'
          'vendor/bootstrap/js/bootstrap-modal.js'
          'vendor/bootstrap/js/bootstrap-popover.js'
          'vendor/bootstrap/js/bootstrap-scrollspy.js'
          'vendor/bootstrap/js/bootstrap-tab.js'
          'vendor/bootstrap/js/bootstrap-tooltip.js'
          'vendor/bootstrap/js/bootstrap-transition.js'
          'vendor/bootstrap/js/bootstrap-typeahead.js'
          'vendor/bootstrap-sass/js/bootstrap-affix.js'
          'vendor/bootstrap-sass/js/bootstrap-alert.js'
          'vendor/bootstrap-sass/js/bootstrap-button.js'
          'vendor/bootstrap-sass/js/bootstrap-carousel.js'
          'vendor/bootstrap-sass/js/bootstrap-collapse.js'
          'vendor/bootstrap-sass/js/bootstrap-dropdown.js'
          'vendor/bootstrap-sass/js/bootstrap-modal.js'
          'vendor/bootstrap-sass/js/bootstrap-popover.js'
          'vendor/bootstrap-sass/js/bootstrap-scrollspy.js'
          'vendor/bootstrap-sass/js/bootstrap-tab.js'
          'vendor/bootstrap-sass/js/bootstrap-tooltip.js'
          'vendor/bootstrap-sass/js/bootstrap-transition.js'
          'vendor/bootstrap-sass/js/bootstrap-typeahead.js'
          'app/app.coffee'
          'app/cfg.coffee'
          'app/routes.coffee'
        ]

    stylesheets:
      joinTo:
        'css/app.css': /^(app|--vendor)[\\\/]/
      order:
        before: [
          'app/styles/app.less'
          'app/styles/app.sass'
        ]

    templates:
      joinTo:
        '.compile-jade': /^app/  # Hack for auto-compiling Jade templates.

  plugins:
    jade:
      pretty: yes  # Adds pretty-indentation whitespaces to output (false by default).

    jade_angular:
      modules_folder: 'partials'
      locals: {}
