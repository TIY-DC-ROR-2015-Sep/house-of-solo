require 'sinatra/base'
require './db/setup'
require './lib/all'

class HouseOfSolo < Sinatra::Base
  set :logging, true
  set :port, (ENV["PORT"] || 4567)


  get "/house_info" do
    {
      description: "This will be a long string of text.\n\n\nIt might have multiple paragraphs with <a href='www.google.com'>links</a> in them",
      member_names: ["Han Solo", "Some other person", "A third thing"]
    }.to_json
  end

  get "/character_info" do
    name = params[:name]
    if name
      {
        world: "Homeworld of #{name}",
        description: "Another potentially long string"
      }.to_json
    else
      status 400
      {
        error: "You must provide a name to search for"
      }.to_json
    end
  end
end

HouseOfSolo.run!
