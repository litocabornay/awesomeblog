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
end
