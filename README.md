Deps.io
========

This is the notifier gem for integrating apps with [Deps.io](http://deps.io).

When server starts, this gem will POST the Gemfile.lock content to Deps.io to update project dependencies.

Rails Installation
------------------

Add this line to your application's Gemfile:

    gem 'depsio'

And then execute:

    $ bundle
    $ rails generate depsio:install --api-key your_api_key_here

The generator creates a file under `config/initializers/depsio.rb` configuring Deps.io with your API key.

The default behaviour of the gem is to only operate in Rails environments that are NOT **development**, **test** & **staging**. 

You can change this by altering this array:
    
    config.enabled_environments = ["production", "staging", "custom"]

Set it to empty array and it will report errors on all environments.

### License

MIT License. Copyright 2013 LetsDoApps. [http://letsdoapps.com/](http://letsdoapps.com/)
