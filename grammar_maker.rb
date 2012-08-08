require_relative 'utils.rb'

#Log_Symbols = ['.', :apple, :bar, :charlie, :dead, :evil, :funny, :gasp]
Log_Symbols = ['.', :MissionActionData, :PopulateGridData, :GridStateData, :DialogButtonData, :InventorySelectedData, :ToolSelectedData, :ToolUseData, :CellCollectionData, :ObjectiveActionData, :ViewSelectedData, :TissueCollectionData, :GridDestroyData, :AlmanacView]
20.times do |length|
  #((Log_Symbols.length-1) ** length).times do 
  100.times do 
    grammar = make_random_grammar(Log_Symbols, length)
    singlified = singlify_string(Log_Symbols, grammar)
    next if singlified.strip.length == 0
    puts "#{singlified} \t\t\t<-- #{grammar.inspect}"
    #puts singlified
  end
end
