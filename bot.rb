require 'slack'
require_relative 'slack/helper'
require_relative 'slack/helper_text'

Slack.configure do |config|
  config.token = ENV['SLACK_API_TOKEN']
end

class Slack::Go
  def initialize
    client = Slack::RealTime::Client.new

    client.on :hello do
      puts "Successfully connected, welcome '#{client.self['name']}' to the '#{client.team['name']}' team at https://#{client.team['domain']}.slack.com."
    end

    client.on :message do |data|
      case data['text']
      when 'dot resources' then
        Slack::Helper.new(client: client, data: data).resources
      when 'dot cfa' then
        Slack::Helper.new(client: client, data: data).cfa
      when /^dot cfa:(organizations|projects|events|stories|issues)/ then
        Slack::Helper.new(client: client, data: data).cfa($1)
      when 'dot' then
        Slack::Helper.new(client: client, data: data).index
      when /^dot/ then
        client.message channel: data['channel'], text: "Sorry <@#{data['user']}>, what?"
      end
    end

    client.start!
  end
end

Slack::Go.new
