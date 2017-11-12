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

    if params[:q]
    @safe = Safe.where(number: params[:q])
    end
    
    if params[:qframe]
    @safe2 = Safe.where(number_of_frame: params[:qframe])
    end

    if params[:qfoundation]
    @safe3 = Safe.where(number_of_foundation: params[:qfoundation])
    end

    if params[:qslot]
    @safe4 = Safe.where(number_slot: params[:qslot])
    end

      respond_to do |format|
      format.html {}
      format.json {
       @safe = @safe
      }
     end
end
end
