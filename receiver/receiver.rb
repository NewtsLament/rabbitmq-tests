#!/usr/bin/env ruby
# frozen_string_literal: true
require 'bunny'

connection = Bunny.new(hostname: 'rabbitmq_host')
connection.start until connection.connected?

channel = connection.create_channel
queue = channel.queue('hello')

begin
  puts ' [*] Waiting for messages. To exit press CTRL+C'
  queue.subscribe(block: true) do |_delivery_info,_properties, body|
    puts " [x] Received #{body}"
  end
rescue Interrupt => _
  connection.close

  exit(0)
end
