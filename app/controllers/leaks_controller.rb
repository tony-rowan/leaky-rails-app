class LeaksController < ApplicationController
  before_action :leak

  def index
    Appsignal.instrument('leak.fetch_leaks') do
      @leaks = $leak.sample(100)
    end
  end


  private

  def leak
    return unless params[:leak]

    Appsignal.instrument('leak.create_leaks') do
      1000.times { $leak << Leak.new }
    end
  end
end
