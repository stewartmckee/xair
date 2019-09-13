# frozen_string_literal: true

require 'osc-ruby'

module Xair
  class MessageHandler
    def self.handle(osc_data, network)
      ip_info = []
      ip_info << network[1]
      ip_info.concat(network[2].split('.'))
      OSC::OSCPacket.messages_from_network(osc_data, ip_info).each do |message|
        command = osc_data[1..osc_data.index("\u0000") - 1].split('/').last

        ap "Xair::Handlers::#{command.capitalize}Handler"
        klass = Object.const_get "Xair::Handlers::#{command.capitalize}Handler"
        klass.new(message).handle
      end
    rescue NameError => e
      puts "No handler: #{e.message}"
    end

    def initialize(message)
      @message = message
    end
  end
end
