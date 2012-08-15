require_relative 'utils.rb'

#Log_Symbols = ['.', :apple, :bar, :charlie, :dead, :evil, :funny, :gasp]
Log_Symbols = ['.', :MissionActionData, :PopulateGridData, :GridStateData, :DialogButtonData, :InventorySelectedData, :ToolSelectedData, :ToolUseData, :CellCollectionData, :ObjectiveActionData, :ViewSelectedData, :TissueCollectionData, :GridDestroyData, :AlmanacView]
Stop_Symbols = [:GridStateData]

20.times do |length|
  how_many_times = (Log_Symbols.length - 1) ** (length + 1)
  how_many_times.times do 
  #100.times do 
    grammar = make_random_grammar(Log_Symbols - Stop_Symbols, length)
    singlified = singlify_string(Log_Symbols, grammar)
    next if singlified.strip.length == 0
    #puts "#{singlified} \t\t\t<-- #{grammar.inspect}"
    puts singlified
  end
end
