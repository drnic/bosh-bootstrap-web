if $redis_config[:password]
  redis_url = "redis://:#{$redis_config[:password]}@#{$redis_config[:host]}:#{$redis_config[:port]}/0"
else
  redis_url = "redis://#{$redis_config[:host]}:#{$redis_config[:port]}/0"
end
Rails.logger.info "Setting sidekiq redis: #{{ url: redis_url, namespace: 'sidekiq' }.inspect}"
Sidekiq.redis = { url: redis_url, namespace: 'sidekiq' }
