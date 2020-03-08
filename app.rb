require 'sinatra/base'

class Battling_again < Sinatra::Base
  get '/' do
    "Hey Kenzy!"
  end

  run! if app_file == $0
end
