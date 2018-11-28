class Admin::GistsController < Admin::BaseController
  before_action :set_gist, only: :destroy

  def index
    @gists = Gist.all
  end

  def destroy
    @gist.destroy
    redirect_to admin_gists_path, notice: 'Gist удален!'
  end

  private

  def set_gist
    @gist = Gist.find(params[:id])
  end
end
