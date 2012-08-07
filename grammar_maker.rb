require_relative 'utils.rb'

Log_Symbols = ['.', :foo, :bar, :charlie, :dead, :evil]

10.times do |length|
  (Log_Symbols.length ** length).times do 
    output = singlify_string(Log_Symbols, make_random_grammar(Log_Symbols, length))
    puts output.inspect
  end
end
