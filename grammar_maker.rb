require_relative 'utils.rb'
require 'set'
require 'bloomfilter-rb'

#Log_Symbols = ['.', :apple, :bar, :charlie, :dead, :evil, :funny, :gasp]
Log_Symbols = ['.', :MissionActionData, :PopulateGridData, :GridStateData, :DialogButtonData, :InventorySelectedData, :ToolSelectedData, :ToolUseData, :CellCollectionData, :ObjectiveActionData, :ViewSelectedData, :TissueCollectionData, :GridDestroyData, :AlmanacView]
Stop_Symbols = [:GridStateData]

already_made = BloomFilter::Native.new(:size => 2**24, :bucket => 8, :raise => true)
count = 1
10.times do |length|
  how_many_times = (Log_Symbols.length - 1) ** (length + 1)
  how_many_times = 100000 #just a few for testing purposes
  how_many_times.times do 
    grammar = make_random_grammar(Log_Symbols - Stop_Symbols, length)
    singlified = singlify_string(Log_Symbols, grammar).strip
    if (singlified.length == 0) or (already_made.include? singlified)
      next
    else
      already_made.insert singlified
      #puts "#{count}: #{singlified}"
      puts singlified
    end
    count += 1
  end
end


#$stderr.puts already_made.stats