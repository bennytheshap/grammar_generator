class Array
  def random_element
    self[rand(self.length)]
  end
end

Symbols = [:a, :b, :c, :d, :e]
Operators = ['*', '+', '.*']

def make_random_grammar(symbols, operators, length)
  if length == 0
    []
  elsif length == 1
    Array(symbols.random_element)
  else
    preceding = make_random_grammar(symbols, operators, length - 1)
    if operators.include? preceding.last #we don't want to chain two operators together
      preceding + Array(symbols.random_element)
    else
      preceding + Array((symbols + operators).random_element)
    end
  end    
end

10.times do |length|
  (Symbols.length ** length).times do 
    output = make_random_grammar Symbols, Operators, length
    puts output.inspect
  end
end
