-- b510f71e813ef2924a6a248c6c688662
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.Demo.DemoPlaybackControlsButtons" )

CoD.DemoPlaybackControlsButtonBar = InheritFrom( LUI.UIElement )
CoD.DemoPlaybackControlsButtonBar.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.DemoPlaybackControlsButtonBar )
	self.id = "DemoPlaybackControlsButtonBar"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 1280 )
	self:setTopBottom( true, false, 0, 32 )
	self.anyChildUsesUpdateState = true
	
	local black = LUI.UIImage.new()
	black:setLeftRight( true, true, 0, 0 )
	black:setTopBottom( false, true, -32, 80 )
	black:setRGB( 0, 0, 0 )
	black:setAlpha( 0.7 )
	self:addElement( black )
	self.black = black
	
	local DemoPlaybackControlsButtons = CoD.DemoPlaybackControlsButtons.new( menu, controller )
	DemoPlaybackControlsButtons:setLeftRight( true, true, 47, -144 )
	DemoPlaybackControlsButtons:setTopBottom( false, true, -32, 0 )
	self:addElement( DemoPlaybackControlsButtons )
	self.DemoPlaybackControlsButtons = DemoPlaybackControlsButtons
	
	DemoPlaybackControlsButtons:setModel( menu.buttonModel, controller )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.DemoPlaybackControlsButtons:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

