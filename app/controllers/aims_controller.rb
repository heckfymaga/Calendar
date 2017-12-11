class AimsController < ApplicationController
  before_action :authenticate_user!
  def index
    @tasks = current_user.tasks.order(created_at: :desc)
  end
end
