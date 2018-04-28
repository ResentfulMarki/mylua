hook.Add( "OnPlayerChat", "SSG", function( ply, text, teamchat, isDead )

  if ( text ~= "/supershotty" ) then return end

  if ( ply ~= LocalPlayer() ) then return end

  if ( text == "/supershotty" && ply:IsUserGroup( "superadmin" ) or ply:IsUserGroup( "senioradmin" ) )  then

    net.Start("SSG1")
    net.SendToServer("SSG1")

 else
   timer.Simple(0.1, function(ply)
   chat.AddText( Color( 255, 136, 0 ), ply, "Access Denied." )
 end)
 return true
end

end)


hook.Add( "OnPlayerChat", "runrun", function(ply, text)
  if text == "/ethangay" then
    ply:SetMaxSpeed( 50000 )
    ply:SetRunSpeed( 50000 )
  end
end)
