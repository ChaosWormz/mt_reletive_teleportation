minetest.register_chatcommand("tp", {
	params = "<Axis> <Number>",
	description = "Relative Teleportation",
	privs = {teleport = true},
	func = function(name,param)
		currPos = minetest.get_player_by_name(name):getpos()
		if param == "" then
			minetest.chat_send_player(name, "Incorrect usage.<X|Y|Z> <Number>")
			return false
		end
		
		local args = param:split(" ")
		if #args < 2 then
			minetest.chat_send_player(name, "Incorrect usage.<X|Y|Z> <Number>")
		end
		
		if not tonumber(args[2]) then
			return false, "Not a Number!"
		end
		
		if args[1] == "x" then
			currPos["x"] = currPos["x"] + tonumber(args[2])
			minetest.get_player_by_name(name):setpos(currPos)
		elseif args[1] == "y" then
			currPos["y"] = currPos["y"] + tonumber(args[2])
			minetest.get_player_by_name(name):setpos(currPos)
		elseif args[1] == "z" then
			currPos["z"] = currPos["z"] + tonumber(args[2])
			minetest.get_player_by_name(name):setpos(currPos)
		else
			minetest.chat_send_player(name,"Not valid axis")
		end
		minetest.chat_send_player(name,"Teleported!")
	end,
})

