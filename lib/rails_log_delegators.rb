require "rails_log_delegators/version"

#
# Creates delegators for Rails.logger.(error|warning|info|debug)
# methods.
#
# Example:
#
#    class DemoController  < ActionController::Base
#      def index
#        info "Demo controller #index has been called", parameters: params
#      end
#    end
#
module RailsLogDelegators
  [:error, :warning, :info, :debug].each do |severity|
    if defined? Rails.logger
      define_method(:logging_out) { |severity, *args| Rails.logger.send(severity, *args) }
    else
      define_method(:logging_out) { |severity, *args| puts "[#{severity}] " + args.join("") }
    end

    define_method severity do |message, options = []|
      logging_out(severity, RailsLogDelegators::format_message(message, options))
    end
  end

  private

  def self.format_message(message, options = {})
    if !options.empty?
      message + "; " + options.map { |k, v| "#{k}='#{v}'"}.join(", ")
    else
      message
    end
  end
end

class Object
  include RailsLogDelegators
end

class Class
  include RailsLogDelegators
end

