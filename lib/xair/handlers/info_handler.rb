# frozen_string_literal: true

module Xair
  module Handlers
    class InfoHandler < MessageHandler
      def handle
        puts "#{@message.ip_address}:#{@message.ip_port} -- #{@message.address} -- #{@message.to_a}"
      end
    end
  end
end
