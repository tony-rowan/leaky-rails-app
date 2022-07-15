class LeaksController < ApplicationController
  class Leak
    attr_accessor :id, :array

    def initialize(id)
      @id = id
      @array = []
    end

    def grow
      1000.times { @array << "ABC" }
    end
  end

  def index
    leak = Leak.new(rand(1..10))

    if $a_hash[leak]
      leak.array = $a_hash[leak]
      leak.grow
      $a_hash[leak] = leak.array
    else
      $a_hash[leak] = leak.array
    end

    render json: $a_hash
  end
end
