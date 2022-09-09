-- 25b0fc02b34ef761d08466482ed54879
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.CPLevels.CPHoldToSkipSceneButton" )

CoD.CPHoldToSkipSceneText = InheritFrom( LUI.UIElement )
CoD.CPHoldToSkipSceneText.new = function ( menu, controller )
	local self = LUI.UIHorizontalList.new( {
		left = 0,
		top = 0,
		right = 0,
		bottom = 0,
		leftAnchor = true,
		topAnchor = true,
		rightAnchor = true,
		bottomAnchor = true,
		spacing = 0
	} )
	self:setAlignment( LUI.Alignment.Right )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.CPHoldToSkipSceneText )
	self.id = "CPHoldToSkipSceneText"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 187 )
	self:setTopBottom( true, false, 0, 25 )
	self.anyChildUsesUpdateState = true
	
	local ToSkip = LUI.UITightText.new()
	ToSkip:setLeftRight( true, true, 140, 0 )
	ToSkip:setTopBottom( true, true, 0, 0 )
	ToSkip:setText( Engine.Localize( "MENU_SCENE_SKIP_POSTPROMPT" ) )
	ToSkip:setTTF( "fonts/default.ttf" )
	self:addElement( ToSkip )
	self.ToSkip = ToSkip
	
	local CPHoldToSkipSceneButton = CoD.CPHoldToSkipSceneButton.new( menu, controller )
	CPHoldToSkipSceneButton:setLeftRight( true, false, 110, 140 )
	CPHoldToSkipSceneButton:setTopBottom( true, false, 3, 23 )
	self:addElement( CPHoldToSkipSceneButton )
	self.CPHoldToSkipSceneButton = CPHoldToSkipSceneButton
	
	local Hold = LUI.UITightText.new()
	Hold:setLeftRight( true, true, 81, -77 )
	Hold:setTopBottom( true, true, 0, 0 )
	Hold:setText( Engine.Localize( "MENU_SCENE_SKIP_PREPROMPT" ) )
	Hold:setTTF( "fonts/default.ttf" )
	self:addElement( Hold )
	self.Hold = Hold
	
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.CPHoldToSkipSceneButton:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
