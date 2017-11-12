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
    @safe = Safe.where(number: params[:q])

      respond_to do |format|
      format.html {}
      format.json {
       @safe = @safe.limit(100)
      }
     end
    end

end
