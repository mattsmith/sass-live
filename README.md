# sass_live

Live/Dynamic Compilation of Sass for Ruby on Rails. Ideal for when user's of your system can provide css customization values.

sass-live provides an endpoint (routes, controller & action) that'll generate and cache dynamic css.

The data used to customize your css can be provided as an injectable dependency. See [Configuration](#configuration) for more details.

## Installation

Add this to your Gemfile:

```ruby
gem 'sass-live'
```

Then install it by running Bundler:

```bash
$ bundle
```

## Configuration

Once installed you can use the ```sass-live:install``` generator to scaffold in the configuration hooks for sass-live.

## Usage in Production

sass-live's css generation controller will automatically cache results based on the ```#cache_key``` value of your injected data dependency. This is like a page cache.

However, if you prefer pre-computing the dynamic css values you can customize the generated rake task to enumerate over your data dependencies.

For instance, lets consider a service that allows users to customize their colours. You may have an active record class, ```Colour```.

The css generation controller will use ```Colour#cache_key``` for the page cache. The block you provide the rake task should yield successive ```Colour``` instances.

```
Sass::Live::RakeTask.new do
  Colour.find_each do |colour|
    yield(colour)
  end
end
```
