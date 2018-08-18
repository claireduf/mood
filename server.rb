require "sinatra"
require_relative "./database"
require 'clarke'
require 'clarke/platformlib'
require 'clarke/messenger'

Clarke::Messenger::Config.facebook_page_token = 'your_facebook_page_token'

post '/messenger' do
  request_body = JSON.parse(request.body.read)
  Clarke.process_request(Clarke::Messenger, request_body)

post '/platform' do
  request_body = JSON.parse(request.body.read)
  Clarke.process(Clarke::PlatformLibrary, request_body)
end