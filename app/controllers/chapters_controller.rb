class ChpatersController < ApplicationController
	before_filter :authenticate_user!
	before_action  :set_course

	def index
	 @chapters = @course.chapters.all
	 render json: @chapters	
	end

	def create
		@chapter = @course.chapters.build(chapters_params)
		if @chapter.save
			render json: @chapter
		end
	end

	def update
		@chapter = @course.chapters.find(params[:id])

		if @course.update(chapters_params)
			render json: @chapter
		end
	end

	def destroy
		@chapter = @course.chapter.find(params[:id])
		@chapter.destroy
		render json: @chapter
	end
	
	private

	def chapters_params
		params.require(:chapter).permit(:name, :description, :video_url)
	end

	def set_course
		@course = Course.find(params[:course_id])
	end
end