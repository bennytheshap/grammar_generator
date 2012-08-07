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

Operators = ['*', '+']
Output_Alphabet = '.abcdefghijklmnopqrstuvwxyz1234567890ABCDEFGHIJKLMNOPQRSTUVWXYZ'

def make_random_grammar(symbols,length)
  operators = Operators
  if length == 0
    []
  elsif length == 1
    Array(symbols.random_element)
  else
    preceding = make_random_grammar(symbols, length - 1)
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

def singlify symbols, input
  index = Log_Symbols.index input
  if index
    Output_Alphabet[index]
  else
    input
  end
end

def singlify_string symbols, input
  (input.collect {|foo| singlify(symbols, foo)}).join
end
