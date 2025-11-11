require( "ui.uieditor.widgets.CAC.cac_ItemTitleGlow" )
require( "ui.uieditor.widgets.Social.Social_PartyList" )

CoD.Social_InfoPane_Party = InheritFrom( LUI.UIElement )
CoD.Social_InfoPane_Party.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.Social_InfoPane_Party )
	self.id = "Social_InfoPane_Party"
	self.soundSet = "ChooseDecal"
	self:setLeftRight( 0, 0, 0, 447 )
	self:setTopBottom( 0, 0, 0, 432 )
	self:makeFocusable()
	self.onlyChildrenFocusable = true
	self.anyChildUsesUpdateState = true
	
	local partyFooter = LUI.UITightText.new()
	partyFooter:setLeftRight( 0, 1, 12, -24 )
	partyFooter:setTopBottom( 0, 0, 331, 361 )
	partyFooter:setAlpha( SocialShowPartyFooter( 1 ) )
	partyFooter:setZoom( 5 )
	partyFooter:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	partyFooter:setLetterSpacing( 0.5 )
	partyFooter:linkToElementModel( self, "partySize", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			partyFooter:setText( SocialPartyFooter( modelValue ) )
		end
	end )
	self:addElement( partyFooter )
	self.partyFooter = partyFooter
	
	local cacItemTitleGlow0 = CoD.cac_ItemTitleGlow.new( menu, controller )
	cacItemTitleGlow0:setLeftRight( 0, 0, 0, 447 )
	cacItemTitleGlow0:setTopBottom( 0, 0, 0, 55 )
	cacItemTitleGlow0:setRGB( 0.9, 0.9, 0.9 )
	self:addElement( cacItemTitleGlow0 )
	self.cacItemTitleGlow0 = cacItemTitleGlow0
	
	local partyHeader = LUI.UITightText.new()
	partyHeader:setLeftRight( 0, 0, 13, 173 )
	partyHeader:setTopBottom( 0, 0, 16, 46 )
	partyHeader:setRGB( 0, 0, 0 )
	partyHeader:setZoom( 5 )
	partyHeader:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	partyHeader:setLetterSpacing( 0.5 )
	partyHeader:linkToElementModel( self, "partySize", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			partyHeader:setText( Engine.Localize( SocialPartyHeader( modelValue ) ) )
		end
	end )
	self:addElement( partyHeader )
	self.partyHeader = partyHeader
	
	local PLayerList = LUI.UIList.new( menu, controller, 2, 0, nil, false, false, 0, 0, false, false )
	PLayerList:makeFocusable()
	PLayerList:setLeftRight( 0, 0, 5, 443 )
	PLayerList:setTopBottom( 0, 0, 68, 312 )
	PLayerList:setWidgetType( CoD.Social_PartyList )
	PLayerList:setVerticalCount( 6 )
	PLayerList:setDataSource( "SocialPlayerPartyList" )
	self:addElement( PLayerList )
	self.PLayerList = PLayerList
	
	PLayerList.id = "PLayerList"
	self:registerEventHandler( "gain_focus", function ( self, event )
		if self.m_focusable and self.PLayerList:processEvent( event ) then
			return true
		else
			return LUI.UIElement.gainFocus( self, event )
		end
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.cacItemTitleGlow0:close()
		self.PLayerList:close()
		self.partyFooter:close()
		self.partyHeader:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

