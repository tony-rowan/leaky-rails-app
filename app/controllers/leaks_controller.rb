class LeaksController < ApplicationController
  def index
    1000.times { $an_array << "Hello, World! (%0.2f)" %[rand] }
  end
end
