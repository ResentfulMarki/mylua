local CATEGORY_NAME = "ULX Extra"

------------------------------ FRespawn ------------------------------

function ulx.respawn( calling_ply, target_ply )

	if not target_ply:Alive() then
		target_ply:Spawn()
		ulx.fancyLogAdmin( calling_ply, false, "#A respawed #T", target_ply )
	else
		ULib.tsayError( calling_ply, target_ply:Nick() .. " is already alive!" )
    end

end


local respawn = ulx.command( "Utility", "ulx respawn", ulx.respawn, "!respawn", false )
respawn:addParam{ type=ULib.cmds.PlayerArg }
respawn:defaultAccess( ULib.ACCESS_ADMIN )
respawn:help( "Respawns a dead player" )

------------------------------ FExit ------------------------------

function ulx.fexit( calling_ply, target_ply )

	if IsValid( target_ply:GetVehicle() ) then
		target_ply:ExitVehicle()

		ulx.fancyLogAdmin( calling_ply, false, "#A forced #T out of a vehicle", target_ply )
	end
	if not IsValid( target_ply:GetVehicle() ) then
		ULib.tsayError( calling_ply, target_ply:Nick() .. " is not in a vehicle!" )
	end

end

local fexit = ulx.command( "Utility", "ulx fexit", ulx.fexit, "!fexit", false )
fexit:addParam{ type=ULib.cmds.PlayerArg }
fexit:defaultAccess( ULib.ACCESS_ADMIN )
fexit:help( "Force exits someone" )

------------------------------ FakeBan ------------------------------

function ulx.fakeban( calling_ply, target_ply, minutes, reason )

	local time = "for #i minute(s) "
	if minutes == 0 then time = "permanently " end
	local str = "#A banned #T " .. time
	if reason and reason ~= "" then str = str .. "(#s) " end
	ulx.fancyLogAdmin( calling_ply, str, target_ply, minutes ~= 0 and minutes or reason, reason )
end

local fakeban = ulx.command( "Fun", "ulx fakeban", ulx.fakeban, "!fakeban", true )
fakeban:addParam{ type=ULib.cmds.PlayerArg }
fakeban:addParam{ type=ULib.cmds.NumArg, hint="minutes, 0 for perma", ULib.cmds.optional, ULib.cmds.allowTimeString, min=0 }
fakeban:addParam{ type=ULib.cmds.StringArg, hint="reason", ULib.cmds.optional, ULib.cmds.takeRestOfLine, completes=ulx.common_kick_reasons }
fakeban:defaultAccess( ULib.ACCESS_ADMIN )
fakeban:help( "Fake ban command." )

------------------------------ Launch ------------------------------

function ulx.launch( calling_ply, target_plys )

	for k,v in pairs( target_plys ) do

		v:SetVelocity( Vector( 0,0,50 ) * 50 )

	ulx.fancyLogAdmin( calling_ply, "#A Launched #T", target_plys )
end
end
local launch = ulx.command( "Fun", "ulx launch", ulx.launch, "!launch", false )
launch:addParam{ type=ULib.cmds.PlayersArg }
launch:defaultAccess( ULib.ACCESS_ADMIN )
launch:help( "Launch players into the air." )

------------------------------ Super Shotty ------------------------------

function ulx.admingun(calling_ply)

	calling_ply:Give("weapon_supershotty")

	ulx.fancyLogAdmin( calling_ply, true, "#A spawned a weapon" )

end

local wsp = ulx.command( "Fun", "ulx admingun", ulx.admingun, "!admingun", true)
wsp:addParam{ type=ULib.cmds.PlayersArg }
wsp:defaultAccess( ULib.ACCESS_ADMIN )
wsp:help( "Spawns the super shotty" )
