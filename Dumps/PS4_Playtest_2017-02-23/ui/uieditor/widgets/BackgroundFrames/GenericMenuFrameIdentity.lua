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
	self:setLeftRight( 0, 0, 0, 1920 )
	self:setTopBottom( 0, 0, 0, 1080 )
	self.anyChildUsesUpdateState = true
	
	local topBorder = LUI.UIImage.new()
	topBorder:setLeftRight( 0, 1, -78, 76 )
	topBorder:setTopBottom( 0, 0, -77, 128 )
	topBorder:setRGB( 0, 0, 0 )
	topBorder:setAlpha( 0.4 )
	self:addElement( topBorder )
	self.topBorder = topBorder
	
	local titleLabel = LUI.UITightText.new()
	titleLabel:setLeftRight( 0, 0, 85, 201 )
	titleLabel:setTopBottom( 0, 0, 47, 119 )
	titleLabel:setAlpha( 0 )
	titleLabel:setText( Engine.Localize( "MENU_NEW" ) )
	titleLabel:setTTF( "fonts/FoundryGridnik-Bold.ttf" )
	self:addElement( titleLabel )
	self.titleLabel = titleLabel
	
	local cac3dTitleIntermediary0 = CoD.cac_3dTitleIntermediary.new( menu, controller )
	cac3dTitleIntermediary0:setLeftRight( 0, 0, -117, 797 )
	cac3dTitleIntermediary0:setTopBottom( 0, 0, 0.5, 219.5 )
	cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.Label0:setText( Engine.Localize( "" ) )
	self:addElement( cac3dTitleIntermediary0 )
	self.cac3dTitleIntermediary0 = cac3dTitleIntermediary0
	
	local CategoryListLine = LUI.UIImage.new()
	CategoryListLine:setLeftRight( 0, 1, -18, 18 )
	CategoryListLine:setTopBottom( 0, 0, 119, 133 )
	CategoryListLine:setRGB( 0.9, 0.9, 0.9 )
	CategoryListLine:setImage( RegisterImage( "uie_t7_menu_cac_tabline" ) )
	self:addElement( CategoryListLine )
	self.CategoryListLine = CategoryListLine
	
	local feFooterContainerNOTLobby = CoD.fe_FooterContainer_NOTLobby.new( menu, controller )
	feFooterContainerNOTLobby:setLeftRight( 0, 1, 2, -2 )
	feFooterContainerNOTLobby:setTopBottom( 1, 1, -100, 0 )
	feFooterContainerNOTLobby:linkToElementModel( self, nil, false, function ( model )
		feFooterContainerNOTLobby:setModel( model, controller )
	end )
	feFooterContainerNOTLobby:registerEventHandler( "menu_loaded", function ( element, event )
		local retVal = nil
		SizeToSafeArea( element, controller )
		if not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return retVal
	end )
	self:addElement( feFooterContainerNOTLobby )
	self.feFooterContainerNOTLobby = feFooterContainerNOTLobby
	
	local SelfIdentityBadge = CoD.SelfIdentityBadge.new( menu, controller )
	SelfIdentityBadge:setLeftRight( 1, 1, -652, -138 )
	SelfIdentityBadge:setTopBottom( 0, 0, 35, 125 )
	SelfIdentityBadge:subscribeToGlobalModel( controller, "PerController", "identityBadge", function ( model )
		SelfIdentityBadge:setModel( model, controller )
	end )
	SelfIdentityBadge:subscribeToGlobalModel( controller, "PerController", nil, function ( model )
		SelfIdentityBadge.CallingCard.CallingCardsFrameWidget:setModel( model, controller )
	end )
	self:addElement( SelfIdentityBadge )
	self.SelfIdentityBadge = SelfIdentityBadge
	
	LUI.OverrideFunction_CallOriginalFirst( self, "setState", function ( element, state )
		if IsElementInState( element, "Update" ) then
			SetElementStateByElementName( self, "cac3dTitleIntermediary0", controller, "Update" )
		end
	end )
	SelfIdentityBadge.id = "SelfIdentityBadge"
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.cac3dTitleIntermediary0:close()
		self.feFooterContainerNOTLobby:close()
		self.SelfIdentityBadge:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

