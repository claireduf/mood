require "sinatra"
require_relative "./database"
require 'clarke'
require 'clarke/messenger'

Clarke::Messenger::Config.facebook_page_token = ENV['FACEBOOK_PAGE_TOKEN']

post '/messenger' do
  request_body = JSON.parse(request.body.read)
  Clarke.process_request(Clarke::Messenger, request_body)
end

post '/platform' do
  request_body = JSON.parse(request.body.read)
  Clarke.process(Clarke::PlatformLibrary, request_body)
end