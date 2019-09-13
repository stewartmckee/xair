# frozen_string_literal: false

# require 'xair/message_handler'
require 'osc-ruby'

module Xair
  class Client
    def initialize(options = {})
      @host = options[:host] || '192.168.1.15'
      @port = options[:port] || 10_024

      @socket = UDPSocket.new
      @socket.bind('0.0.0.0', @port)
      @socket.connect(@host, @port)

      Thread.new do
        loop do
          data, network = @socket.recvfrom(16_384)
          ap data
          MessageHandler.handle(data, network)
        end
      end

      @socket.send OSC::Message.new('/xremote').encode, 0
    end

    def info
      @socket.send OSC::Message.new('/info').encode, 0
    end

    def status
      @socket.send OSC::Message.new('/status').encode, 0
    end

    def set_fader(channel, level)
      msg = OSC::Message.new("/ch/#{channel.to_s.rjust(2, '0')}/mix/fader", level)
      @socket.send msg.encode, 0
    end
  end
end
