# Be sure to restart your server when you modify this file.

OCTOKIT_CLIENT = Octokit::Client.new(:login => ENV['GITHUB_LOGIN'], :password => ENV['GITHUB_PASSWORD'])