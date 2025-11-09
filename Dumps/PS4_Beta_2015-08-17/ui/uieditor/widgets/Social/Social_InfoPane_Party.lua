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
	self:setLeftRight( true, false, 0, 298 )
	self:setTopBottom( true, false, 0, 288 )
	self:makeFocusable()
	self.onlyChildrenFocusable = true
	self.anyChildUsesUpdateState = true
	
	local partyFooter = LUI.UITightText.new()
	partyFooter:setLeftRight( true, true, 12, -12 )
	partyFooter:setTopBottom( true, false, 210, 230 )
	partyFooter:setAlpha( SocialShowPartyFooter( 1 ) )
	partyFooter:setZoom( 5 )
	partyFooter:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	partyFooter:setLetterSpacing( 0.5 )
	partyFooter:linkToElementModel( self, "partySize", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			partyFooter:setText( Engine.Localize( SocialPartyFooter( modelValue ) ) )
		end
	end )
	self:addElement( partyFooter )
	self.partyFooter = partyFooter
	
	local cacItemTitleGlow0 = CoD.cac_ItemTitleGlow.new( menu, controller )
	cacItemTitleGlow0:setLeftRight( true, false, 0, 298 )
	cacItemTitleGlow0:setTopBottom( true, false, 0, 34 )
	cacItemTitleGlow0:setRGB( 0.9, 0.9, 0.9 )
	self:addElement( cacItemTitleGlow0 )
	self.cacItemTitleGlow0 = cacItemTitleGlow0
	
	local partyHeader = LUI.UITightText.new()
	partyHeader:setLeftRight( true, false, 9, 115.5 )
	partyHeader:setTopBottom( true, false, 7.5, 27.5 )
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
	PLayerList:setLeftRight( true, false, 3, 295 )
	PLayerList:setTopBottom( true, false, 37.5, 203.5 )
	PLayerList:setDataSource( "SocialPlayerPartyList" )
	PLayerList:setWidgetType( CoD.Social_PartyList )
	PLayerList:setVerticalCount( 6 )
	self:addElement( PLayerList )
	self.PLayerList = PLayerList
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )
			end
		}
	}
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

