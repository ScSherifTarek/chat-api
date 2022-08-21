# The constant below will represent ONE connection, present globally in models, controllers, views etc for the instance. No need to do Redis.new everytime
REDIS = Redis::Namespace.new(
    "chat-api", 
    :redis => Redis.new(host: ENV['REDIS_HOST'], port: ENV['REDIS_PORT'].to_i)
)