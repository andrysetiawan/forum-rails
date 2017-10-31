class ForumThreadsController < ApplicationController

	before_action :authenticate_user!, only: [:new, :create]
	def index
		@threads = ForumThread.order(sticky_order: :asc).order(id: :desc)
	end
	def show
		@thread = ForumThread.friendly.find(params[:id])
		@post = ForumPost.new
	end
	def new
		@thread = ForumThread.new
	end
	def create
		@thread = ForumThread.new(resource_params)
		@thread.user = current_user

		if @thread.save
			redirect_to root_path
		else
			render 'new'
		end
	end

	def edit
		@thread = ForumThread.friendly.find(params[:id])
		authorize @thread

	end

	def update
		@thread = ForumThread.friendly.find(params[:id])
		authorize @thread

		if @thread.update(resource_params)
			redirect_to forum_thread_path(@thread)
		else
			render 'new'
		end
	end

	def pinit
		@thread = ForumThread.friendly.find(params[:id])
		@thread.pinit!
		redirect_to root_path
	end

	private
	def resource_params
		params.require(:forum_thread).permit(:title,:content)
	end
end
