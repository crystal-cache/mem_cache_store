# Cache::MemcachedStore

[![Build Status](https://travis-ci.org/crystal-cache/memchached_cache.svg?branch=main)](https://travis-ci.org/crystal-cache/memchached_cache)

A cache store implementation that stores data in Memcached.

## Installation

1. Add the dependency to your `shard.yml`:

   ```yaml
   dependencies:
     memcached_cache:
       github: crystal-cache/memcached_cache
   ```

2. Run `shards install`

## Usage

```crystal
require "memcached_cache"
```

```crystal
cache = Cache::MemcachedStore(String, String).new(expires_in: 1.minute)
cache.fetch("today") do
  Time.utc.day_of_week
end
```

This assumes Memcached was started with a default configuration, and is listening on `localhost:11211`.

You can connect to `Memcached` by instantiating the `Memcached::Client` class.

If you need to connect to a remote server or a different port, try:

```crystal
memcached = Memcached::Client.new(host: "10.0.1.1", port: 11211)
cache = Cache::MemcachedStore(String, String).new(expires_in: 1.minute, cache: memcached)
```

## Contributing

1. Fork it (<https://github.com/crystal-cache/memcached_cache/fork>)
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

## Contributors

- [Anton Maminov](https://github.com/mamantoha) - creator and maintainer
