require( "ui.T6.DualButtonPrompt" )

CoD.DeadSpectate = InheritFrom( LUI.UIElement )
CoD.DeadSpectate.SwitchPlayerBarHeight = 22
CoD.DeadSpectate.BodyStart = CoD.DeadSpectate.SwitchPlayerBarHeight
CoD.DeadSpectate.TextSize = CoD.textSize.Default
CoD.DeadSpectate.EmblemSideLength = 38
CoD.DeadSpectate.Width = 300
CoD.DeadSpectate.Height = CoD.DeadSpectate.SwitchPlayerBarHeight + CoD.DeadSpectate.EmblemSideLength
CoD.DeadSpectate.Bottom = -120
CoD.DeadSpectate.Font = CoD.fonts.ExtraSmall
CoD.DeadSpectate.TextSize = CoD.textSize.Default
LUI.createMenu.DeadSpectate = function ( controller )
	local deadSpectateHUDContainer = CoD.Menu.NewSafeAreaFromState( "DeadSpectate", controller )
	deadSpectateHUDContainer.m_ownerController = controller
	deadSpectateHUDContainer.m_selectedClientNum = nil
	
	local deadSpectateHUD = CoD.SplitscreenScaler.new( nil, 1.5 )
	deadSpectateHUD:setLeftRight( false, false, -CoD.DeadSpectate.Width / 2, CoD.DeadSpectate.Width / 2 )
	deadSpectateHUD:setTopBottom( false, true, CoD.DeadSpectate.Bottom - CoD.DeadSpectate.Height, CoD.DeadSpectate.Bottom )
	deadSpectateHUDContainer:addElement( deadSpectateHUD )
	deadSpectateHUDContainer.hud = deadSpectateHUD
	
	local holder = LUI.UIImage.new()
	holder:setLeftRight( false, false, -76, 150 )
	holder:setTopBottom( true, false, 0, 62 )
	holder:setImage( RegisterMaterial( CoD.MPZM( "hud_shoutcasting_change_tab", "hud_spectating_change_tab_zm" ) ) )
	deadSpectateHUD.switchPlayerBar = LUI.UIElement.new()
	deadSpectateHUD.switchPlayerBar:setLeftRight( true, false, 64, 237 )
	deadSpectateHUD.switchPlayerBar:setTopBottom( true, false, -3, 29 )
	local spectatingTextPadding = 9
	local spectatingText = Engine.Localize( "MPUI_SPECTATING" )
	local f1_local0 = {}
	local spectatingTextDimensions = GetTextDimensions( spectatingText, CoD.DeadSpectate.Font, CoD.DeadSpectate.TextSize )
	local spectatingTextWidth = spectatingTextDimensions[3]
	local switchPlayerDualButton = CoD.DualButtonPrompt.new( "shoulderl", spectatingText, "shoulderr", nil, nil, nil, false, nil, 0, "mouse1", "mouse2" )
	switchPlayerDualButton:setLeftRight( false, false, -spectatingTextWidth / 2 - spectatingTextPadding - 12, -spectatingTextWidth / 2 - spectatingTextPadding )
	switchPlayerDualButton:setTopBottom( false, false, -10, 10 )
	deadSpectateHUD.switchPlayerBar:addElement( switchPlayerDualButton )
	local bg = LUI.UIImage.new()
	bg:setLeftRight( false, false, -146, 146 )
	bg:setTopBottom( true, false, CoD.DeadSpectate.BodyStart - 4, 68 )
	bg:setImage( RegisterMaterial( CoD.MPZM( "hud_shoutcasting_viewing_box_dead", "hud_spectating_viewing_box_dead_zm" ) ) )
	bg:setAlpha( 1 )
	local bodyHeight = CoD.DeadSpectate.Height - CoD.DeadSpectate.BodyStart
	local nameY = CoD.DeadSpectate.BodyStart + bodyHeight / 2 - CoD.DeadSpectate.TextSize / 2
	deadSpectateHUD.playerName = LUI.UITightText.new()
	deadSpectateHUD.playerName:setLeftRight( false, false, -CoD.DeadSpectate.Width / 2, CoD.DeadSpectate.Width / 2 )
	deadSpectateHUD.playerName:setTopBottom( true, false, nameY, nameY + CoD.DeadSpectate.TextSize )
	deadSpectateHUD.playerName:setAlignment( LUI.Alignment.Center )
	local teamNameY = nameY + bodyHeight
	local spectateContainer = LUI.UIHorizontalList.new()
	spectateContainer:setLeftRight( false, false, -CoD.DeadSpectate.Width / 2, CoD.DeadSpectate.Width / 2 )
	spectateContainer:setTopBottom( true, false, teamNameY, teamNameY + CoD.DeadSpectate.TextSize * 0.75 )
	spectateContainer:setAlignment( LUI.Alignment.Center )
	if Engine.GetActiveLocalClientsCount() == 1 and 0 == Engine.GetGametypeSetting( "disableThirdPersonSpectating" ) then
		deadSpectateHUD.spectateModeButton = CoD.ButtonPrompt.new( "alt2", "", deadSpectateHUD, nil, false, nil, false, "mouse3" )
		deadSpectateHUD.spectateModeButton:setFont( CoD.DeadSpectate.Font )
		spectateContainer:addElement( deadSpectateHUD.spectateModeButton )
	end
	deadSpectateHUD:addElement( holder )
	deadSpectateHUD:addElement( bg )
	deadSpectateHUD:addElement( deadSpectateHUD.switchPlayerBar )
	deadSpectateHUD:addElement( deadSpectateHUD.playerName )
	deadSpectateHUD:addElement( spectateContainer )
	deadSpectateHUD.playerName:setText( "" )
	deadSpectateHUD:setAlpha( 1 )
	deadSpectateHUDContainer:setAlpha( 0 )
	deadSpectateHUDContainer.visible = false
	local UpdateVisibility_Internal = function ( model )
		CoD.DeadSpectate.UpdateVisibility( deadSpectateHUDContainer, {
			controller = controller
		} )
	end
	
	local Update_Internal = function ( model )
		CoD.DeadSpectate.Update( deadSpectateHUDContainer, {
			controller = controller
		} )
	end
	
	local perControllerModel = Engine.GetModelForController( controller )
	deadSpectateHUDContainer:subscribeToModel( Engine.GetModel( perControllerModel, "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_TEAM_SPECTATOR ), UpdateVisibility_Internal )
	deadSpectateHUDContainer:subscribeToModel( Engine.GetModel( perControllerModel, "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_SPECTATING_CLIENT ), UpdateVisibility_Internal )
	deadSpectateHUDContainer:subscribeToModel( Engine.GetModel( perControllerModel, "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_DRAW_SPECTATOR_MESSAGES ), UpdateVisibility_Internal )
	deadSpectateHUDContainer:subscribeToModel( Engine.GetModel( perControllerModel, "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IN_KILLCAM ), UpdateVisibility_Internal )
	deadSpectateHUDContainer:subscribeToModel( Engine.GetModel( perControllerModel, "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_FINAL_KILLCAM ), UpdateVisibility_Internal )
	deadSpectateHUDContainer:subscribeToModel( Engine.GetModel( perControllerModel, "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_UI_ACTIVE ), UpdateVisibility_Internal )
	deadSpectateHUDContainer:subscribeToModel( Engine.GetModel( perControllerModel, "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IS_THIRD_PERSON ), Update_Internal )
	deadSpectateHUDContainer:registerEventHandler( "hud_update_refresh", CoD.DeadSpectate.UpdateVisibility )
	return deadSpectateHUDContainer
end

CoD.DeadSpectate.UpdateVisibility = function ( self, event )
	local controller = event.controller
	if not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_TEAM_SPECTATOR ) and Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_SPECTATING_CLIENT ) and Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_DRAW_SPECTATOR_MESSAGES ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_IN_KILLCAM ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_FINAL_KILLCAM ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_UI_ACTIVE ) then
		if not self.visible then
			self:setAlpha( 1 )
			self.visible = true
		end
		CoD.DeadSpectate.Update( self, event )
	elseif self.visible then
		self:setAlpha( 0 )
		self.visible = nil
	end
end

CoD.DeadSpectate.Update = function ( self, event )
	local spectateInfo = Engine.GetSpectatingClientInfo( self.m_ownerController )
	if self.m_selectedClientNum ~= spectateInfo.clientNum then
		self.m_selectedClientNum = spectateInfo.clientNum
		if spectateInfo.id == nil then
			self.hud.playerName:setText( "" )
		else
			local playerName = nil
			if spectateInfo.clanTag ~= nil then
				playerName = CoD.getClanTag( spectateInfo.clanTag ) .. spectateInfo.id
			else
				playerName = spectateInfo.id
			end
			self.hud.playerName:setText( playerName )
		end
	end
	if self.hud.spectateModeButton then
		if Engine.IsVisibilityBitSet( event.controller, Enum.UIVisibilityBit.BIT_IS_THIRD_PERSON ) then
			CoD.ButtonPrompt.SetText( self.hud.spectateModeButton, Engine.Localize( "MPUI_FIRST_PERSON_VIEW" ) )
		else
			CoD.ButtonPrompt.SetText( self.hud.spectateModeButton, Engine.Localize( "MPUI_THIRD_PERSON_VIEW" ) )
		end
	end
end

