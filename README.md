# Capistrano System-V Service

Define Capistrano 3.x tasks for your System V services via a simple YAML configuration file.

This gem is a successor to [capistrano-service](https://github.com/crushlovely/capistrano-service).

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'capistrano', '~> 3.0.0'
gem 'capistrano-system-v-service'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install capistrano-system-v-service

## Setup

``` ruby
require 'capistrano/system-v-service'
```

Then add a file named `config/capistrano-system-v-service.yml` in your project with the following content:

``` yaml
system_v_services:
  - name: nginx
    roles: :all
```

Once you've done this, you'll see that several tasks are defined for each service you added:

``` bash
$ cap -T
...
cap service:nginx:reload                   # Reload the nginx service via upstart on all servers
cap service:nginx:restart                  # Restart the nginx service via upstart on all servers
cap service:nginx:start                    # Start the nginx service via upstart on all servers
cap service:nginx:status                   # Status the nginx service via upstart on all servers
cap service:nginx:stop                     # Stop the nginx service via upstart on all servers
```

You can add as many services to this YAML file as you like; tasks will be defined for all of them.  If you omit the `roles` option, the service will default to `:all`.

## Usage

Once you've set everything up, simply call your tasks directly (`cap service:nginx:restart`), or add them to your deploy flow:

``` ruby
namespace :deploy do
  after :publishing, 'service:nginx:restart'
end
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
