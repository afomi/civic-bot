module Slack
  class Helper
    def initialize(client:, data:)
      @client = client
      @data = data
    end

    def index # dot
      @client.message channel: @data['channel'], text: "Here are all the things I can do: `#{bot_methods.join(', ')}`"
    end

    def cfa(arg = "") # dot cfa:arg
      valid_args = %w(organizations projects events stories issues)
      raise Exception unless valid_args.include?(arg) || arg.empty?

      @client.message channel: @data['channel'], text: Slack::HelperText.cfa(arg)
    end

    private

    def bot_methods
      self.methods - Object.methods - [:bot_methods, :index]
    end
  end
end
