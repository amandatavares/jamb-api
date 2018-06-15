class StudentsController < ApplicationController

# GET /students
    def index
        # @students = Student.all
        # json_response(@students)

        students = Student.order('created_at DESC');
		render json: {status: 'SUCCESS', message:'Estudantes carregados', data:students},status: :ok
    end
# Listar artigo passando ID
# GET /students/[:id]
    def show
        student = Student.find(params[:id])
        render json: {status: 'SUCCESS', message:'Loaded student', data:student},status: :ok
    end
# Criar um novo artigo
# POST /students
    def create
        student = Student.new(student_params)
        if student.save
            render json: {status: 'SUCCESS', message:'Saved student', data:student},status: :ok
        else
            render json: {status: 'ERROR', message:'Students not saved', data:student.erros},status: :unprocessable_entity
        end
    end
# Excluir artigo
# DELETE /students/[:id]
    def destroy
        student = Student.find(params[:id])
        student.destroy
        render json: {status: 'SUCCESS', message:'Deleted student', data:student},status: :ok
    end
# PUT /students/[:id]
    def update
        student = Student.find(params[:id])
        if student.update_attributes(student_params)
            render json: {status: 'SUCCESS', message:'Updated student', data:student},status: :ok
        else
            render json: {status: 'ERROR', message:'Students not update', data:student.erros},status: :unprocessable_entity
        end
    end
    private
    def student_params
        params.require(:student).permit(:imageUrl,:name,:university,:major,:area,:startDate,:job,:phone,:email,:password)
    end
end
