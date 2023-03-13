#!/usr/bin/env ruby
# frozen_string_literal: true

require 'bunny'

connection = Bunny.new(hostname: 'rabbitmq_host')
connection.start until connection.connected?
channel = connection.create_channel

queue = channel.queue('hello')


channel.default_exchange.publish('Hello world!', routing_key: queue.name)
puts " [x] Sent 'Hello World!'"

connection.close
