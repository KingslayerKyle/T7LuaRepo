require( "ui.uieditor.widgets.Border" )

CoD.ChallengeWidget = InheritFrom( LUI.UIElement )
CoD.ChallengeWidget.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.ChallengeWidget )
	self.id = "ChallengeWidget"
	self.soundSet = "HUD"
	self:setLeftRight( true, false, 0, 362 )
	self:setTopBottom( true, false, 0, 445 )
	
	local Border = CoD.Border.new( menu, controller )
	Border:setLeftRight( true, false, 2.36, 362.36 )
	Border:setTopBottom( true, false, 0, 445 )
	self:addElement( Border )
	self.Border = Border
	
	local Bg = LUI.UIImage.new()
	Bg:setLeftRight( true, false, 0.36, 362.36 )
	Bg:setTopBottom( true, false, 0, 445 )
	Bg:setAlpha( 0.3 )
	self:addElement( Bg )
	self.Bg = Bg
	
	local RewardsTextBg = LUI.UIImage.new()
	RewardsTextBg:setLeftRight( true, false, 5, 144.36 )
	RewardsTextBg:setTopBottom( true, false, 397, 445 )
	RewardsTextBg:setRGB( 0, 0, 0 )
	RewardsTextBg:setAlpha( 0.3 )
	self:addElement( RewardsTextBg )
	self.RewardsTextBg = RewardsTextBg
	
	local RewardsText = LUI.UIText.new()
	RewardsText:setLeftRight( true, false, 2.36, 144.36 )
	RewardsText:setTopBottom( true, false, 408.5, 433.5 )
	RewardsText:setText( Engine.Localize( "MPUI_REWARD_CAPS" ) )
	RewardsText:setTTF( "fonts/default.ttf" )
	RewardsText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	RewardsText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( RewardsText )
	self.RewardsText = RewardsText
	
	local XpIcon = LUI.UIImage.new()
	XpIcon:setLeftRight( true, false, 147.72, 194.72 )
	XpIcon:setTopBottom( true, false, 398, 445 )
	XpIcon:setImage( RegisterImage( "uie_t7_hud_mp_notifications_xp" ) )
	self:addElement( XpIcon )
	self.XpIcon = XpIcon
	
	local XpValue = LUI.UITightText.new()
	XpValue:setLeftRight( true, false, 205.84, 253.84 )
	XpValue:setTopBottom( true, false, 409, 434 )
	XpValue:setText( Engine.Localize( "2500" ) )
	XpValue:setTTF( "fonts/default.ttf" )
	self:addElement( XpValue )
	self.XpValue = XpValue
	
	local ChallengeImage = LUI.UIImage.new()
	ChallengeImage:setLeftRight( true, false, 117.36, 245.36 )
	ChallengeImage:setTopBottom( true, false, 60.98, 188.98 )
	self:addElement( ChallengeImage )
	self.ChallengeImage = ChallengeImage
	
	local ChallengeCount = LUI.UIText.new()
	ChallengeCount:setLeftRight( true, false, 0, 362.36 )
	ChallengeCount:setTopBottom( true, false, 222.5, 247.5 )
	ChallengeCount:setText( Engine.Localize( "2 of 10" ) )
	ChallengeCount:setTTF( "fonts/default.ttf" )
	ChallengeCount:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	ChallengeCount:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( ChallengeCount )
	self.ChallengeCount = ChallengeCount
	
	local ChallengeName = LUI.UIText.new()
	ChallengeName:setLeftRight( true, false, 0, 362.36 )
	ChallengeName:setTopBottom( true, false, 269.5, 294.5 )
	ChallengeName:setText( Engine.Localize( "Its a trap" ) )
	ChallengeName:setTTF( "fonts/default.ttf" )
	ChallengeName:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	ChallengeName:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( ChallengeName )
	self.ChallengeName = ChallengeName
	
	local ChallengeDescription = LUI.UIText.new()
	ChallengeDescription:setLeftRight( true, false, 0, 362.36 )
	ChallengeDescription:setTopBottom( true, false, 317.5, 342.5 )
	ChallengeDescription:setText( Engine.Localize( "Play 10 games of any gametype as a Trapper." ) )
	ChallengeDescription:setTTF( "fonts/default.ttf" )
	ChallengeDescription:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	ChallengeDescription:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( ChallengeDescription )
	self.ChallengeDescription = ChallengeDescription
	
	local Image0 = LUI.UIImage.new()
	Image0:setLeftRight( true, false, 2.36, 362 )
	Image0:setTopBottom( true, false, 388, 390 )
	self:addElement( Image0 )
	self.Image0 = Image0
	
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.Border:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

