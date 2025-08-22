require "cache"
require "memcached"

module Cache
  # A cache store implementation which stores data in Memcached.
  #
  # ```
  # cache = Cache::MemCacheStore(String).new(expires_in: 1.minute)
  # cache.fetch("today") do
  #   Time.utc.day_of_week.to_s
  # end
  # ```
  #
  # This assumes Memcached was started with a default configuration, and is listening on `localhost:11211`.
  struct MemCacheStore(V) < Store(V)
    @cache : Memcached::Client

    def initialize(@expires_in : Time::Span, @cache = Memcached::Client.new)
    end

    private def write_impl(key : String, value : V, *, expires_in = @expires_in)
      @cache.set(key, value.to_s, expires_in.total_seconds.to_i)
    end

    private def read_impl(key : String)
      @cache.get(key)
    end

    private def delete_impl(key : String) : Bool
      @cache.delete(key)
    end

    private def exists_impl(key : String) : Bool
      !!@cache.get(key)
    end

    def increment(key : String, amount = 1)
      @cache.increment(key, amount)
    end

    def decrement(key : String, amount = 1)
      @cache.decrement(key, amount)
    end

    def clear
      @cache.flush
    end
  end
end
