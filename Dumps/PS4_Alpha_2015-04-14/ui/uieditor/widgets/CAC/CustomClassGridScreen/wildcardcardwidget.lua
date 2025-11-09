require( "ui.uieditor.widgets.CAC.CustomClassGridScreen.Wildcard.WildcardCard_Internal" )

CoD.WildcardCardWidget = InheritFrom( LUI.UIElement )
CoD.WildcardCardWidget.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.WildcardCardWidget )
	self.id = "WildcardCardWidget"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 960 )
	self:setTopBottom( true, false, 0, 93 )
	self:makeFocusable()
	self:setHandleMouse( true )
	self.anyChildUsesUpdateState = true
	
	local label = LUI.UITightText.new()
	label:setLeftRight( true, false, 2, 114 )
	label:setTopBottom( true, false, 0, 25 )
	label:setRGB( 0.4, 0.44, 0.52 )
	label:setText( Engine.Localize( "MENU_WILDCARDS_CAPS" ) )
	label:setTTF( "fonts/default.ttf" )
	self:addElement( label )
	self.label = label
	
	local wildcardCard1 = CoD.WildcardCard_Internal.new( menu, controller )
	wildcardCard1:setLeftRight( true, false, 0, 314 )
	wildcardCard1:setTopBottom( true, false, 25, 93 )
	wildcardCard1:setRGB( 1, 1, 1 )
	self:addElement( wildcardCard1 )
	self.wildcardCard1 = wildcardCard1
	
	local wildcardCard2 = CoD.WildcardCard_Internal.new( menu, controller )
	wildcardCard2:setLeftRight( true, false, 323, 637 )
	wildcardCard2:setTopBottom( true, false, 25, 93 )
	wildcardCard2:setRGB( 1, 1, 1 )
	self:addElement( wildcardCard2 )
	self.wildcardCard2 = wildcardCard2
	
	local wildcardCard3 = CoD.WildcardCard_Internal.new( menu, controller )
	wildcardCard3:setLeftRight( true, false, 646, 960 )
	wildcardCard3:setTopBottom( true, false, 25, 93 )
	wildcardCard3:setRGB( 1, 1, 1 )
	self:addElement( wildcardCard3 )
	self.wildcardCard3 = wildcardCard3
	
	wildcardCard1.navigation = {
		right = wildcardCard2
	}
	wildcardCard2.navigation = {
		left = wildcardCard1,
		right = wildcardCard3
	}
	wildcardCard3.navigation = {
		left = wildcardCard2
	}
	wildcardCard1.id = "wildcardCard1"
	wildcardCard2.id = "wildcardCard2"
	wildcardCard3.id = "wildcardCard3"
	self:registerEventHandler( "gain_focus", function ( self, event )
		if self.m_focusable and self.wildcardCard1:processEvent( event ) then
			return true
		else
			return LUI.UIElement.gainFocus( self, event )
		end
	end )
	self.close = function ( self )
		self.wildcardCard1:close()
		self.wildcardCard2:close()
		self.wildcardCard3:close()
		CoD.WildcardCardWidget.super.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

