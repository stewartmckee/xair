# frozen_string_literal: true

require 'awesome_print'
require 'xair/version'
require 'xair/client'
require 'xair/message_handler'

Dir[File.dirname(__FILE__) + '/xair/handlers/*.rb'].each { |file| require file }

module Xair
end
