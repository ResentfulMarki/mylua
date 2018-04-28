util.AddNetworkString("Nomad")

net.Receive("Nomad",function(len, ply)

  ply:Give( "weapon_nomad" )

end)

util.AddNetworkString("Strip")

net.Receive("Strip",function(len, ply)

  ply:StripWeapons()


end)

util.AddNetworkString("namecheck")

net.Receive("namecheck",function(len, ply, value)

  PrintMessage(HUD_PRINTTALK, "lol u gay")

end)
