require "tisoft_logging/version"
require 'act-fluent-logger-rails'
require 'lograge'

module TisoftLogging
  class Error < StandardError; end

  def self.setup(config:, user_method: :current_user, host: '127.0.0.1', fluentd_enable: true)
    config.log_level = :info
    if fluentd_enable
      config.logger = ActFluentLoggerRails::Logger.
          new(settings: {
              host: host,
              port: 24224,
              tag: "rails.#{Rails.application.class.parent_name.to_s.downcase}",
              messages_type: 'string',
              severity_key: 'INFO'
          })
    end
    config.lograge.enabled = true
    config.lograge.formatter = Lograge::Formatters::Json.new
    config.lograge.custom_payload do |controller|
      {
          ip: controller.request.remote_ip,
          user_agent: controller.request.user_agent,
          user_id: controller.send(user_method)&.id
      }
    end
    config.lograge.custom_options = lambda do |event|
      exceptions = %w(controller action format id)
      {
          params: event.payload[:params].except(*exceptions)
      }
    end
    config
  end
end
