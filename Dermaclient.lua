net.Receive( "aag", function()

    local frame = vgui.Create( "DFrame" )
    frame:SetSize(500,360)
    frame:Center()
    frame:SetTitle("Higher Up Menu")
    frame:SetVisible(true)
    frame:MakePopup()
    frame.Paint = function(s , w , h)
        draw.RoundedBox(5,0,0,w , h, Color(16,117,188))
    end

    function buttonPressed(ply)
        net.Start("railgun")
        net.SendToServer()
    end

    local nomadButton = vgui.Create("DButton" , frame)
    nomadButton:SetPos(10,30)
    nomadButton:SetSize(90,30)
    nomadButton:SetText("Coin")
    nomadButton.DoClick = buttonPressed

    function buttonPressed1(ply)
        net.Start("Strip")
        net.SendToServer()
    end

    local stripbutton = vgui.Create("DButton" , frame)
    stripbutton:SetPos(10,65)
    stripbutton:SetSize(90,30)
    stripbutton:SetText("Strip All Weapons")
    stripbutton.DoClick = buttonPressed1

    local cbox = vgui.Create("DComboBox", frame)
    cbox:SetPos(105,30)
    cbox:SetSize(100,20)
    cbox:SetValue("players")

    for k, v in pairs( player.GetAll() ) do
        cbox:AddChoice( v:Name() )
    end

    function buttonPressed2(ply)
        local value = cbox:GetSelected()
        for k, v in pairs( player.GetAll() ) do
            if v:Name() == value then
                net.Start("namecheck")
                net.WriteEntity(v)
                net.SendToServer()
            end
        end
    end

    local exebutton = vgui.Create("DButton", frame)
    exebutton:SetPos(105,55)
    exebutton:SetSize(100,20)
    exebutton:SetText("Execute")
    exebutton.DoClick = buttonPressed2

end)

net.Receive("nnx", function(ply)
    timer.Simple( 0.0001, function()
    chat.AddText( Color(255,153,0), "Access Denied." )
end)
end)
