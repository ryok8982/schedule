class TasksController < ApplicationController
    def index
        @tasks = Task.all
       
    end
    
    def new
        
    end
    
    def check
        @task = Task.find_by(id: params[:id])
    end
    
    def edit
        @task = Task.find_by(params[:id])
    end
    
    def update
        @task = Task.find_by(params[:id])
        if @task.update(title: params[:title], start: params[:start], finish: params[:finish], allday: params[:allday], memo: params[:memo])
            redirect_to "/tasks"
        else
            render "/tasks/edit"
        end
    end
    

    def task_params
       params.require(:task).permid(:title, :start, :finish, :allday, :memo) 
    end
    
    def create
        Task.create(title: params[:title], start: params[:start], finish: params[:finish], allday: params[:allday], memo: params[:memo])
        
        redirect_to "/tasks"
    end
    
    def destroy
        @task = Task.find(params[:id])
        @task.destroy
        redirect_to "/tasks"
    end
end
