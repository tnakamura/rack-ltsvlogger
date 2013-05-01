# Rack::LTSVLogger

LTSV logger middleware for Rack application.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'rack-ltsvlogger', require: "rack/ltsvlogger"
```

And then execute:

```
$ bundle
```

Or install it yourself as:

```
$ gem install rack-ltsvlogger
```

## Usage

```ruby
require "rack/ltsvlogger"

class SampleApp
  def call(env)
    [200, {"Content-Type" => "text/html"}, ["Hello"]]
  end
end

use Rack::LTSVLogger
run SampleApp.new
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
