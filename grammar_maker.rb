require_relative 'utils.rb'

Log_Symbols = ['.', :apple, :bar, :charlie, :dead, :evil, :funny, :gasp]

10.times do |length|
  ((Log_Symbols.length-1) ** length).times do 
    grammar = make_random_grammar(Log_Symbols, length)
    singlified = singlify_string(Log_Symbols, grammar)
    puts "#{singlified} \t\t\t<-- #{grammar.inspect}"
  end
end
