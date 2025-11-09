require( "ui.uieditor.menus.FileShare.Popups.FileshareOptions" )
require( "ui.uieditor.widgets.Footer.fe_FooterContainer_NOTLobby" )
require( "ui.uieditor.widgets.FileShare.FileshareSelectedItemInfo" )
require( "ui.uieditor.widgets.CAC.MenuChooseClass.ItemWidgets.InfoPaneItemName" )

LUI.createMenu.Fileshare_ScreenshotDetailsView = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "Fileshare_ScreenshotDetailsView" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "default"
	self:setOwner( controller )
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, true, 0, 0 )
	self:playSound( "menu_open", controller )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "Fileshare_ScreenshotDetailsView.buttonPrompts" )
	self.anyChildUsesUpdateState = true
	
	local background = LUI.UIImage.new()
	background:setLeftRight( true, true, 0, 0 )
	background:setTopBottom( true, true, 0, 0 )
	background:setRGB( 0, 0, 0 )
	self:addElement( background )
	self.background = background
	
	local ImageViewer0 = LUI.UIElement.new()
	ImageViewer0:setLeftRight( true, true, 0, 0 )
	ImageViewer0:setTopBottom( true, true, 0, 0 )
	ImageViewer0:subscribeToGlobalModel( controller, "FileshareSelectedItem", "fileId", function ( model )
		local fileId = Engine.GetModelValue( model )
		if fileId then
			ImageViewer0:setupImageViewer( GetImageViewerParams( "UI_SCREENSHOT_TYPE_SCREENSHOT", fileId ) )
		end
	end )
	self:addElement( ImageViewer0 )
	self.ImageViewer0 = ImageViewer0
	
	local feFooterContainerNOTLobby = CoD.fe_FooterContainer_NOTLobby.new( self, controller )
	feFooterContainerNOTLobby:setLeftRight( true, false, 0, 1280 )
	feFooterContainerNOTLobby:setTopBottom( true, false, 619, 667 )
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
	
	local FileshareSelectedItemInfo = CoD.FileshareSelectedItemInfo.new( self, controller )
	FileshareSelectedItemInfo:setLeftRight( true, false, 64, 482 )
	FileshareSelectedItemInfo:setTopBottom( false, true, -163, -79 )
	FileshareSelectedItemInfo:subscribeToGlobalModel( controller, "FileshareSelectedItem", nil, function ( model )
		FileshareSelectedItemInfo:setModel( model, controller )
	end )
	self:addElement( FileshareSelectedItemInfo )
	self.FileshareSelectedItemInfo = FileshareSelectedItemInfo
	
	local ScreenshotName = CoD.InfoPaneItemName.new( self, controller )
	ScreenshotName:setLeftRight( true, false, 64, 445 )
	ScreenshotName:setTopBottom( false, true, -207, -173 )
	ScreenshotName.weaponNameWithVariant.variantName:setAlpha( 1 )
	ScreenshotName.weaponNameWithVariant.variantName.itemName:setText( Engine.Localize( "" ) )
	ScreenshotName:subscribeToGlobalModel( controller, "FileshareSelectedItem", "fileName", function ( model )
		local fileName = Engine.GetModelValue( model )
		if fileName then
			ScreenshotName.weaponNameWithVariant.itemName.itemName:setText( fileName )
		end
	end )
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
	self:addElement( ScreenshotName )
	self.ScreenshotName = ScreenshotName
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 3 )
				feFooterContainerNOTLobby:completeAnimation()
				self.feFooterContainerNOTLobby:setAlpha( 1 )
				self.clipFinished( feFooterContainerNOTLobby, {} )
				FileshareSelectedItemInfo:completeAnimation()
				self.FileshareSelectedItemInfo:setAlpha( 1 )
				self.clipFinished( FileshareSelectedItemInfo, {} )
				ScreenshotName:completeAnimation()
				self.ScreenshotName:setLeftRight( true, false, 64, 445 )
				self.ScreenshotName:setTopBottom( false, true, -207, -173 )
				self.ScreenshotName:setAlpha( 1 )
				self.clipFinished( ScreenshotName, {} )
			end
		},
		UIHidden = {
			DefaultClip = function ()
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
				self:setupElementClipCounter( 3 )
				feFooterContainerNOTLobby:completeAnimation()
				self.feFooterContainerNOTLobby:setAlpha( 1 )
				self.clipFinished( feFooterContainerNOTLobby, {} )
				FileshareSelectedItemInfo:completeAnimation()
				self.FileshareSelectedItemInfo:setAlpha( 0 )
				self.clipFinished( FileshareSelectedItemInfo, {} )
				ScreenshotName:completeAnimation()
				self.ScreenshotName:setLeftRight( true, false, 64, 445 )
				self.ScreenshotName:setTopBottom( false, true, -138, -104 )
				self.ScreenshotName:setAlpha( 1 )
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
	self:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "FileshareRoot.SelectedFileID" ), function ( model )
		local f15_local0 = self
		local f15_local1 = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "FileshareRoot.SelectedFileID"
		}
		CoD.Menu.UpdateButtonShownState( f15_local0, self, controller, Enum.LUIButton.LUI_KEY_START )
	end )
	self:registerEventHandler( "menu_loaded", function ( self, event )
		local f16_local0 = nil
		SetIsInFileshare( controller, "true" )
		FileshareSetIsInFullscreenView( controller, true )
		if not f16_local0 then
			f16_local0 = self:dispatchEventToChildren( event )
		end
		return f16_local0
	end )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, nil, function ( element, menu, controller, model )
		GoBack( self, controller )
		FileshareSetIsInFullscreenView( controller, false )
		PreserveThumbnails( controller, false )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "MENU_BACK" )
		return true
	end, false )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_START, "O", function ( element, menu, controller, model )
		if FileshareCanShowOptionsMenu( controller ) and not IsPerControllerTablePropertyValue( controller, "combatRecordProfileSnapshot", true ) then
			OpenPopup( self, "FileshareOptions", controller, "", "" )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		if FileshareCanShowOptionsMenu( controller ) and not IsPerControllerTablePropertyValue( controller, "combatRecordProfileSnapshot", true ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_START, "MENU_SOCIAL" )
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
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBY_PSTRIANGLE, "MENU_GUNSMITH_SNAPSHOT_TOGGLE_UI" )
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
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.feFooterContainerNOTLobby:close()
		element.FileshareSelectedItemInfo:close()
		element.ScreenshotName:close()
		element.ImageViewer0:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "Fileshare_ScreenshotDetailsView.buttonPrompts" ) )
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	
	return self
end

