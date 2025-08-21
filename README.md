# Cache::MemCacheStore

[![Crystal CI](https://github.com/crystal-cache/mem_cache_store/actions/workflows/crystal.yml/badge.svg)](https://github.com/crystal-cache/mem_cache_store/actions/workflows/crystal.yml)
[![GitHub release](https://img.shields.io/github/release/crystal-cache/mem_cache_store.svg)](https://github.com/crystal-cache/mem_cache_store/releases)

A [cache](https://github.com/crystal-cache/cache) store implementation that stores data in Memcached.

## Installation

1. Add the dependency to your `shard.yml`:

   ```yaml
   dependencies:
     mem_cache_store:
       github: crystal-cache/mem_cache_store
   ```

2. Run `shards install`

## Usage

```crystal
require "mem_cache_store"
```

```crystal
cache = Cache::MemCacheStore(String, String).new(expires_in: 1.minute)
cache.fetch("today") do
  Time.utc.day_of_week
end
```

This assumes Memcached was started with a default configuration, and is listening on `localhost:11211`.

You can connect to `Memcached` by instantiating the `Memcached::Client` class.

If you need to connect to a remote server or a different port, try:

```crystal
memcached = Memcached::Client.new(host: "10.0.1.1", port: 11211)
cache = Cache::MemCacheStore(String, String).new(expires_in: 1.minute, cache: memcached)
```

## Contributing

1. Fork it (<https://github.com/crystal-cache/mem_cache_store/fork>)
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

## Contributors

- [Anton Maminov](https://github.com/mamantoha) - creator and maintainer
