Airbrake.configure do |config|
  config.api_key = Figaro.env.airbrake_key!
end
