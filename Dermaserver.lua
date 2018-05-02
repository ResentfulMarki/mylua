local tb = {
    ["superadmin"] = true,
    ["senioradmin"] = true
}
util.AddNetworkString("aag")
hook.Add("PlayerSay", "opm", function(ply, text, sender)
    if text != "/opm" then return end
    if text == "/opm" && ply:IsValid() && tb[ply:GetUserGroup()] then
        net.Start("aag")
        net.Send(ply)
        return ""
    else
        util.AddNetworkString("nnx")
        net.Start("nnx")
        net.Send(ply)
        return ""
    end
end)




util.AddNetworkString("railgun")

net.Receive("railgun",function(len, ply)

  ply:Give( "weapon_railgun" )

end)

util.AddNetworkString("Strip")

net.Receive("Strip",function(len, ply)

  ply:StripWeapons()


end)

util.AddNetworkString("namecheck")

net.Receive("namecheck",function(len, ply)
    local tong = net.ReadEntity()
    if (!tong:IsValid()) then return end
    tong:Kill()

end)
