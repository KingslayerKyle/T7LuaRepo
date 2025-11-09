require( "ui.uieditor.widgets.CAC.cac_3dTitleIntermediary" )
require( "ui.uieditor.widgets.Footer.fe_FooterContainer_NOTLobby" )

CoD.GenericMenuFrame = InheritFrom( LUI.UIElement )
CoD.GenericMenuFrame.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.GenericMenuFrame )
	self.id = "GenericMenuFrame"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 1280 )
	self:setTopBottom( true, false, 0, 720 )
	self.anyChildUsesUpdateState = true
	
	local topBorder = LUI.UIImage.new()
	topBorder:setLeftRight( true, true, 0, 0 )
	topBorder:setTopBottom( true, false, -13, 85.5 )
	topBorder:setRGB( 0, 0, 0 )
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
	cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.Label0:setText( Engine.Localize( "MENU" ) )
	self:addElement( cac3dTitleIntermediary0 )
	self.cac3dTitleIntermediary0 = cac3dTitleIntermediary0
	
	local CategoryListLine = LUI.UIImage.new()
	CategoryListLine:setLeftRight( true, false, -12, 1292 )
	CategoryListLine:setTopBottom( true, false, 79.5, 89 )
	CategoryListLine:setRGB( 0.9, 0.9, 0.9 )
	CategoryListLine:setImage( RegisterImage( "uie_t7_menu_cac_tabline" ) )
	self:addElement( CategoryListLine )
	self.CategoryListLine = CategoryListLine
	
	local feFooterContainerNOTLobby = CoD.fe_FooterContainer_NOTLobby.new( menu, controller )
	feFooterContainerNOTLobby:setLeftRight( true, false, 1, 1279 )
	feFooterContainerNOTLobby:setTopBottom( true, false, 653, 718 )
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
	
	LUI.OverrideFunction_CallOriginalFirst( self, "setState", function ( element, state )
		if IsElementInState( element, "Update" ) then
			SetElementStateByElementName( self, "cac3dTitleIntermediary0", controller, "Update" )
		end
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.cac3dTitleIntermediary0:close()
		self.feFooterContainerNOTLobby:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

