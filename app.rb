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

patch '/tasks/:id' do
    @tasks.all[params[:id].to_i].mark_as_done!
    erb :tasks
end

delete '/tasks/:id' do
    @tasks.all.delete_at(params[:id].to_i)
    erb :tasks
end