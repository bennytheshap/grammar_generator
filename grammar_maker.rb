require 'rubygems'
require 'bundler/setup'
require 'poisson'
class Array
  def random_element
    self[rand(self.length)]
  end
end

#borrowed from: http://www.ruby-forum.com/topic/104729
def poisson_random lambda
   l = Math.exp(-lambda)
   k = 0
   p = 1
   while p >= l
     k += 1
     u = rand
     p = p *u
   end
   k - 1
end

Log_Symbols = [:foo, :bar, :charlie, :dead, :evil, '.']
Operators = ['*', '+']
Alphabet = 'abcdefghijklmnopqrstuvwxyz1234567890ABCDEFGHIJKLMNOPQRSTUVWXYZ'

def make_random_grammar(symbols, operators, length)
  if length == 0
    []
  elsif length == 1
    Array(symbols.random_element)
  else
    preceding = make_random_grammar(symbols, operators, length - 1)
    if operators.include? preceding.last #we don't want to chain two operators together, but may want to add a group
      groupiness = [preceding.length + 1, poisson_random(3)].min
      if groupiness <= 3 #no need to group
      else
        preceding.insert(0-groupiness, '(')
        preceding.insert(-2, ')')
      end
      preceding + Array(symbols.random_element)
    else
      preceding + Array((symbols + operators).random_element)
    end
  end    
end

def singlify input
  symbols_to_map = Log_Symbols.clone
  symbols_to_map.delete '.'
  index = symbols_to_map.index input
  if index
    Alphabet[index]
  else
    input
  end
end

def singlify_string input
  (input.collect {|foo| singlify(foo)}).join
end



10.times do |length|
  (Log_Symbols.length ** length).times do 
    output = singlify_string make_random_grammar Log_Symbols, Operators, length
    puts output.inspect
  end
end
