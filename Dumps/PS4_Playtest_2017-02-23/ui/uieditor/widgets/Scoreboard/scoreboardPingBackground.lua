require( "ui.uieditor.widgets.EndGameFlow.Top3PlayerScoreBlurBox" )
require( "ui.uieditor.widgets.Lobby.Common.FE_ButtonPanel" )

CoD.scoreboardPingBackground = InheritFrom( LUI.UIElement )
CoD.scoreboardPingBackground.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.scoreboardPingBackground )
	self.id = "scoreboardPingBackground"
	self.soundSet = "default"
	self:setLeftRight( 0, 0, 0, 54 )
	self:setTopBottom( 0, 0, 0, 37 )
	self:makeFocusable()
	self:setHandleMouse( true )
	
	local Top3PlayerScoreBlurBox00 = CoD.Top3PlayerScoreBlurBox.new( menu, controller )
	Top3PlayerScoreBlurBox00:setLeftRight( 0, 1, 0, 0 )
	Top3PlayerScoreBlurBox00:setTopBottom( 0, 1, 0, 0 )
	Top3PlayerScoreBlurBox00:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "uie_scene_blur_pass_2_highquality" ) )
	Top3PlayerScoreBlurBox00:setShaderVector( 0, 10, 10, 0, 0 )
	self:addElement( Top3PlayerScoreBlurBox00 )
	self.Top3PlayerScoreBlurBox00 = Top3PlayerScoreBlurBox00
	
	local VSpanel0 = CoD.FE_ButtonPanel.new( menu, controller )
	VSpanel0:setLeftRight( 0, 1, 0, 0 )
	VSpanel0:setTopBottom( 0, 1, 0, 0 )
	VSpanel0:setRGB( 0, 0, 0 )
	VSpanel0:setAlpha( 0.45 )
	self:addElement( VSpanel0 )
	self.VSpanel0 = VSpanel0
	
	local PingBars = LUI.UIImage.new()
	PingBars:setLeftRight( 1, 1, -44, -11 )
	PingBars:setTopBottom( 0.5, 0.5, -16.5, 16.5 )
	PingBars:linkToElementModel( self, "ping", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			PingBars:setImage( RegisterImage( GetScoreboardPlayerPingBarImage( modelValue ) ) )
		end
	end )
	self:addElement( PingBars )
	self.PingBars = PingBars
	
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.Top3PlayerScoreBlurBox00:close()
		self.VSpanel0:close()
		self.PingBars:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

