require 'resque'
require 'resque/server'
require 'resque/scheduler/server'

$redis = Redis.new(url: ENV["REDIS_URL"] || 'redis://127.0.0.1:6379')
Resque.redis = $redis
Resque.redis.namespace = 'rm'

Resque.after_fork = Proc.new { ActiveRecord::Base.establish_connection }

# if Rails.config.resque_inline.present? || Rails.env.test?
#   ActiveJob::Base.queue_adapter = :inline
# else
#   ActiveJob::Base.queue_adapter = :resque
# end

Resque::Mailer.excluded_environments = [:test]
# Resque::Mailer.argument_serializer = Resque::Mailer::Serializers::ActiveRecordSerializer
