util.AddNetworkString("SSG1")
net.Receive("SSG1",function(len, ply)
  ply:Give("weapon_supershotty")
end)
