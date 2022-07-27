class LeaksController < ApplicationController
  before_action :leak

  def index
    @leaks = $leak.sample(100)
  end


  private

  def leak
    return unless params[:leak]

    1000.times { $leak << Leak.new }
  end
end
