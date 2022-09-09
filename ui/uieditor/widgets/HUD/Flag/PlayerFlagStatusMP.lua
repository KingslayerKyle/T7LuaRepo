-- bd264c9cdbda7be29d17ab32b9e961f8
-- This hash is used for caching, delete to decompile the file again

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
	Panel:setLeftRight( true, true, 0, -72 )
	Panel:setTopBottom( false, false, -13, 11 )
	Panel:setRGB( 0.64, 0.67, 0.7 )
	self:addElement( Panel )
	self.Panel = Panel
	
	local ShadowGlow = LUI.UIImage.new()
	ShadowGlow:setLeftRight( true, false, -4, 79 )
	ShadowGlow:setTopBottom( true, false, -4, 36 )
	ShadowGlow:setRGB( 0, 0, 0 )
	ShadowGlow:setAlpha( 0 )
	ShadowGlow:setImage( RegisterImage( "uie_t7_core_hud_mapwidget_panelglow" ) )
	self:addElement( ShadowGlow )
	self.ShadowGlow = ShadowGlow
	
	local FriendlyFlagStatus = LUI.UITightText.new()
	FriendlyFlagStatus:setLeftRight( true, false, 32, 243 )
	FriendlyFlagStatus:setTopBottom( false, false, -9, 7 )
	FriendlyFlagStatus:setText( Engine.Localize( "OBJECTIVES_FLAG_HOME_CAPS" ) )
	FriendlyFlagStatus:setTTF( "fonts/escom.ttf" )
	FriendlyFlagStatus:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "uie_aberration_no_blur" ) )
	FriendlyFlagStatus:setShaderVector( 0, 0, 1, 0, 0 )
	FriendlyFlagStatus:setShaderVector( 1, 0.05, 0, 0, 0 )
	FriendlyFlagStatus:setShaderVector( 2, 0, 0, 0, 0 )
	FriendlyFlagStatus:setShaderVector( 3, 0, 0, 0, 0 )
	FriendlyFlagStatus:setShaderVector( 4, 0, 0, 0, 0 )
	FriendlyFlagStatus:setLetterSpacing( 1 )
	self:addElement( FriendlyFlagStatus )
	self.FriendlyFlagStatus = FriendlyFlagStatus
	
	local FriendlyFlagCarrier = LUI.UITightText.new()
	FriendlyFlagCarrier:setLeftRight( true, false, 32, 243 )
	FriendlyFlagCarrier:setTopBottom( false, false, -9, 7 )
	FriendlyFlagCarrier:setText( Engine.Localize( "WWWWWWWWWWWWWWWWW" ) )
	FriendlyFlagCarrier:setTTF( "fonts/escom.ttf" )
	FriendlyFlagCarrier:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "uie_aberration_no_blur" ) )
	FriendlyFlagCarrier:setShaderVector( 0, 0, 1, 0, 0 )
	FriendlyFlagCarrier:setShaderVector( 1, 0.05, 0, 0, 0 )
	FriendlyFlagCarrier:setShaderVector( 2, 0, 0, 0, 0 )
	FriendlyFlagCarrier:setShaderVector( 3, 0, 0, 0, 0 )
	FriendlyFlagCarrier:setShaderVector( 4, 0, 0, 0, 0 )
	FriendlyFlagCarrier:setLetterSpacing( 1 )
	self:addElement( FriendlyFlagCarrier )
	self.FriendlyFlagCarrier = FriendlyFlagCarrier
	
	local PlayerFlag = CoD.PlayerFlag.new( menu, controller )
	PlayerFlag:setLeftRight( true, false, 3.31, 27.13 )
	PlayerFlag:setTopBottom( true, false, 7, 25.14 )
	PlayerFlag:setRGB( ColorSet.FriendlyBlue.r, ColorSet.FriendlyBlue.g, ColorSet.FriendlyBlue.b )
	PlayerFlag.FlagTemp:setImage( RegisterImage( "uie_t7_hud_waypoints_flag_square" ) )
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

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.Panel:close()
		element.PlayerFlag:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
