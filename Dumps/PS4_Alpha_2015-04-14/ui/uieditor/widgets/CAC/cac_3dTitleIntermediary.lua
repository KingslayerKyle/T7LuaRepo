require( "ui.uieditor.widgets.CAC.cac_3dTitleContainerNoLoc" )
require( "ui.uieditor.widgets.Effects.fxGlitch1_Main" )

CoD.cac_3dTitleIntermediary = InheritFrom( LUI.UIElement )
CoD.cac_3dTitleIntermediary.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.cac_3dTitleIntermediary )
	self.id = "cac_3dTitleIntermediary"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 578 )
	self:setTopBottom( true, false, 0, 146 )
	self.anyChildUsesUpdateState = true
	
	local FE3dTitleContainer0 = CoD.cac_3dTitleContainerNoLoc.new( menu, controller )
	FE3dTitleContainer0:setLeftRight( true, false, 0, 531 )
	FE3dTitleContainer0:setTopBottom( true, false, 0, 146 )
	FE3dTitleContainer0:setRGB( 1, 1, 1 )
	FE3dTitleContainer0.circles:setRGB( 0, 0, 0 )
	FE3dTitleContainer0.diaglrg:setRGB( 0, 0, 0 )
	FE3dTitleContainer0.diagsm:setRGB( 0, 0, 0 )
	FE3dTitleContainer0.centersquare:setRGB( 0, 0, 0 )
	FE3dTitleContainer0.MenuTitle.TextBox1.Label0:setText( Engine.Localize( "MULTIPLAYER" ) )
	self:addElement( FE3dTitleContainer0 )
	self.FE3dTitleContainer0 = FE3dTitleContainer0
	
	local fxGlitch1Main0 = CoD.fxGlitch1_Main.new( menu, controller )
	fxGlitch1Main0:setLeftRight( true, false, 90, 562 )
	fxGlitch1Main0:setTopBottom( true, false, -44.18, 157.51 )
	fxGlitch1Main0:setRGB( 1, 1, 1 )
	self:addElement( fxGlitch1Main0 )
	self.fxGlitch1Main0 = fxGlitch1Main0
	
	LUI.OverrideFunction_CallOriginalFirst( self, "setState", function ( element, state )
		if IsElementInState( element, "Update" ) then
			PlayClipOnElement( self, {
				elementName = "FE3dTitleContainer0",
				clipName = "Update"
			}, controller )
		elseif IsElementInState( element, "Intro" ) then
			PlayClipOnElement( self, {
				elementName = "FE3dTitleContainer0",
				clipName = "Intro"
			}, controller )
		elseif IsElementInState( element, "Update2" ) then
			PlayClipOnElement( self, {
				elementName = "FE3dTitleContainer0",
				clipName = "Update"
			}, controller )
		elseif IsElementInState( element, "Update3" ) then
			PlayClipOnElement( self, {
				elementName = "FE3dTitleContainer0",
				clipName = "Update"
			}, controller )
		end
	end )
	self.close = function ( self )
		self.FE3dTitleContainer0:close()
		self.fxGlitch1Main0:close()
		CoD.cac_3dTitleIntermediary.super.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

