# This file is used by Rack-based servers to start the application.

# faye server

require 'faye'

Faye::WebSocket.load_adapter('thin')

app = Faye::RackAdapter.new(:mount => '/faye', :timeout => 25)

run app

# rails server

require ::File.expand_path('../config/environment',  __FILE__)

run Rails.application
