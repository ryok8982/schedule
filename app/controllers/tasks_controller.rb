class TasksController < ApplicationController
    def index
        @task = Task.all
       
    end
    
    def new
        @task = Task.new
    end
    
    def check
        @task = Task.find_by(id: params[:id])
    end
    
    def edit
        @task = Task.find_by(id: params[:id])
        @allday = Task.find_by(params[:allday])
    end
    
    def update
        @task = Task.find_by(params[:id])
        if @task.update(params.require(:task).permit(:title, :start, :finish, :allday, :memo))
            flash[:notice] = "スケジュールの情報を更新しました"
            redirect_to "/tasks"
        else
            render "edit"
        end
        # if @task.update(title: params[:title], start: params[:start], finish: params[:finish], allday: params[:allday], memo: params[:memo])
        #     redirect_to "/tasks"
        # else
        #     render "/tasks/edit"
        # end
    end
    

    def task_params
       params.require(:task).permid(:title, :start, :finish, :allday, :memo) 
    end
    
    def create
        @task = Task.new(params.require(:task).permit(:title, :start, :finish, :allday, :memo))
        if @task.save
            flash[:notice] = "スケジュールを作成しました"
            redirect_to "/tasks"
        else
            render "tasks/new"
        end
    end
    
    def destroy
        @task = Task.find(params[:id])
        @task.destroy
        redirect_to "/tasks"
    end
end
