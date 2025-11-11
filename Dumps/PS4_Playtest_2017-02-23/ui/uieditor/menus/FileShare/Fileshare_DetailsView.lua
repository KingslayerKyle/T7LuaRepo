require( "ui.uieditor.menus.FileShare.Popups.FileshareOptions" )
require( "ui.uieditor.widgets.BorderBakedBlur" )
require( "ui.uieditor.widgets.BorderBakedSolid" )
require( "ui.uieditor.widgets.FileShare.FileshareArrow" )
require( "ui.uieditor.widgets.FileShare.FileshareDetailsViewInfo" )
require( "ui.uieditor.widgets.FileShare.FileshareSpinner" )

local PreLoadFunc = function ( self, controller )
	local rootModel = Engine.CreateModel( Engine.GetGlobalModel(), "FileshareSelectedItem", false )
	Engine.CreateModel( rootModel, "weaponName", false )
	Engine.CreateModel( rootModel, "fileName", false )
	local fileshareRootModel = Engine.CreateModel( Engine.GetGlobalModel(), "FileshareRoot", false )
	Engine.CreateModel( fileshareRootModel, "DetailsHiddenMode", false )
end

local PostLoadFunc = function ( self, controller )
	self.FileshareSpinner:setAlpha( 0 )
	if CoD.FileshareUtility.GetCurrentCategory() == "emblem" then
		local fileId = CoD.FileshareUtility.GetSelectedItemProperty( "fileId" )
		if fileId then
			self.WCFileshareIconExtraCamRender:setupWCFileshareIconExtraCamRender( GetFileshareExtraCamParameters( controller, fileId ) )
		end
	end
end

