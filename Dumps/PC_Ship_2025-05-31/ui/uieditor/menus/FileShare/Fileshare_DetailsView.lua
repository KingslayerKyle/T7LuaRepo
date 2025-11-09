require( "ui.uieditor.menus.FileShare.Popups.FileshareOptions" )
require( "ui.uieditor.widgets.FileShare.FileshareDetailsViewInfo" )
require( "ui.uieditor.widgets.BorderBakedBlur" )
require( "ui.uieditor.widgets.BorderBakedSolid" )
require( "ui.uieditor.widgets.FileShare.FileshareSpinner" )
require( "ui.uieditor.widgets.FileShare.FileshareArrow" )
require( "ui.uieditor.widgets.PC.Utility.XCamMouseControl" )

local PreLoadFunc = function ( self, controller )
	local f1_local0 = Engine.CreateModel( Engine.GetGlobalModel(), "FileshareSelectedItem", false )
	Engine.CreateModel( f1_local0, "weaponName", false )
	Engine.CreateModel( f1_local0, "fileName", false )
	Engine.CreateModel( Engine.CreateModel( Engine.GetGlobalModel(), "FileshareRoot", false ), "DetailsHiddenMode", false )
end

local PostLoadFunc = function ( f2_arg0, f2_arg1 )
	f2_arg0.FileshareSpinner:setAlpha( 0 )
	if FileshareIsSelectedItemCategory( f2_arg1, "emblem" ) then
		local f2_local0 = CoD.FileshareUtility.GetSelectedItemProperty( "fileId" )
		if f2_local0 then
			f2_arg0.WCFileshareIconExtraCamRender:setupWCFileshareIconExtraCamRender( GetFileshareExtraCamParameters( f2_arg1, f2_local0 ) )
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
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, true, 0, 0 )
	self:playSound( "menu_open", controller )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "Fileshare_DetailsView.buttonPrompts" )
	self.anyChildUsesUpdateState = true
	
	local BlackBG = LUI.UIImage.new()
	BlackBG:setLeftRight( true, true, 0, 0 )
	BlackBG:setTopBottom( true, true, 0, 0 )
	BlackBG:setAlpha( 0 )
	BlackBG:setImage( RegisterImage( "uie_fe_cp_background" ) )
	self:addElement( BlackBG )
	self.BlackBG = BlackBG
	
	local FileshareDetailsViewInfo = CoD.FileshareDetailsViewInfo.new( self, controller )
	FileshareDetailsViewInfo:setLeftRight( true, false, 0, 1280 )
	FileshareDetailsViewInfo:setTopBottom( true, false, 0, 720 )
	FileshareDetailsViewInfo:linkToElementModel( self, nil, false, function ( model )
		FileshareDetailsViewInfo.FileshareSelectedItemInfo:setModel( model, controller )
	end )
	FileshareDetailsViewInfo:linkToElementModel( self, "weaponName", true, function ( model )
		local weaponName = Engine.GetModelValue( model )
		if weaponName then
			FileshareDetailsViewInfo.ItemName.weaponNameWithVariant.itemName.itemName:setText( Engine.Localize( weaponName ) )
		end
	end )
	FileshareDetailsViewInfo:linkToElementModel( self, "fileName", true, function ( model )
		local fileName = Engine.GetModelValue( model )
		if fileName then
			FileshareDetailsViewInfo.ItemName.weaponNameWithVariant.variantName.itemName:setText( Engine.Localize( fileName ) )
		end
	end )
	FileshareDetailsViewInfo:linkToElementModel( self, "fileName", true, function ( model )
		local fileName = Engine.GetModelValue( model )
		if fileName then
			FileshareDetailsViewInfo.EmblemName.weaponNameWithVariant.itemName.itemName:setText( fileName )
		end
	end )
	FileshareDetailsViewInfo:mergeStateConditions( {
		{
			stateName = "Hidden",
			condition = function ( menu, element, event )
				return FileshareIsDetailsViewHiddenMode( controller )
			end
		},
		{
			stateName = "Emblem",
			condition = function ( menu, element, event )
				return FileshareIsCategory( controller, "emblem" )
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
	self:addElement( FileshareDetailsViewInfo )
	self.FileshareDetailsViewInfo = FileshareDetailsViewInfo
	
	local BorderBakedBlur0 = CoD.BorderBakedBlur.new( self, controller )
	BorderBakedBlur0:setLeftRight( false, false, -327, 327 )
	BorderBakedBlur0:setTopBottom( true, false, 91, 500 )
	BorderBakedBlur0:setAlpha( 0 )
	self:addElement( BorderBakedBlur0 )
	self.BorderBakedBlur0 = BorderBakedBlur0
	
	local BorderBakedSolid0 = CoD.BorderBakedSolid.new( self, controller )
	BorderBakedSolid0:setLeftRight( false, false, -327, 327 )
	BorderBakedSolid0:setTopBottom( true, false, 91, 500 )
	BorderBakedSolid0:setAlpha( 0 )
	self:addElement( BorderBakedSolid0 )
	self.BorderBakedSolid0 = BorderBakedSolid0
	
	local WCFileshareIconExtraCamRender = LUI.UIImage.new()
	WCFileshareIconExtraCamRender:setLeftRight( true, false, 323.5, 957.5 )
	WCFileshareIconExtraCamRender:setTopBottom( true, false, 101, 489 )
	WCFileshareIconExtraCamRender:subscribeToGlobalModel( controller, "FileshareSelectedItem", "shouldShowEmblem", function ( model )
		local shouldShowEmblem = Engine.GetModelValue( model )
		if shouldShowEmblem then
			WCFileshareIconExtraCamRender:setAlpha( shouldShowEmblem )
		end
	end )
	WCFileshareIconExtraCamRender:linkToElementModel( self, "renderFileId", true, function ( model )
		local renderFileId = Engine.GetModelValue( model )
		if renderFileId then
			WCFileshareIconExtraCamRender:setupWCFileshareIconExtraCamRender( GetFileshareExtraCamParameters( controller, renderFileId ) )
		end
	end )
	self:addElement( WCFileshareIconExtraCamRender )
	self.WCFileshareIconExtraCamRender = WCFileshareIconExtraCamRender
	
	local FileshareSpinner = CoD.FileshareSpinner.new( self, controller )
	FileshareSpinner:setLeftRight( true, false, 608.5, 672.5 )
	FileshareSpinner:setTopBottom( true, false, 263.5, 327.5 )
	FileshareSpinner:linkToElementModel( self, "showDetailsViewSpinner", true, function ( model )
		local showDetailsViewSpinner = Engine.GetModelValue( model )
		if showDetailsViewSpinner then
			FileshareSpinner:setAlpha( showDetailsViewSpinner )
		end
	end )
	FileshareSpinner:mergeStateConditions( {
		{
			stateName = "Visible",
			condition = function ( menu, element, event )
				return AlwaysTrue()
			end
		}
	} )
	self:addElement( FileshareSpinner )
	self.FileshareSpinner = FileshareSpinner
	
	local FileshareArrow = CoD.FileshareArrow.new( self, controller )
	FileshareArrow:setLeftRight( true, false, 1156, 1216 )
	FileshareArrow:setTopBottom( true, false, 330, 390 )
	FileshareArrow:setAlpha( 0.9 )
	FileshareArrow:registerEventHandler( "button_action", function ( element, event )
		local f15_local0 = nil
		if IsPC() then
			SendButtonPressToMenuEx( self, controller, Enum.LUIButton.LUI_KEY_RIGHT )
		end
		if not f15_local0 then
			f15_local0 = element:dispatchEventToChildren( event )
		end
		return f15_local0
	end )
	FileshareArrow:mergeStateConditions( {
		{
			stateName = "Hide",
			condition = function ( menu, element, event )
				return FileshareDetailsViewAreArrowsHidden( controller )
			end
		},
		{
			stateName = "Visible",
			condition = function ( menu, element, event )
				return FileshareDetailsViewCanMoveToNext( controller )
			end
		}
	} )
	FileshareArrow:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "FileshareRoot.DetailsHiddenMode" ), function ( model )
		self:updateElementState( FileshareArrow, {
			name = "model_validation",
			menu = self,
			modelValue = Engine.GetModelValue( model ),
			modelName = "FileshareRoot.DetailsHiddenMode"
		} )
	end )
	self:addElement( FileshareArrow )
	self.FileshareArrow = FileshareArrow
	
	local FileshareArrow0 = CoD.FileshareArrow.new( self, controller )
	FileshareArrow0:setLeftRight( true, false, 64, 124 )
	FileshareArrow0:setTopBottom( true, false, 330, 390 )
	FileshareArrow0:setAlpha( 0.9 )
	FileshareArrow0:setZRot( 180 )
	FileshareArrow0:registerEventHandler( "button_action", function ( element, event )
		local f19_local0 = nil
		if IsPC() then
			SendButtonPressToMenuEx( self, controller, Enum.LUIButton.LUI_KEY_LEFT )
		end
		if not f19_local0 then
			f19_local0 = element:dispatchEventToChildren( event )
		end
		return f19_local0
	end )
	FileshareArrow0:mergeStateConditions( {
		{
			stateName = "Hide",
			condition = function ( menu, element, event )
				return FileshareDetailsViewAreArrowsHidden( controller )
			end
		},
		{
			stateName = "Visible",
			condition = function ( menu, element, event )
				return FileshareDetailsViewCanMoveToPrevious( controller )
			end
		}
	} )
	FileshareArrow0:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "FileshareRoot.DetailsHiddenMode" ), function ( model )
		self:updateElementState( FileshareArrow0, {
			name = "model_validation",
			menu = self,
			modelValue = Engine.GetModelValue( model ),
			modelName = "FileshareRoot.DetailsHiddenMode"
		} )
	end )
	self:addElement( FileshareArrow0 )
	self.FileshareArrow0 = FileshareArrow0
	
	local f3_local10 = nil
	if IsPC() then
		f3_local10 = CoD.XCamMouseControl.new( self, controller )
	else
		f3_local10 = LUI.UIElement.createFake()
	end
	f3_local10:setLeftRight( true, false, 124, 1156 )
	f3_local10:setTopBottom( true, false, 36, 545 )
	if IsPC() then
		self:addElement( f3_local10 )
	end
	self.XCamMouseControl = f3_local10
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 4 )
				BlackBG:completeAnimation()
				self.BlackBG:setAlpha( 0 )
				self.clipFinished( BlackBG, {} )
				FileshareDetailsViewInfo:completeAnimation()
				self.FileshareDetailsViewInfo:setAlpha( 1 )
				self.clipFinished( FileshareDetailsViewInfo, {} )
				BorderBakedBlur0:completeAnimation()
				self.BorderBakedBlur0:setAlpha( 0 )
				self.clipFinished( BorderBakedBlur0, {} )
				BorderBakedSolid0:completeAnimation()
				self.BorderBakedSolid0:setAlpha( 0 )
				self.clipFinished( BorderBakedSolid0, {} )
			end
		},
		Emblem = {
			DefaultClip = function ()
				self:setupElementClipCounter( 4 )
				BlackBG:completeAnimation()
				self.BlackBG:setAlpha( 1 )
				self.clipFinished( BlackBG, {} )
				FileshareDetailsViewInfo:completeAnimation()
				self.FileshareDetailsViewInfo:setAlpha( 1 )
				self.clipFinished( FileshareDetailsViewInfo, {} )
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
				return FileshareIsSelectedItemCategory( controller, "emblem" )
			end
		}
	} )
	self:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "FileshareRoot.SelectedFileID" ), function ( model )
		local f26_local0 = self
		local f26_local1 = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "FileshareRoot.SelectedFileID"
		}
		CoD.Menu.UpdateButtonShownState( f26_local0, self, controller, Enum.LUIButton.LUI_KEY_START )
	end )
	self:registerEventHandler( "menu_loaded", function ( self, event )
		local f27_local0 = nil
		SendClientScriptMenuChangeNotify( controller, self, true )
		SetIsInFileshare( controller, "true" )
		FileshareSetIsInFullscreenView( controller, true )
		if not f27_local0 then
			f27_local0 = self:dispatchEventToChildren( event )
		end
		return f27_local0
	end )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, nil, function ( element, menu, controller, model )
		SetIsInFileshare( controller, "false" )
		GoBack( self, controller )
		FileshareSetIsInFullscreenView( controller, false )
		FileshareResetDetailsHiddenMode( controller )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "MENU_BACK" )
		return true
	end, false )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_START, "S", function ( element, menu, controller, model )
		if FileshareCanShowOptionsMenu( controller ) then
			OpenPopup( self, "FileshareOptions", controller, "", "" )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		if FileshareCanShowOptionsMenu( controller ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_START, "MENU_SOCIAL" )
			return true
		else
			return false
		end
	end, false )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBY_PSTRIANGLE, "T", function ( element, menu, controller, model )
		FileshareToggleDetailsHiddenMode( controller )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBY_PSTRIANGLE, "MENU_GUNSMITH_SNAPSHOT_TOGGLE_UI" )
		return true
	end, false )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_RIGHT, "RIGHTARROW", function ( element, menu, controller, model )
		if FileshareDetailsViewCanMoveToNext( controller ) then
			FileshareMoveToNextItem( self, element, controller, menu )
			UpdateElementState( self, "FileshareArrow", controller )
			UpdateElementState( self, "FileshareArrow0", controller )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_RIGHT, "MENU_NEXT" )
		if FileshareDetailsViewCanMoveToNext( controller ) then
			return true
		else
			return false
		end
	end, true )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_LEFT, "LEFTARROW", function ( element, menu, controller, model )
		if FileshareDetailsViewCanMoveToPrevious( controller ) then
			FileshareMoveToPreviousItem( self, element, controller )
			UpdateElementState( self, "FileshareArrow", controller )
			UpdateElementState( self, "FileshareArrow0", controller )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_LEFT, "MENU_PREVIOUS" )
		if FileshareDetailsViewCanMoveToPrevious( controller ) then
			return true
		else
			return false
		end
	end, true )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_LSTICK_PRESSED, nil, function ( element, menu, controller, model )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_LSTICK_PRESSED, "" )
		return false
	end, false )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_RSTICK_PRESSED, nil, function ( element, menu, controller, model )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_RSTICK_PRESSED, "" )
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
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.FileshareDetailsViewInfo:close()
		element.BorderBakedBlur0:close()
		element.BorderBakedSolid0:close()
		element.FileshareSpinner:close()
		element.FileshareArrow:close()
		element.FileshareArrow0:close()
		element.XCamMouseControl:close()
		element.WCFileshareIconExtraCamRender:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "Fileshare_DetailsView.buttonPrompts" ) )
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	
	return self
end

