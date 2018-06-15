# Multa - Multiple DATA Segments

``DATA`` file objects combined with ``__END__`` segments are handy for self-contained Ruby scripts. However, built-in ``DATA`` objects support only single file objects from ``__END__`` segments. To address the issue, `multa` splits or cuts ``__END__`` segments into multiple file objects.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'multa', github: 'cwchentw/multa'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install multa

## Usage

`DATA.split` splits a ``DATA`` object into a hash with (title, file) pairs:

```
require 'multa'

DATA.split.each do |k, v|
  puts "#{k} =>"
  puts v.map { |e| e }.join
end

__END__

@@ t1
foo
bar

@@ t2
baz
```

`DATA.cut` cuts a ``DATA`` object into an array of file objects:

```
require 'multa'

DATA.cut.each do |e|
  puts e.map { |e| e }.join
end

__END__

@@ t1
foo
bar

@@ t2
baz
```

`DATA.split` or `DATA.cut` may receive an optional parameter for different header:

```
require 'multa'

DATA.split('>').each do |k, v|
  puts "#{k} =>"
  puts v.map { |e| e }.join
end

__END__

> t1
foo
bar

> t2
baz
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/cwchentw/multa.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