LUI.createMenu.Fileshare_DetailsView = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "Fileshare_DetailsView" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "default"
	self:setOwner( controller )
	self:setLeftRight( 0, 1, 0, 0 )
	self:setTopBottom( 0, 1, 0, 0 )
	self:playSound( "menu_open", controller )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "Fileshare_DetailsView.buttonPrompts" )
	self.anyChildUsesUpdateState = true
	
	local BlackBG = LUI.UIImage.new()
	BlackBG:setLeftRight( 0, 1, 0, 0 )
	BlackBG:setTopBottom( 0, 1, 0, 0 )
	BlackBG:setAlpha( 0 )
	BlackBG:setImage( RegisterImage( "uie_fe_cp_background" ) )
	self:addElement( BlackBG )
	self.BlackBG = BlackBG
	
	local FileshareDetailsViewInfo = CoD.FileshareDetailsViewInfo.new( self, controller )
	FileshareDetailsViewInfo:mergeStateConditions( {
		{
			stateName = "Emblem",
			condition = function ( menu, element, event )
				return FileshareIsCategory( controller, "emblem" )
			end
		},
		{
			stateName = "Hidden",
			condition = function ( menu, element, event )
				return FileshareIsDetailsViewHiddenMode( controller )
			end
		}
	} )
	FileshareDetailsViewInfo:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "FileshareRoot.DetailsHiddenMode" ), function ( model )
		self:updateElementState( FileshareDetailsViewInfo, {
			name = "model_validation",
			menu = self,
			modelValue = Engine.GetModelValue( model ),
			modelName = "FileshareRoot.DetailsHiddenMode"
		} )
	end )
	FileshareDetailsViewInfo:setLeftRight( 0, 0, 0, 1920 )
	FileshareDetailsViewInfo:setTopBottom( 0, 0, 0, 1080 )
	FileshareDetailsViewInfo:linkToElementModel( self, nil, false, function ( model )
		FileshareDetailsViewInfo.FileshareSelectedItemInfo:setModel( model, controller )
	end )
	FileshareDetailsViewInfo:linkToElementModel( self, "weaponName", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			FileshareDetailsViewInfo.ItemName.weaponNameWithVariant.itemName.itemName:setText( Engine.Localize( modelValue ) )
		end
	end )
	FileshareDetailsViewInfo:linkToElementModel( self, "fileName", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			FileshareDetailsViewInfo.ItemName.weaponNameWithVariant.variantName.itemName:setText( Engine.Localize( modelValue ) )
		end
	end )
	FileshareDetailsViewInfo:linkToElementModel( self, "fileName", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			FileshareDetailsViewInfo.EmblemName.weaponNameWithVariant.itemName.itemName:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( FileshareDetailsViewInfo )
	self.FileshareDetailsViewInfo = FileshareDetailsViewInfo
	
	local BorderBakedBlur0 = CoD.BorderBakedBlur.new( self, controller )
	BorderBakedBlur0:setLeftRight( 0.5, 0.5, -490.5, 490.5 )
	BorderBakedBlur0:setTopBottom( 0, 0, 136, 750 )
	BorderBakedBlur0:setAlpha( 0 )
	self:addElement( BorderBakedBlur0 )
	self.BorderBakedBlur0 = BorderBakedBlur0
	
	local BorderBakedSolid0 = CoD.BorderBakedSolid.new( self, controller )
	BorderBakedSolid0:setLeftRight( 0.5, 0.5, -490.5, 490.5 )
	BorderBakedSolid0:setTopBottom( 0, 0, 136, 750 )
	BorderBakedSolid0:setAlpha( 0 )
	self:addElement( BorderBakedSolid0 )
	self.BorderBakedSolid0 = BorderBakedSolid0
	
	local WCFileshareIconExtraCamRender = LUI.UIImage.new()
	WCFileshareIconExtraCamRender:setLeftRight( 0, 0, 485, 1436 )
	WCFileshareIconExtraCamRender:setTopBottom( 0, 0, 151, 733 )
	WCFileshareIconExtraCamRender:subscribeToGlobalModel( controller, "FileshareSelectedItem", "shouldShowEmblem", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			WCFileshareIconExtraCamRender:setAlpha( modelValue )
		end
	end )
	WCFileshareIconExtraCamRender:linkToElementModel( self, "renderFileId", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			WCFileshareIconExtraCamRender:setupWCFileshareIconExtraCamRender( GetFileshareExtraCamParameters( controller, modelValue ) )
		end
	end )
	self:addElement( WCFileshareIconExtraCamRender )
	self.WCFileshareIconExtraCamRender = WCFileshareIconExtraCamRender
	
	local FileshareSpinner = CoD.FileshareSpinner.new( self, controller )
	FileshareSpinner:mergeStateConditions( {
		{
			stateName = "Visible",
			condition = function ( menu, element, event )
				return AlwaysTrue()
			end
		}
	} )
	FileshareSpinner:setLeftRight( 0, 0, 913, 1009 )
	FileshareSpinner:setTopBottom( 0, 0, 395, 491 )
	FileshareSpinner:linkToElementModel( self, "showDetailsViewSpinner", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			FileshareSpinner:setAlpha( modelValue )
		end
	end )
	self:addElement( FileshareSpinner )
	self.FileshareSpinner = FileshareSpinner
	
	local FileshareArrow = CoD.FileshareArrow.new( self, controller )
	FileshareArrow:mergeStateConditions( {
		{
			stateName = "Visible",
			condition = function ( menu, element, event )
				return FileshareDetailsViewCanMoveToNext( controller )
			end
		}
	} )
	FileshareArrow:setLeftRight( 0, 0, 1734, 1824 )
	FileshareArrow:setTopBottom( 0, 0, 495, 585 )
	FileshareArrow:setAlpha( 0.9 )
	self:addElement( FileshareArrow )
	self.FileshareArrow = FileshareArrow
	
	local FileshareArrow0 = CoD.FileshareArrow.new( self, controller )
	FileshareArrow0:mergeStateConditions( {
		{
			stateName = "Visible",
			condition = function ( menu, element, event )
				return FileshareDetailsViewCanMoveToPrevious( controller )
			end
		}
	} )
	FileshareArrow0:setLeftRight( 0, 0, 96, 186 )
	FileshareArrow0:setTopBottom( 0, 0, 495, 585 )
	FileshareArrow0:setAlpha( 0.9 )
	FileshareArrow0:setZRot( 180 )
	self:addElement( FileshareArrow0 )
	self.FileshareArrow0 = FileshareArrow0
	
	self.resetProperties = function ()
		BlackBG:completeAnimation()
		BorderBakedSolid0:completeAnimation()
		BorderBakedBlur0:completeAnimation()
		BlackBG:setAlpha( 0 )
		BorderBakedSolid0:setAlpha( 0 )
		BorderBakedBlur0:setAlpha( 0 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 0 )
			end
		},
		Emblem = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 3 )
				BlackBG:completeAnimation()
				self.BlackBG:setAlpha( 1 )
				self.clipFinished( BlackBG, {} )
				BorderBakedBlur0:completeAnimation()
				self.BorderBakedBlur0:setAlpha( 0.4 )
				self.clipFinished( BorderBakedBlur0, {} )
				BorderBakedSolid0:completeAnimation()
				self.BorderBakedSolid0:setAlpha( 0.5 )
				self.clipFinished( BorderBakedSolid0, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "Emblem",
			condition = function ( menu, element, event )
				return FileshareIsCategory( controller, "emblem" )
			end
		}
	} )
	self:registerEventHandler( "menu_loaded", function ( element, event )
		local retVal = nil
		SendClientScriptMenuChangeNotify( controller, self, true )
		SetIsInFileshare( controller, "true" )
		FileshareSetIsInFullscreenView( controller, true )
		if not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return retVal
	end )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, nil, function ( element, menu, controller, model )
		SetIsInFileshare( controller, "false" )
		GoBack( self, controller )
		FileshareSetIsInFullscreenView( controller, false )
		FileshareResetDetailsHiddenMode( controller )
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
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBY_PSTRIANGLE, nil, function ( element, menu, controller, model )
		FileshareToggleDetailsHiddenMode( controller )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBY_PSTRIANGLE, "MENU_GUNSMITH_SNAPSHOT_TOGGLE_UI", nil )
		return true
	end, false )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_RIGHT, nil, function ( element, menu, controller, model )
		if FileshareDetailsViewCanMoveToNext( controller ) then
			FileshareMoveToNextItem( self, element, controller, menu )
			UpdateElementState( self, "FileshareArrow", controller )
			UpdateElementState( self, "FileshareArrow0", controller )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_RIGHT, "MENU_NEXT", nil )
		if FileshareDetailsViewCanMoveToNext( controller ) then
			return true
		else
			return false
		end
	end, true )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_LEFT, nil, function ( element, menu, controller, model )
		if FileshareDetailsViewCanMoveToPrevious( controller ) then
			FileshareMoveToPreviousItem( self, element, controller )
			UpdateElementState( self, "FileshareArrow", controller )
			UpdateElementState( self, "FileshareArrow0", controller )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_LEFT, "MENU_PREVIOUS", nil )
		if FileshareDetailsViewCanMoveToPrevious( controller ) then
			return true
		else
			return false
		end
	end, true )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_LSTICK_PRESSED, nil, function ( element, menu, controller, model )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_LSTICK_PRESSED, "", nil )
		return false
	end, false )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_RSTICK_PRESSED, nil, function ( element, menu, controller, model )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_RSTICK_PRESSED, "", nil )
		return false
	end, false )
	LUI.OverrideFunction_CallOriginalFirst( self, "close", function ( element )
		SendClientScriptMenuChangeNotify( controller, self, false )
		FileshareResetDetailsHiddenMode( controller )
		FileshareSetDirty( controller )
	end )
	FileshareDetailsViewInfo:setModel( self.buttonModel, controller )
	FileshareDetailsViewInfo.feFooterContainerNOTLobby:setModel( self.buttonModel, controller )
	self:processEvent( {
		name = "menu_loaded",
		controller = controller
	} )
	self:processEvent( {
		name = "update_state",
		menu = self
	} )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.FileshareDetailsViewInfo:close()
		self.BorderBakedBlur0:close()
		self.BorderBakedSolid0:close()
		self.FileshareSpinner:close()
		self.FileshareArrow:close()
		self.FileshareArrow0:close()
		self.WCFileshareIconExtraCamRender:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "Fileshare_DetailsView.buttonPrompts" ) )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	return self
end

