# Mostly taken from http://qiita.com/masuidrive/items/1042d93740a7a72242a3

require 'sinatra/base'
require 'json'
require 'rest-client'

class App < Sinatra::Base
  post '/odor' do
    @@odor = @params[:odor]
  end

  post '/linebot/callback' do
    params = JSON.parse(request.body.read)

=begin 
    params['result'].each do |msg|
      msg['content']['text'] = msg['content']['from']
      request_content = {
        to: [msg['content']['from']],
        toChannel: 1383378250, # Fixed  value
        eventType: "138311608800106203", # Fixed value
        content: msg['content']
      }

      endpoint_uri = 'https://trialbot-api.line.me/v1/events'
      content_json = request_content.to_json

      RestClient.proxy = 'http://fixie:txWOOjRVVdvzE5O@velodrome.usefixie.com:80'
      RestClient.post(endpoint_uri, content_json, {
        'Content-Type' => 'application/json; charset=UTF-8',
        'X-Line-ChannelID' => '1472270926',
        'X-Line-ChannelSecret' => '134d53f572c4c509be1066e020baf96e',
        'X-Line-Trusted-User-With-ACL' => 'u109f2d033f3e461a765c51f7b63be452',
      })
    end
=end

    params['result'].each do |msg|
      msg['content']['text'] = @@odor + "ヘクサだよ"
      request_content = {
        to: [msg['content']['from']],
        toChannel: 1383378250, # Fixed  value
        eventType: "138311608800106203", # Fixed value
        content: msg['content']
      }

      endpoint_uri = 'https://trialbot-api.line.me/v1/events'
      content_json = request_content.to_json

      RestClient.proxy = 'http://fixie:txWOOjRVVdvzE5O@velodrome.usefixie.com:80'
      RestClient.post(endpoint_uri, content_json, {
        'Content-Type' => 'application/json; charset=UTF-8',
        'X-Line-ChannelID' => '1472270926',
        'X-Line-ChannelSecret' => '134d53f572c4c509be1066e020baf96e',
        'X-Line-Trusted-User-With-ACL' => 'u109f2d033f3e461a765c51f7b63be452',
      })
    end

    "OK"
  end
end
