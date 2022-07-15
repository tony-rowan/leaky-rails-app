require 'bundler/inline'

gemfile do
  source 'https://rubygems.org'
  gem 'derailed_benchmarks', require: 'derailed_benchmarks'
end

report = MemoryProfiler.report do
  an_array = []

  loop do
    break if an_array.size > 10000

    1000.times { an_array << "A" + "B" + "C" }
    puts "Array is #{an_array.size} items long"
  end

  GC.start
end

report.pretty_print
