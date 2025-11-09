CoD.AITank = {}
LUI.createMenu.ai_tank_drone_mp = function ( controller )
	local self = CoD.AirVehicleHUD.new( "ai_tank_drone_mp", controller )
	local bracketMaterial = RegisterMaterial( "mp_hud_scorestreak_bracket" )
	local arrowMaterial = RegisterMaterial( "hud_rts_mech_arrow" )
	local bracketWidth = 64
	local bracketHeight = 512
	local bracketOffset = 400
	local arrowWidth = 128
	local arrowHeight = 32
	local arrowOffset = 390
	local arrowHeightOffset = 4
	local leftBracket = LUI.UIImage.new()
	leftBracket:setLeftRight( false, false, -bracketOffset, -bracketOffset + bracketWidth )
	leftBracket:setTopBottom( false, false, -bracketHeight / 2, bracketHeight / 2 )
	leftBracket:setImage( bracketMaterial )
	leftBracket:setRGB( self.colorR, self.colorG, self.colorB )
	self:addElement( leftBracket )
	local rightBracket = LUI.UIImage.new()
	rightBracket:setLeftRight( false, false, bracketOffset, bracketOffset - bracketWidth )
	rightBracket:setTopBottom( false, false, -bracketHeight / 2, bracketHeight / 2 )
	rightBracket:setImage( bracketMaterial )
	rightBracket:setRGB( self.colorR, self.colorG, self.colorB )
	self:addElement( rightBracket )
	local leftArrow = LUI.UIImage.new()
	leftArrow:setLeftRight( false, false, -arrowOffset, -arrowOffset + arrowWidth )
	leftArrow:setTopBottom( false, false, -arrowHeight / 2 - arrowHeightOffset, arrowHeight / 2 - arrowHeightOffset )
	leftArrow:setImage( arrowMaterial )
	self:addElement( leftArrow )
	local rightArrow = LUI.UIImage.new()
	rightArrow:setLeftRight( false, false, arrowOffset, arrowOffset - arrowWidth )
	rightArrow:setTopBottom( false, false, -arrowHeight / 2 - arrowHeightOffset, arrowHeight / 2 - arrowHeightOffset )
	rightArrow:setImage( arrowMaterial )
	self:addElement( rightArrow )
	self:addCompass()
	if not CoD.isWIIU then
		local crosshair = LUI.UIImage.new()
		crosshair:setLeftRight( false, false, -64, 64 )
		crosshair:setTopBottom( false, false, -32, 32 )
		crosshair:setImage( RegisterMaterial( "mp_hud_agr_reticle" ) )
		self:addElement( crosshair )
	end
	if CoD.IS_KILLCAM_OR_SPECTATE( controller ) == 0 and not Engine.IsDemoPlaying() then
		local exitPrompt = LUI.UIText.new()
		exitPrompt:setLeftRight( true, false, 0, 0 )
		exitPrompt:setTopBottom( false, true, -30 - CoD.textSize.Default, -30 )
		exitPrompt:setText( Engine.Localize( "MP_REMOTE_EXIT" ) )
		exitPrompt:setFont( CoD.fonts.Default )
		exitPrompt:setRGB( self.colorR, self.colorG, self.colorB )
		self.leftButtonPrompts:addElement( exitPrompt )
		local missilePrompt = LUI.UIText.new()
		missilePrompt:setLeftRight( true, false, 0, 0 )
		missilePrompt:setTopBottom( false, true, -CoD.textSize.Default, 0 )
		missilePrompt:setText( Engine.Localize( "KILLSTREAK_AI_TANK_ROCKETS" ) )
		missilePrompt:setFont( CoD.fonts.Default )
		missilePrompt:setRGB( self.colorR, self.colorG, self.colorB )
		self.leftButtonPrompts:addElement( missilePrompt )
		local gunPrompt = LUI.UIText.new()
		gunPrompt:setLeftRight( false, true, -1000, 0 )
		gunPrompt:setTopBottom( false, true, -CoD.textSize.Default, 0 )
		gunPrompt:setText( Engine.Localize( "KILLSTREAK_AI_TANK_GUNS" ) )
		gunPrompt:setFont( CoD.fonts.Default )
		gunPrompt:setAlignment( LUI.Alignment.Right )
		gunPrompt:setRGB( self.colorR, self.colorG, self.colorB )
		self.rightButtonPrompts:addElement( gunPrompt )
	end
	return self
end

