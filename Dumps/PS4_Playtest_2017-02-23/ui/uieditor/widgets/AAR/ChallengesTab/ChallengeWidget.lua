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
	self:setLeftRight( 0, 0, 0, 543 )
	self:setTopBottom( 0, 0, 0, 667 )
	
	local Border = CoD.Border.new( menu, controller )
	Border:setLeftRight( 0, 0, 4, 544 )
	Border:setTopBottom( 0, 0, 0, 668 )
	self:addElement( Border )
	self.Border = Border
	
	local Bg = LUI.UIImage.new()
	Bg:setLeftRight( 0, 0, 1, 544 )
	Bg:setTopBottom( 0, 0, 0, 668 )
	Bg:setAlpha( 0.3 )
	self:addElement( Bg )
	self.Bg = Bg
	
	local RewardsTextBg = LUI.UIImage.new()
	RewardsTextBg:setLeftRight( 0, 0, 8, 217 )
	RewardsTextBg:setTopBottom( 0, 0, 596, 668 )
	RewardsTextBg:setRGB( 0, 0, 0 )
	RewardsTextBg:setAlpha( 0.3 )
	self:addElement( RewardsTextBg )
	self.RewardsTextBg = RewardsTextBg
	
	local RewardsText = LUI.UIText.new()
	RewardsText:setLeftRight( 0, 0, 4, 217 )
	RewardsText:setTopBottom( 0, 0, 613, 651 )
	RewardsText:setText( Engine.Localize( "MPUI_REWARD_CAPS" ) )
	RewardsText:setTTF( "fonts/default.ttf" )
	RewardsText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	RewardsText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( RewardsText )
	self.RewardsText = RewardsText
	
	local XpIcon = LUI.UIImage.new()
	XpIcon:setLeftRight( 0, 0, 222, 292 )
	XpIcon:setTopBottom( 0, 0, 597, 667 )
	XpIcon:setImage( RegisterImage( "uie_t7_hud_mp_notifications_xp" ) )
	self:addElement( XpIcon )
	self.XpIcon = XpIcon
	
	local XpValue = LUI.UITightText.new()
	XpValue:setLeftRight( 0, 0, 309, 381 )
	XpValue:setTopBottom( 0, 0, 613, 651 )
	XpValue:setText( Engine.Localize( "2500" ) )
	XpValue:setTTF( "fonts/default.ttf" )
	self:addElement( XpValue )
	self.XpValue = XpValue
	
	local ChallengeImage = LUI.UIImage.new()
	ChallengeImage:setLeftRight( 0, 0, 176, 368 )
	ChallengeImage:setTopBottom( 0, 0, 91, 283 )
	self:addElement( ChallengeImage )
	self.ChallengeImage = ChallengeImage
	
	local ChallengeCount = LUI.UIText.new()
	ChallengeCount:setLeftRight( 0, 0, 0, 544 )
	ChallengeCount:setTopBottom( 0, 0, 333, 371 )
	ChallengeCount:setText( Engine.Localize( "2 of 10" ) )
	ChallengeCount:setTTF( "fonts/default.ttf" )
	ChallengeCount:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	ChallengeCount:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( ChallengeCount )
	self.ChallengeCount = ChallengeCount
	
	local ChallengeName = LUI.UIText.new()
	ChallengeName:setLeftRight( 0, 0, 0, 544 )
	ChallengeName:setTopBottom( 0, 0, 404, 442 )
	ChallengeName:setText( Engine.Localize( "Its a trap" ) )
	ChallengeName:setTTF( "fonts/default.ttf" )
	ChallengeName:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	ChallengeName:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( ChallengeName )
	self.ChallengeName = ChallengeName
	
	local ChallengeDescription = LUI.UIText.new()
	ChallengeDescription:setLeftRight( 0, 0, 0, 544 )
	ChallengeDescription:setTopBottom( 0, 0, 476, 514 )
	ChallengeDescription:setText( Engine.Localize( "Play 10 games of any gametype as a Trapper." ) )
	ChallengeDescription:setTTF( "fonts/default.ttf" )
	ChallengeDescription:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	ChallengeDescription:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( ChallengeDescription )
	self.ChallengeDescription = ChallengeDescription
	
	local Image0 = LUI.UIImage.new()
	Image0:setLeftRight( 0, 0, 4, 543 )
	Image0:setTopBottom( 0, 0, 582, 585 )
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

