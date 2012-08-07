require_relative 'utils.rb'

Log_Symbols = ['.', :foo, :bar, :charlie, :dead, :evil]

10.times do |length|
  (Log_Symbols.length ** length).times do 
    grammar = make_random_grammar(Log_Symbols, length)
    singlified = singlify_string(Log_Symbols, grammar)
    puts "#{singlified} <-- #{grammar.inspect}"
  end
end
