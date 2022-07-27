class Leak
  attr_reader :name

  def initialize(some_parameter: rand)
    @name = "I am a leak with some parameter of %0.2f" %[some_parameter]
  end
end
