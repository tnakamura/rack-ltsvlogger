# coding: utf-8
require "rack"
require "rack/ltsvlogger/version"

module Rack
  class LTSVLogger < ::Rack::CommonLogger
    FORMAT = %w[
      time
      host
      forwardedfor
      user
      method
      path
      query
      protocol
      status
      size
      runtime
    ].map{ |f| "#{f}:%{#{f}}" }.join("\t") + "\n"

    def log(env, status, header, began_at)
      now = Time.now
      length = extract_content_length(header)

      logger = @logger || env['rack.errors']
      logger.write FORMAT % {
        time: now.strftime("%d/%b/%Y %H:%M:%S"),
        host: env["REMOTE_ADDR"] || "-",
        forwardedfor: env['HTTP_X_FORWARDED_FOR'] || "-",
        user: env["REMOTE_USER"] || "-",
        method: env["REQUEST_METHOD"],
        path: env["PATH_INFO"],
        query: env["QUERY_STRING"].empty? ? "" : "?"+env["QUERY_STRING"],
        protocol: env["HTTP_VERSION"],
        status: status.to_s[0..3],
        size: length,
        runtime: now - began_at,
      }
    end
  end
end
