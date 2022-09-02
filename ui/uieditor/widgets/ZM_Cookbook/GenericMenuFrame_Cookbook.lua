-- 63cac38dfd315f9e2f0f5db092556968
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.Footer.fe_FooterContainer_NOTLobby" )

CoD.GenericMenuFrame_Cookbook = InheritFrom( LUI.UIElement )
CoD.GenericMenuFrame_Cookbook.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.GenericMenuFrame_Cookbook )
	self.id = "GenericMenuFrame_Cookbook"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 1280 )
	self:setTopBottom( true, false, 0, 720 )
	self.anyChildUsesUpdateState = true
	
	local titleLabel = LUI.UITightText.new()
	titleLabel:setLeftRight( true, false, 57, 134 )
	titleLabel:setTopBottom( true, false, 31.5, 79.5 )
	titleLabel:setAlpha( 0 )
	titleLabel:setText( Engine.Localize( "MENU_NEW" ) )
	titleLabel:setTTF( "fonts/FoundryGridnik-Bold.ttf" )
	self:addElement( titleLabel )
	self.titleLabel = titleLabel
	
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
	
	LUI.OverrideFunction_CallOriginalFirst( self, "setState", function ( element, controller )
		if IsElementInState( element, "Update" ) then
			SetElementStateByElementName( self, "cac3dTitleIntermediary0", controller, "Update" )
		end
	end )

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.feFooterContainerNOTLobby:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

