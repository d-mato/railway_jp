# RailwayJp

[![Test](https://github.com/d-mato/railway_jp/actions/workflows/test.yml/badge.svg)](https://github.com/d-mato/railway_jp/actions/workflows/test.yml)
[![Gem Version](https://img.shields.io/gem/v/railway_jp)](https://rubygems.org/gems/railway_jp)

Japanese railway lines and stations as Ruby objects. The data ships inside the gem, so lookups need no database and no network.

## Requirements

Ruby 3.4 or newer.

## Installation

```console
$ bundle add railway_jp
```

Or add it to your Gemfile by hand:

```ruby
gem 'railway_jp'
```

## Usage

### Stations

`find` takes an id as either an `Integer` or a `String`, and returns `nil` when nothing matches.

```ruby
station = RailwayJp::Station.find(2800209)

station.id             # => "2800209"
station.name           # => "東京"
station.line_id        # => "28002"
station.prefecture_id  # => "13"
station.postcode       # => "100-0005"
station.address        # => "東京都千代田区丸の内一丁目"
station.longitude      # => "139.764708"
station.latitude       # => "35.681753"
```

Every attribute is a `String`, coordinates included, so convert them yourself if you need numbers.

`RailwayJp::Station.all` returns every station. The data also covers stations that are no longer in service, and `all` does not filter those out.

### Lines

A station carries its line:

```ruby
station.line_name  # => "東京メトロ丸ノ内線"

line = station.line
line.id     # => "28002"
line.name   # => "東京メトロ丸ノ内線"
line.color  # => "E60012"
```

`color` is a six digit RGB hex string with no leading `#`. It is `nil` for most lines, since only a small part of the data carries one.

`RailwayJp::Line.find` and `RailwayJp::Line.all` behave like their `Station` counterparts.

### Equality

Records compare by class and id, so the same station loaded twice is equal and deduplicates:

```ruby
a = RailwayJp::Station.find(2800209)
b = RailwayJp::Station.find(2800209)

a == b          # => true
[a, b].uniq     # => [a]
```

## Development

Run `bin/setup` to install dependencies, `bundle exec rake` to run the specs and RuboCop, and `bin/console` for a session with the gem loaded.

## Releasing

Run the [Release workflow](https://github.com/d-mato/railway_jp/actions/workflows/release.yml) from the Actions tab and choose `patch`, `minor` or `major`. It bumps the version, tags it, creates the GitHub release and publishes to RubyGems through trusted publishing.

## Contributing

Bug reports and pull requests are welcome at https://github.com/d-mato/railway_jp.

## License

Available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
