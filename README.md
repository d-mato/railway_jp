# RailwayJp

A library for providing Japanese railways and stations.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'railway_jp'
```

## Usage

### Get all stations

```ruby
RailwayJp::Station.all
# => [#<RailwayJp::Station:0x0000000000000000
#   @address="北海道函館市若松町１２-１３",
#   @id="1110101",
#   @latitude="41.773709",
#   @line_id="11101",
#   @longitude="140.726413",
#   @name="函館",
#   @postcode="040-0063",
#   @prefecture_id="1">,
#  #<RailwayJp::Station:0x0000000000000000
#   @address="函館市亀田本町",
#   @id="1110102",
#   @latitude="41.803557",
#   @line_id="11101",
#   @longitude="140.733539",
#   @name="五稜郭",
#   @postcode="041-0813",
#   @prefecture_id="1">,
# ...
```

### Find a station by id

```ruby
station = RailwayJp::Station.find(2800209)
# => #<RailwayJp::Station:0x0000000000000000
#  @address="東京都千代田区丸の内一丁目",
#  @id="2800209",
#  @latitude="35.681753",
#  @line_id="28002",
#  @longitude="139.764708",
#  @name="東京",
#  @postcode="100-0005",
#  @prefecture_id="13">
```

### Get railway information

```ruby
station = RailwayJp::Station.find(2800209)
station.line_name
# => "東京メトロ丸ノ内線"
station.line
# => #<RailwayJp::Line:0x0000000000000000
#  @color="E60012",
#  @id="28002",
#  @name="東京メトロ丸ノ内線">
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/railway_jp.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
