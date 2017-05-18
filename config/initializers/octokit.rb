Octokit.configure do |c|
    c.connection_options[:ssl] = { :verify => false }
    c.api_endpoint = "http://github.asidua.com/api/v3/"
    stack = Faraday::RackBuilder.new do |builder|
    builder.response :logger
    builder.use Octokit::Response::RaiseError
    builder.adapter Faraday.default_adapter
    end
    Octokit.middleware = stack
end