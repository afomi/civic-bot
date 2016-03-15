require 'open-uri'

module Slack
  class HelperText

    def self.cfa(command = "")
      base_api_url = "http://codeforamerica.org/api"

      text = ""

      # Respond to each command/resource-name
      if command == "organizations"
        url = "#{base_api_url}/organizations"
        organizations = JSON.parse(open(url).read)["objects"]

        organizations.collect do |org|
          text << "#{org['name']} - #{org['website']}\n"
        end
      elsif command == "projects"
        url = "#{base_api_url}/projects"
        projects = JSON.parse(open(url).read)["objects"]

        projects.collect do |project|
          text << "#{project['name']} - #{project['link_url']}\n"
        end
      elsif command == "events"
        url = "#{base_api_url}/events"
        events = JSON.parse(open(url).read)["objects"]

        events.collect do |event|
          text << "#{event['name']} - #{event['event_url']}\n"
        end
      elsif command == "stories"
        url = "#{base_api_url}/stories"
        stories = JSON.parse(open(url).read)["objects"]

        stories.collect do |story|
          text << "#{story['title']} - #{story['link']}\n"
        end
      elsif command == "issues"
        url = "#{base_api_url}/issues"
        issues = JSON.parse(open(url).read)["objects"]

        issues.collect do |issue|
          text << "#{issue['title']} - #{issue['html_url']}\n"
          text << "#{issue['project']['name']} - #{issue['project']['code_url']}\n"
        end
      else
        text = "issue dot cfa:`organizations|projects|events|stories|issues`"
      end

      text
    end

  end
end
