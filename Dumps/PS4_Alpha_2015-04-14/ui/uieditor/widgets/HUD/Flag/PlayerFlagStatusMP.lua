require( "ui.uieditor.widgets.HUD.ScoreInfo.ScoreInfo_PanelScale" )
require( "ui.uieditor.widgets.HUD.Flag.PlayerFlag" )

CoD.PlayerFlagStatusMP = InheritFrom( LUI.UIElement )
CoD.PlayerFlagStatusMP.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.PlayerFlagStatusMP )
	self.id = "PlayerFlagStatusMP"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 320 )
	self:setTopBottom( true, false, 0, 34 )
	self.anyChildUsesUpdateState = true
	
	local Panel = CoD.ScoreInfo_PanelScale.new( menu, controller )
	Panel:setLeftRight( true, true, 0, -122 )
	Panel:setTopBottom( false, false, -13, 11 )
	Panel:setRGB( 0.64, 0.67, 0.7 )
	self:addElement( Panel )
	self.Panel = Panel
	
	local ShadowGlow = LUI.UIImage.new()
	ShadowGlow:setLeftRight( true, false, -4, 36 )
	ShadowGlow:setTopBottom( true, false, -4, 36 )
	ShadowGlow:setRGB( 0, 0, 0 )
	ShadowGlow:setAlpha( 0.2 )
	ShadowGlow:setImage( RegisterImage( "uie_t7_core_hud_mapwidget_panelglow" ) )
	ShadowGlow:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( ShadowGlow )
	self.ShadowGlow = ShadowGlow
	
	local FriendlyFlagStatus = LUI.UIText.new()
	FriendlyFlagStatus:setLeftRight( true, false, 32, 254 )
	FriendlyFlagStatus:setTopBottom( false, false, -8, 8 )
	FriendlyFlagStatus:setRGB( 1, 1, 1 )
	FriendlyFlagStatus:setText( Engine.Localize( "OBJECTIVES_FLAG_HOME_CAPS" ) )
	FriendlyFlagStatus:setTTF( "fonts/Entovo.ttf" )
	FriendlyFlagStatus:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "uie_aberration_no_blur" ) )
	FriendlyFlagStatus:setShaderVector( 0, 0, 1, 0, 0 )
	FriendlyFlagStatus:setShaderVector( 1, 0.05, 0, 0, 0 )
	FriendlyFlagStatus:setShaderVector( 2, 0, 0, 0, 0 )
	FriendlyFlagStatus:setShaderVector( 3, 0, 0, 0, 0 )
	FriendlyFlagStatus:setShaderVector( 4, 0, 0, 0, 0 )
	FriendlyFlagStatus:setLetterSpacing( 1 )
	FriendlyFlagStatus:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	FriendlyFlagStatus:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( FriendlyFlagStatus )
	self.FriendlyFlagStatus = FriendlyFlagStatus
	
	local FriendlyFlagCarrier = LUI.UIText.new()
	FriendlyFlagCarrier:setLeftRight( true, false, 32, 254 )
	FriendlyFlagCarrier:setTopBottom( false, false, -8, 8 )
	FriendlyFlagCarrier:setRGB( 1, 1, 1 )
	FriendlyFlagCarrier:setText( Engine.Localize( "" ) )
	FriendlyFlagCarrier:setTTF( "fonts/Entovo.ttf" )
	FriendlyFlagCarrier:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "uie_aberration_no_blur" ) )
	FriendlyFlagCarrier:setShaderVector( 0, 0, 1, 0, 0 )
	FriendlyFlagCarrier:setShaderVector( 1, 0.05, 0, 0, 0 )
	FriendlyFlagCarrier:setShaderVector( 2, 0, 0, 0, 0 )
	FriendlyFlagCarrier:setShaderVector( 3, 0, 0, 0, 0 )
	FriendlyFlagCarrier:setShaderVector( 4, 0, 0, 0, 0 )
	FriendlyFlagCarrier:setLetterSpacing( 1 )
	FriendlyFlagCarrier:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	FriendlyFlagCarrier:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( FriendlyFlagCarrier )
	self.FriendlyFlagCarrier = FriendlyFlagCarrier
	
	local PlayerFlag = CoD.PlayerFlag.new( menu, controller )
	PlayerFlag:setLeftRight( true, false, 4, 28 )
	PlayerFlag:setTopBottom( true, false, 4, 28 )
	PlayerFlag:setRGB( ColorSet.FriendlyBlue.r, ColorSet.FriendlyBlue.g, ColorSet.FriendlyBlue.b )
	PlayerFlag:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "uie_aberration_no_blur" ) )
	PlayerFlag:setShaderVector( 0, 0.05, 0, 0, 0 )
	PlayerFlag:setShaderVector( 1, 0.1, 0, 0, 0 )
	PlayerFlag:setShaderVector( 2, 0, 0, 0, 0 )
	PlayerFlag:setShaderVector( 3, 0, 0, 0, 0 )
	PlayerFlag:setShaderVector( 4, 0, 0, 0, 0 )
	PlayerFlag.FlagTemp:setRGB( 1, 1, 1 )
	self:addElement( PlayerFlag )
	self.PlayerFlag = PlayerFlag
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				FriendlyFlagStatus:completeAnimation()
				self.FriendlyFlagStatus:setText( Engine.Localize( "" ) )
				self.clipFinished( FriendlyFlagStatus, {} )
			end
		},
		Flag_Held = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				FriendlyFlagStatus:completeAnimation()
				self.FriendlyFlagStatus:setText( Engine.Localize( "" ) )
				self.clipFinished( FriendlyFlagStatus, {} )
				FriendlyFlagCarrier:completeAnimation()
				self.FriendlyFlagCarrier:setAlpha( 1 )
				self.clipFinished( FriendlyFlagCarrier, {} )
			end
		},
		Flag_Away = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				FriendlyFlagStatus:completeAnimation()
				self.FriendlyFlagStatus:setText( Engine.Localize( "OBJECTIVES_FLAG_AWAY_CAPS" ) )
				self.clipFinished( FriendlyFlagStatus, {} )
				FriendlyFlagCarrier:completeAnimation()
				self.FriendlyFlagCarrier:setAlpha( 0 )
				self.clipFinished( FriendlyFlagCarrier, {} )
			end
		},
		Flag_At_Base = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				FriendlyFlagStatus:completeAnimation()
				self.FriendlyFlagStatus:setText( Engine.Localize( "OBJECTIVES_FLAG_HOME_CAPS" ) )
				self.clipFinished( FriendlyFlagStatus, {} )
				FriendlyFlagCarrier:completeAnimation()
				self.FriendlyFlagCarrier:setAlpha( 0 )
				self.clipFinished( FriendlyFlagCarrier, {} )
			end
		}
	}
	self.close = function ( self )
		self.Panel:close()
		self.PlayerFlag:close()
		CoD.PlayerFlagStatusMP.super.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

