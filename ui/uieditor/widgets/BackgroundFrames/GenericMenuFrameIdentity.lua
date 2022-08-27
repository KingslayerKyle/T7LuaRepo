-- 0ee394a4cb80e22fbeda9e91d7ec530b
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.CAC.cac_3dTitleIntermediary" )
require( "ui.uieditor.widgets.Footer.fe_FooterContainer_NOTLobby" )
require( "ui.uieditor.widgets.playercard.SelfIdentityBadge" )

CoD.GenericMenuFrameIdentity = InheritFrom( LUI.UIElement )
CoD.GenericMenuFrameIdentity.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.GenericMenuFrameIdentity )
	self.id = "GenericMenuFrameIdentity"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 1280 )
	self:setTopBottom( true, false, 0, 720 )
	self.anyChildUsesUpdateState = true
	
	local topBorder = LUI.UIImage.new()
	topBorder:setLeftRight( true, true, -52, 51 )
	topBorder:setTopBottom( true, false, -51, 85.5 )
	topBorder:setRGB( 0, 0, 0 )
	topBorder:setAlpha( 0.4 )
	self:addElement( topBorder )
	self.topBorder = topBorder
	
	local titleLabel = LUI.UITightText.new()
	titleLabel:setLeftRight( true, false, 57, 134 )
	titleLabel:setTopBottom( true, false, 31.5, 79.5 )
	titleLabel:setAlpha( 0 )
	titleLabel:setText( Engine.Localize( "MENU_NEW" ) )
	titleLabel:setTTF( "fonts/FoundryGridnik-Bold.ttf" )
	self:addElement( titleLabel )
	self.titleLabel = titleLabel
	
	local cac3dTitleIntermediary0 = CoD.cac_3dTitleIntermediary.new( menu, controller )
	cac3dTitleIntermediary0:setLeftRight( true, false, -78, 531 )
	cac3dTitleIntermediary0:setTopBottom( true, false, 0, 146 )
	cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.Label0:setText( Engine.Localize( "" ) )
	self:addElement( cac3dTitleIntermediary0 )
	self.cac3dTitleIntermediary0 = cac3dTitleIntermediary0
	
	local CategoryListLine = LUI.UIImage.new()
	CategoryListLine:setLeftRight( true, true, -12, 12 )
	CategoryListLine:setTopBottom( true, false, 79.5, 89 )
	CategoryListLine:setRGB( 0.9, 0.9, 0.9 )
	CategoryListLine:setImage( RegisterImage( "uie_t7_menu_cac_tabline" ) )
	self:addElement( CategoryListLine )
	self.CategoryListLine = CategoryListLine
	
	local feFooterContainerNOTLobby = CoD.fe_FooterContainer_NOTLobby.new( menu, controller )
	feFooterContainerNOTLobby:setLeftRight( true, true, 1, -1 )
	feFooterContainerNOTLobby:setTopBottom( false, true, -67, 0 )
	feFooterContainerNOTLobby:linkToElementModel( self, nil, false, function ( model )
		feFooterContainerNOTLobby:setModel( model, controller )
	end )
	feFooterContainerNOTLobby:registerEventHandler( "menu_loaded", function ( element, event )
		local f3_local0 = nil
		SizeToSafeArea( element, controller )
		if not f3_local0 then
			f3_local0 = element:dispatchEventToChildren( event )
		end
		return f3_local0
	end )
	self:addElement( feFooterContainerNOTLobby )
	self.feFooterContainerNOTLobby = feFooterContainerNOTLobby
	
	local SelfIdentityBadge = CoD.SelfIdentityBadge.new( menu, controller )
	SelfIdentityBadge:setLeftRight( false, true, -435, -92 )
	SelfIdentityBadge:setTopBottom( true, false, 23, 83 )
	SelfIdentityBadge:subscribeToGlobalModel( controller, "PerController", "identityBadge", function ( model )
		SelfIdentityBadge:setModel( model, controller )
	end )
	SelfIdentityBadge:subscribeToGlobalModel( controller, "PerController", nil, function ( model )
		SelfIdentityBadge.CallingCard.CallingCardsFrameWidget:setModel( model, controller )
	end )
	self:addElement( SelfIdentityBadge )
	self.SelfIdentityBadge = SelfIdentityBadge
	
	LUI.OverrideFunction_CallOriginalFirst( self, "setState", function ( element, controller )
		if IsElementInState( element, "Update" ) then
			SetElementStateByElementName( self, "cac3dTitleIntermediary0", controller, "Update" )
		end
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.cac3dTitleIntermediary0:close()
		element.feFooterContainerNOTLobby:close()
		element.SelfIdentityBadge:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

