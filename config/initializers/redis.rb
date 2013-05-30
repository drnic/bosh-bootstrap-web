if ENV['VCAP_SERVICES']
  $vcap_services ||= JSON.parse(ENV['VCAP_SERVICES'])
  redis_service_name = $vcap_services.keys.find { |svc| svc =~ /redis/i }
  redis_service = $vcap_services[redis_service_name].first
  $redis_config = {
    host: redis_service['credentials']['host'],
    port: redis_service['credentials']['port'],
    password: redis_service['credentials']['password']
  }
else
  $redis_config = {
    host: '127.0.0.1',
    port: 6379
  }
end

$redis = Redis.new($redis_config)
