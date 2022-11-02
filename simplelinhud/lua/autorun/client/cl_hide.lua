
surface.CreateFont( "LinHud", {
	font = "BahnSchrift", --  Use the font-name which is shown to you by your operating system Font Viewer, not the file name
	extended = false,
	size = 20,
	weight = 500,
	blursize = 0,
	scanlines = 0,
	antialias = true,
	underline = false,
	italic = false,
	strikeout = false,
	symbol = false,
	rotary = false,
	shadow = false,
	additive = false,
	outline = false,
} )

local hide = {
	["CHudHealth"] = true,
	["CHudBattery"] = true,
    ["CHudAmmo"] = true,
    ["CHudSecondaryAmmo"] = true
}

hook.Add( "HUDShouldDraw", "HideHUD", function( name )
	if ( hide[ name ] ) then
		return false
	end
    
end )




hook.Add("HUDPaint", "LinHud", function()

local client = LocalPlayer()
    
	if not LocalPlayer():Alive() then

      return

	end
		

	local scrh = ScrH()
    local scrw = ScrW()
    local ply = LocalPlayer()
	local boxW = scrw * 0.09
    local boxH = scrh * 0.072
    surface.SetDrawColor(0,0,0,200)
    surface.DrawRect(scrw / 4.6 - boxW / 3, scrh - boxH * 1.91, boxW, boxH)
    surface.SetDrawColor(0,0,0,999)
    surface.DrawOutlinedRect(scrw / 4.6 - boxW / 3, scrh - boxH * 1.91, boxW, boxH, 2 )

    if (client:GetActiveWeapon():GetPrintName() != nil) then
    draw.SimpleText(client:GetActiveWeapon():GetPrintName(), "LinHud", 365, ScrH() - 145, Color(255, 255, 255, 255), 0,0)

    end

    if (client:GetActiveWeapon():Clip1() != -1) then
    draw.SimpleText("Ammo: " .. client:GetActiveWeapon():Clip1() .. "/" .. client:GetAmmoCount(client:GetActiveWeapon():GetPrimaryAmmoType()), "LinHud", 365, ScrH() - 120, Color(255, 255, 255, 255), 0, 0) 
    else
    draw.SimpleText("Ammo: " .. client:GetAmmoCount(client:GetActiveWeapon():GetPrimaryAmmoType()), "LinHud", 365, ScrH() - 120, Color( 255, 255, 255, 255), 0, 0)
    end

    if (client:GetAmmoCount(client:GetActiveWeapon():GetSecondaryAmmoType()) > 0) then
    draw.SimpleText("Secondary: " .. client:GetAmmoCount(client:GetActiveWeapon():GetSecondaryAmmoType()), "LinHud", 365, ScrH() - 100, Color( 255, 255, 255, 255), 0, 0)
    end



	local scrh = ScrH()
	local scrw = ScrW()
	local ply = LocalPlayer()
	local boxW = scrw * 0.1723
	local boxH = scrh * 0.025
	surface.SetDrawColor(0,0,0,200)
	surface.DrawRect(scrw / 23.4 - boxW / 6, scrh - boxH * 5.5, boxW, boxH, 2 )
	surface.SetDrawColor(0,0,0,999)
	surface.DrawOutlinedRect(scrw / 23.4 - boxW / 6, scrh - boxH * 5.5, boxW, boxH, 2 )
	surface.SetDrawColor(0,0,0,999)
	draw.SimpleText(LocalPlayer():Nick(),"LinHud", 15 + 15,ScrH() - 145, Color(255,255,255), TEXT_ALIGN_LEFT, TEXT_ALIGN_TOP)  


	local scrh = ScrH()
	local scrw = ScrW()
	local ply = LocalPlayer()
	local armor = ply:Armor()
	local maxarmor = ply:GetMaxArmor()
	local boxW = scrw * 0.1723
	local boxH = scrh * 0.01691455
	surface.SetDrawColor(0,0,0,200)
	surface.DrawRect(scrw / 23.4 - boxW / 6, scrh - boxH * 4.9, boxW, boxH)
	surface.SetDrawColor(0,255,232,999)
	surface.DrawRect(scrw / 23.4 - boxW / 6, scrh - boxH * 4.9, boxW * (armor / maxarmor), boxH)
	surface.SetDrawColor(0,0,0,999)
	surface.DrawOutlinedRect(scrw / 23.4 - boxW / 6, scrh - boxH * 4.9, boxW, boxH, 2 )
	
	local scrh = ScrH()
	local scrw = ScrW()
	local ply = LocalPlayer()
	local hp = ply:Health()
	local maxhp = ply:GetMaxHealth()
	local boxW = scrw * 0.1723
	local boxH = scrh * 0.01691455
	surface.SetDrawColor(0,0,0,200)
	surface.DrawRect(scrw / 23.4 - boxW / 6, scrh - boxH * 6.35, boxW, boxH)
	surface.SetDrawColor(255,0,0,999)
	surface.DrawRect(scrw / 23.4 - boxW / 6, scrh - boxH * 6.35, boxW * (hp / maxhp), boxH)
	surface.SetDrawColor(0,0,0,999)
	surface.DrawOutlinedRect(scrw / 23.4 - boxW / 6, scrh - boxH * 6.35, boxW, boxH, 2 )

end)
