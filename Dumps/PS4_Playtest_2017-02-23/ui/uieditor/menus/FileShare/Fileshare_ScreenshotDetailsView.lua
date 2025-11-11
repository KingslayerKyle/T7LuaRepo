require( "ui.uieditor.menus.FileShare.Popups.FileshareOptions" )
require( "ui.uieditor.widgets.CAC.MenuChooseClass.ItemWidgets.InfoPaneItemName" )
require( "ui.uieditor.widgets.FileShare.FileshareSelectedItemInfo" )
require( "ui.uieditor.widgets.Footer.fe_FooterContainer_NOTLobby" )

LUI.createMenu.Fileshare_ScreenshotDetailsView = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "Fileshare_ScreenshotDetailsView" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "default"
	self:setOwner( controller )
	self:setLeftRight( 0, 1, 0, 0 )
	self:setTopBottom( 0, 1, 0, 0 )
	self:playSound( "menu_open", controller )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "Fileshare_ScreenshotDetailsView.buttonPrompts" )
	self.anyChildUsesUpdateState = true
	
	local background = LUI.UIImage.new()
	background:setLeftRight( 0, 1, 0, 0 )
	background:setTopBottom( 0, 1, 0, 0 )
	background:setRGB( 0, 0, 0 )
	self:addElement( background )
	self.background = background
	
	local ImageViewer0 = LUI.UIElement.new()
	ImageViewer0:setLeftRight( 0, 1, 0, 0 )
	ImageViewer0:setTopBottom( 0, 1, 0, 0 )
	ImageViewer0:subscribeToGlobalModel( controller, "FileshareSelectedItem", "fileId", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			ImageViewer0:setupImageViewer( GetImageViewerParams( "UI_SCREENSHOT_TYPE_SCREENSHOT", modelValue ) )
		end
	end )
	self:addElement( ImageViewer0 )
	self.ImageViewer0 = ImageViewer0
	
	local feFooterContainerNOTLobby = CoD.fe_FooterContainer_NOTLobby.new( self, controller )
	feFooterContainerNOTLobby:setLeftRight( 0, 0, 0, 1920 )
	feFooterContainerNOTLobby:setTopBottom( 0, 0, 928, 1000 )
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
	
	local FileshareSelectedItemInfo = CoD.FileshareSelectedItemInfo.new( self, controller )
	FileshareSelectedItemInfo:setLeftRight( 0, 0, 96.5, 723.5 )
	FileshareSelectedItemInfo:setTopBottom( 1, 1, -245, -119 )
	FileshareSelectedItemInfo:subscribeToGlobalModel( controller, "FileshareSelectedItem", nil, function ( model )
		FileshareSelectedItemInfo:setModel( model, controller )
	end )
	self:addElement( FileshareSelectedItemInfo )
	self.FileshareSelectedItemInfo = FileshareSelectedItemInfo
	
	local ScreenshotName = CoD.InfoPaneItemName.new( self, controller )
	ScreenshotName:mergeStateConditions( {
		{
			stateName = "Equipped",
			condition = function ( menu, element, event )
				return AlwaysTrue()
			end
		},
		{
			stateName = "Available",
			condition = function ( menu, element, event )
				return true
			end
		},
		{
			stateName = "NotEquippable",
			condition = function ( menu, element, event )
				return true
			end
		},
		{
			stateName = "NotAvailable",
			condition = function ( menu, element, event )
				return true
			end
		}
	} )
	ScreenshotName:setLeftRight( 0, 0, 96, 668 )
	ScreenshotName:setTopBottom( 1, 1, -310.5, -259.5 )
	ScreenshotName.weaponNameWithVariant.variantName:setAlpha( 1 )
	ScreenshotName.weaponNameWithVariant.variantName.itemName:setText( Engine.Localize( "" ) )
	ScreenshotName:subscribeToGlobalModel( controller, "FileshareSelectedItem", "fileName", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			ScreenshotName.weaponNameWithVariant.itemName.itemName:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( ScreenshotName )
	self.ScreenshotName = ScreenshotName
	
	self.resetProperties = function ()
		ScreenshotName:completeAnimation()
		FileshareSelectedItemInfo:completeAnimation()
		feFooterContainerNOTLobby:completeAnimation()
		ScreenshotName:setLeftRight( 0, 0, 96, 668 )
		ScreenshotName:setTopBottom( 1, 1, -310.5, -259.5 )
		ScreenshotName:setAlpha( 1 )
		FileshareSelectedItemInfo:setAlpha( 1 )
		feFooterContainerNOTLobby:setAlpha( 1 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 0 )
			end
		},
		UIHidden = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 3 )
				feFooterContainerNOTLobby:completeAnimation()
				self.feFooterContainerNOTLobby:setAlpha( 0 )
				self.clipFinished( feFooterContainerNOTLobby, {} )
				FileshareSelectedItemInfo:completeAnimation()
				self.FileshareSelectedItemInfo:setAlpha( 0 )
				self.clipFinished( FileshareSelectedItemInfo, {} )
				ScreenshotName:completeAnimation()
				self.ScreenshotName:setAlpha( 0 )
				self.clipFinished( ScreenshotName, {} )
			end
		},
		Local = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 2 )
				FileshareSelectedItemInfo:completeAnimation()
				self.FileshareSelectedItemInfo:setAlpha( 0 )
				self.clipFinished( FileshareSelectedItemInfo, {} )
				ScreenshotName:completeAnimation()
				self.ScreenshotName:setLeftRight( 0, 0, 96, 668 )
				self.ScreenshotName:setTopBottom( 1, 1, -207.5, -156.5 )
				self.clipFinished( ScreenshotName, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "UIHidden",
			condition = function ( menu, element, event )
				return PropertyIsTrue( self, "uiHidden" )
			end
		},
		{
			stateName = "Local",
			condition = function ( menu, element, event )
				return FileshareIsCategory( controller, "screenshot_private" )
			end
		}
	} )
	self:registerEventHandler( "menu_loaded", function ( element, event )
		local retVal = nil
		SetIsInFileshare( controller, "true" )
		FileshareSetIsInFullscreenView( controller, true )
		if not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return retVal
	end )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, nil, function ( element, menu, controller, model )
		GoBack( self, controller )
		FileshareSetIsInFullscreenView( controller, false )
		PreserveThumbnails( controller, false )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "MENU_BACK", nil )
		return true
	end, false )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_START, nil, function ( element, menu, controller, model )
		if FileshareCanShowOptionsMenu( controller ) then
			OpenPopup( self, "FileshareOptions", controller, "", "" )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		if FileshareCanShowOptionsMenu( controller ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_START, "MENU_SOCIAL", nil )
			return true
		else
			return false
		end
	end, false )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBY_PSTRIANGLE, "T", function ( element, menu, controller, model )
		if IsMenuInState( menu, "UIHidden" ) then
			SetProperty( self, "uiHidden", false )
			UpdateSelfState( self, controller )
			return true
		else
			SetProperty( self, "uiHidden", true )
			UpdateSelfState( self, controller )
			return true
		end
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBY_PSTRIANGLE, "MENU_GUNSMITH_SNAPSHOT_TOGGLE_UI", nil )
		return true
	end, false )
	feFooterContainerNOTLobby:setModel( self.buttonModel, controller )
	self:processEvent( {
		name = "menu_loaded",
		controller = controller
	} )
	self:processEvent( {
		name = "update_state",
		menu = self
	} )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.feFooterContainerNOTLobby:close()
		self.FileshareSelectedItemInfo:close()
		self.ScreenshotName:close()
		self.ImageViewer0:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "Fileshare_ScreenshotDetailsView.buttonPrompts" ) )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	return self
end

