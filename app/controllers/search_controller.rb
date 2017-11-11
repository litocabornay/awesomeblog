class SearchController < ApplicationController
	def index
  end

  def search
    @machine = Maker.all

    respond_to do |format|
      format.html {}
      format.json {
        @machine = @machine.limit(100)
      }
    end
  end

    def check
    # @safe_check = Safe.search(params[:number])
    @safe_check = Safe.all
      respond_to do |format|
      format.html {}
      format.json {
      render :json => { exist: @safe.present? }

      }
     end
    end
end
