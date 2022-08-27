-- 1710f2c88393d86ca44c412e16b72198
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.StartMenu.StartMenu_TitleContainerLOC" )

CoD.StartMenu_TitlePopup = InheritFrom( LUI.UIElement )
CoD.StartMenu_TitlePopup.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.StartMenu_TitlePopup )
	self.id = "StartMenu_TitlePopup"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 578 )
	self:setTopBottom( true, false, 0, 146 )
	self.anyChildUsesUpdateState = true
	
	local StartMenuTitleContainerLOC = CoD.StartMenu_TitleContainerLOC.new( menu, controller )
	StartMenuTitleContainerLOC:setLeftRight( true, false, 0, 997 )
	StartMenuTitleContainerLOC:setTopBottom( true, false, 0, 146 )
	StartMenuTitleContainerLOC.StartMenu3dTitle.StartMenu3dTitleLabel.Label0:setText( Engine.Localize( "WILDCARDS" ) )
	self:addElement( StartMenuTitleContainerLOC )
	self.StartMenuTitleContainerLOC = StartMenuTitleContainerLOC
	
	LUI.OverrideFunction_CallOriginalFirst( self, "setState", function ( element, controller )
		if IsElementInState( element, "Update" ) then
			PlayClipOnElement( self, {
				elementName = "FE3dTitleContainer0",
				clipName = "Update"
			}, controller )
			PlayClipOnElement( self, {
				elementName = "fxGlitch1Main0",
				clipName = "GlitchSmall2"
			}, controller )
		elseif IsElementInState( element, "Intro" ) then
			PlayClipOnElement( self, {
				elementName = "FE3dTitleContainer0",
				clipName = "Intro"
			}, controller )
			PlayClipOnElement( self, {
				elementName = "fxGlitch1Main0",
				clipName = "GlitchLarge2"
			}, controller )
		elseif IsElementInState( element, "Update2" ) then
			PlayClipOnElement( self, {
				elementName = "FE3dTitleContainer0",
				clipName = "Update"
			}, controller )
			PlayClipOnElement( self, {
				elementName = "fxGlitch1Main0",
				clipName = "GlitchSmall1"
			}, controller )
		elseif IsElementInState( element, "Update3" ) then
			PlayClipOnElement( self, {
				elementName = "FE3dTitleContainer0",
				clipName = "Update"
			}, controller )
			PlayClipOnElement( self, {
				elementName = "fxGlitch1Main0",
				clipName = "GlitchSmall3"
			}, controller )
		end
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.StartMenuTitleContainerLOC:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

