require 'json'
require 'net/http'
require 'uri'

class SlackApiClient
  uri =  URI.parse('https://hooks.slack.com/services/XXXXXXXXX/XXXXXXXXXXX/XXXXXXXXX')
  http = Net::HTTP.new(uri.host, uri.port)
  http.use_ssl = true
  http.verify_mode = OpenSSL::SSL::VERIFY_NONE

  req = Net::HTTP::Post.new(uri.request_uri)
  req['Content-Type'] = 'application/json'

  def self.post_message(message)
    req.body = { "text" => message }.to_json
    http.request(req)
  end
end

SlackApiClient.post_message('hoge')
