﻿#:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=
#  ▼ Call Map Event
#  Author: Kread-EX
#  Version 1.0
#  Release date: 13/12/2011
#:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=:=
 
#-------------------------------------------------------------------------------------------------
#  ▼ TERMS OF USAGE
#-------------------------------------------------------------------------------------------------
# #  I made this in two minutes, so I don't really care.
#-------------------------------------------------------------------------------------------------
#  ▼ INTRODUCTION
#-------------------------------------------------------------------------------------------------
# # Restores the Call Map Event from RM2k and 2k3. I liked this function.
#-------------------------------------------------------------------------------------------------
#  ▼ INSTRUCTIONS
#-------------------------------------------------------------------------------------------------
# # Just call map_event(n) within your event and it will give control to the
# # nth event on your current map.
#-------------------------------------------------------------------------------------------------
#  ▼ COMPATIBILITY
# # How the hell could something like this be incompatible? The header is bigger than
# # the code!
#-------------------------------------------------------------------------------------------------

puts 'Load: Call Map Event v1.0 by Kread-EX'

#===========================================================================
# ■ Game_Interpreter
#===========================================================================

class Game_Interpreter
	#--------------------------------------------------------------------------
	# ● Calls a map event
	#--------------------------------------------------------------------------
	def map_event(id)
		ev = $game_map.events[id]
		if ev
			child = Game_Interpreter.new(@depth + 1)
			child.setup(ev.list, id)
			child.run
		end
	end
end