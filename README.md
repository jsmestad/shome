# Shome

Pronounced "show me" this gem provides a generator to install deployment configurations for a sandbox environment.

## Installation

Add this line to your application's Gemfile:

    gem 'shome'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install shome

## Usage

Inside of your Rails application's `Gemfile` add the following:

```
gem 'showme', github: 'jsmestad/shome'
```

Run `bundle install` to install the gem.

### Install / Update configuration

```
rails g shome:install
```

**NOTE** I recommend running the generator the first time with the `-p` flag (pretend mode) to verify your selections.

## Contributing

1. Fork it ( https://github.com/jsmestad/shome/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
