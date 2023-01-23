require 'sinatra'
require_relative 'task_repo'

class Sinatra::Application
    def initialize
        @tasks = TaskRepo.new
        super
    end
end

get '/' do
    erb :tasks, layout: :index
end