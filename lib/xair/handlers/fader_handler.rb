# frozen_string_literal: true

module Xair
  module Handlers
    class FaderHandler < MessageHandler
      def handle
        @channel = @message.address.split('/')[2]
        @level = @message.to_a.first

        puts "Fader on channel #{@channel} set to #{(@level * 100).to_i}%"
      end
    end
  end
end
