-- fafd4fa4153264a7f4e4f46e83d7601d
-- This hash is used for caching, delete to decompile the file again

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
	self:setLeftRight( true, false, 0, 300 )
	self:setTopBottom( true, false, 0, 288 )
	self:makeFocusable()
	self.onlyChildrenFocusable = true
	self.anyChildUsesUpdateState = true
	
	local partyFooter = LUI.UITightText.new()
	partyFooter:setLeftRight( true, true, 8, -16 )
	partyFooter:setTopBottom( true, false, 221, 241 )
	partyFooter:setAlpha( SocialShowPartyFooter( 1 ) )
	partyFooter:setZoom( 5 )
	partyFooter:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	partyFooter:setLetterSpacing( 0.5 )
	partyFooter:linkToElementModel( self, "partySize", true, function ( model )
		local partySize = Engine.GetModelValue( model )
		if partySize then
			partyFooter:setText( SocialPartyFooter( partySize ) )
		end
	end )
	self:addElement( partyFooter )
	self.partyFooter = partyFooter
	
	local cacItemTitleGlow0 = CoD.cac_ItemTitleGlow.new( menu, controller )
	cacItemTitleGlow0:setLeftRight( true, true, 0.5, 0 )
	cacItemTitleGlow0:setTopBottom( true, false, 0, 36.5 )
	cacItemTitleGlow0:setRGB( 0.9, 0.9, 0.9 )
	self:addElement( cacItemTitleGlow0 )
	self.cacItemTitleGlow0 = cacItemTitleGlow0
	
	local partyHeader = LUI.UITightText.new()
	partyHeader:setLeftRight( true, false, 9, 115.5 )
	partyHeader:setTopBottom( true, false, 10.5, 30.5 )
	partyHeader:setRGB( 0, 0, 0 )
	partyHeader:setZoom( 5 )
	partyHeader:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	partyHeader:setLetterSpacing( 0.5 )
	partyHeader:linkToElementModel( self, "partySize", true, function ( model )
		local partySize = Engine.GetModelValue( model )
		if partySize then
			partyHeader:setText( Engine.Localize( SocialPartyHeader( partySize ) ) )
		end
	end )
	self:addElement( partyHeader )
	self.partyHeader = partyHeader
	
	local PLayerList = LUI.UIList.new( menu, controller, 2, 0, nil, false, false, 0, 0, false, false )
	PLayerList:makeFocusable()
	PLayerList:setLeftRight( true, false, 0, 300 )
	PLayerList:setTopBottom( true, false, 43.5, 209.5 )
	PLayerList:setWidgetType( CoD.Social_PartyList )
	PLayerList:setVerticalCount( 6 )
	PLayerList:setDataSource( "SocialPlayerPartyList" )
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
	self:registerEventHandler( "gain_focus", function ( element, event )
		if element.m_focusable and element.PLayerList:processEvent( event ) then
			return true
		else
			return LUI.UIElement.gainFocus( element, event )
		end
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.cacItemTitleGlow0:close()
		element.PLayerList:close()
		element.partyFooter:close()
		element.partyHeader:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

