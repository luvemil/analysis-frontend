require 'rack-proxy'

class Rack::RailsProxy < Rack::Proxy
  def initialize(app)
    @app = app
  end

  def call(env)
    original_host = env["HTTP_HOST"]
    rewrite_env(env)
    if env["HTTP_HOST"] != original_host
      ret = perform_request(env)
    else
      # just regular
      ret = @app.call(env)
    end
    ret
  end

  def rewrite_env(env)
    request = Rack::Request.new(env)
    if request.path =~ %r{^/api}
      env["HTTP_HOST"] = "localhost:1337"
    end
    env
  end
end

module Rack
  class Lint
    def call(env=nil)
      @app.call(env)
    end
  end
end
