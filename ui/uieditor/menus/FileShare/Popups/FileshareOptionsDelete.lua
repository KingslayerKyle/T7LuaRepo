-- 087ed6afdcd21d48954818ff79683951
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.FileShare.FullscreenPopup.FullscreenPopupTemplate" )
require( "ui.uieditor.widgets.Footer.fe_LeftContainer_NOTLobby" )

LUI.createMenu.FileshareOptionsDelete = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "FileshareOptionsDelete" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "default"
	self:setOwner( controller )
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, true, 0, 0 )
	self:playSound( "menu_open", controller )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "FileshareOptionsDelete.buttonPrompts" )
	local f1_local1 = self
	self.anyChildUsesUpdateState = true
	
	local FullscreenPopupTemplate0 = CoD.FullscreenPopupTemplate.new( f1_local1, controller )
	FullscreenPopupTemplate0:setLeftRight( true, false, 0, 1280 )
	FullscreenPopupTemplate0:setTopBottom( true, false, 0, 720 )
	FullscreenPopupTemplate0.RedLine:setRGB( 1, 0, 0 )
	FullscreenPopupTemplate0.ButtonList:setDataSource( "FileshareOptionsDeleteButtonList" )
	FullscreenPopupTemplate0.WorkingTitle:setText( Engine.Localize( "MENU_FILESHARE_DELETING" ) )
	FullscreenPopupTemplate0.Title:setText( Engine.Localize( "MENU_FILESHARE_DELETE_PROMPT" ) )
	FullscreenPopupTemplate0.Subtitle:setText( Engine.Localize( "MENU_FILESHARE_DELETE_PROMPT_DESC" ) )
	FullscreenPopupTemplate0.DoneTitle:setText( Engine.Localize( "MENU_FILESHARE_DELETE_SUCCESS" ) )
	FullscreenPopupTemplate0.ErrorSubtitle:setText( Engine.Localize( "MENU_FILESHARE_DELETE_ERROR" ) )
	FullscreenPopupTemplate0:mergeStateConditions( {
		{
			stateName = "WorkingState",
			condition = function ( menu, element, event )
				return FileshareIsDeleting()
			end
		},
		{
			stateName = "ErrorState",
			condition = function ( menu, element, event )
				return FileshareIsDeletingInError()
			end
		}
	} )
	FullscreenPopupTemplate0:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "fileshareRoot.isDeleting" ), function ( model )
		f1_local1:updateElementState( FullscreenPopupTemplate0, {
			name = "model_validation",
			menu = f1_local1,
			modelValue = Engine.GetModelValue( model ),
			modelName = "fileshareRoot.isDeleting"
		} )
	end )
	self:addElement( FullscreenPopupTemplate0 )
	self.FullscreenPopupTemplate0 = FullscreenPopupTemplate0
	
	local BG = LUI.UIImage.new()
	BG:setLeftRight( true, false, 97, 447 )
	BG:setTopBottom( true, false, 223, 513 )
	BG:setRGB( 0.4, 0.4, 0.4 )
	BG:setAlpha( FileshareShowDeleteOptionItem( 0.5 ) )
	self:addElement( BG )
	self.BG = BG
	
	local WCFileshareIconExtraCamRender = LUI.UIImage.new()
	WCFileshareIconExtraCamRender:setLeftRight( true, false, 97, 447 )
	WCFileshareIconExtraCamRender:setTopBottom( false, true, -497, -207 )
	WCFileshareIconExtraCamRender:setAlpha( FileshareShowDeleteOptionItem( 1 ) )
	WCFileshareIconExtraCamRender:subscribeToGlobalModel( controller, "FileshareSelectedItem", "fileId", function ( model )
		local fileId = Engine.GetModelValue( model )
		if fileId then
			WCFileshareIconExtraCamRender:setupWCFileshareIconExtraCamRender( GetFileshareExtraCamParameters( controller, fileId ) )
		end
	end )
	self:addElement( WCFileshareIconExtraCamRender )
	self.WCFileshareIconExtraCamRender = WCFileshareIconExtraCamRender
	
	local WeaponNameBg = LUI.UIImage.new()
	WeaponNameBg:setLeftRight( true, false, 97, 447 )
	WeaponNameBg:setTopBottom( true, false, 482, 514 )
	WeaponNameBg:setRGB( 0, 0, 0 )
	WeaponNameBg:setAlpha( FileshareShowDeleteOptionItem( 0.8 ) )
	self:addElement( WeaponNameBg )
	self.WeaponNameBg = WeaponNameBg
	
	local WeaponName = LUI.UITightText.new()
	WeaponName:setLeftRight( true, false, 99.5, 447 )
	WeaponName:setTopBottom( true, false, 485.5, 510.5 )
	WeaponName:setAlpha( FileshareShowDeleteOptionItem( 1 ) )
	WeaponName:setTTF( "fonts/default.ttf" )
	WeaponName:subscribeToGlobalModel( controller, "FileshareSelectedItem", "weaponName", function ( model )
		local weaponName = Engine.GetModelValue( model )
		if weaponName then
			WeaponName:setText( Engine.Localize( weaponName ) )
		end
	end )
	self:addElement( WeaponName )
	self.WeaponName = WeaponName
	
	local ItemNameBg = LUI.UIImage.new()
	ItemNameBg:setLeftRight( true, false, 97, 447 )
	ItemNameBg:setTopBottom( true, false, 449, 481 )
	ItemNameBg:setAlpha( FileshareShowDeleteOptionItem( 0.8 ) )
	self:addElement( ItemNameBg )
	self.ItemNameBg = ItemNameBg
	
	local ItemName = LUI.UITightText.new()
	ItemName:setLeftRight( true, false, 99.5, 447 )
	ItemName:setTopBottom( true, false, 450, 480 )
	ItemName:setRGB( 0, 0, 0 )
	ItemName:setAlpha( FileshareShowDeleteOptionItem( 1 ) )
	ItemName:setTTF( "fonts/default.ttf" )
	ItemName:subscribeToGlobalModel( controller, "FileshareSelectedItem", "fileName", function ( model )
		local fileName = Engine.GetModelValue( model )
		if fileName then
			ItemName:setText( Engine.Localize( fileName ) )
		end
	end )
	self:addElement( ItemName )
	self.ItemName = ItemName
	
	local buttons = CoD.fe_LeftContainer_NOTLobby.new( f1_local1, controller )
	buttons:setLeftRight( false, false, -540.5, -108.5 )
	buttons:setTopBottom( true, false, 532, 564 )
	self:addElement( buttons )
	self.buttons = buttons
	
	self:registerEventHandler( "fileshare_delete_success", function ( element, event )
		local f8_local0 = nil
		FileshareDeleteDone( self, element, controller, "", f1_local1 )
		if not f8_local0 then
			f8_local0 = element:dispatchEventToChildren( event )
		end
		return f8_local0
	end )
	f1_local1:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, nil, function ( f9_arg0, f9_arg1, f9_arg2, f9_arg3 )
		GoBack( self, f9_arg2 )
		return true
	end, function ( f10_arg0, f10_arg1, f10_arg2 )
		CoD.Menu.SetButtonLabel( f10_arg1, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "MENU_BACK" )
		return true
	end, false )
	f1_local1:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( f11_arg0, f11_arg1, f11_arg2, f11_arg3 )
		return true
	end, function ( f12_arg0, f12_arg1, f12_arg2 )
		CoD.Menu.SetButtonLabel( f12_arg1, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "" )
		return false
	end, false )
	FullscreenPopupTemplate0.id = "FullscreenPopupTemplate0"
	buttons:setModel( self.buttonModel, controller )
	self:processEvent( {
		name = "menu_loaded",
		controller = controller
	} )
	self:processEvent( {
		name = "update_state",
		menu = f1_local1
	} )
	if not self:restoreState() then
		self.FullscreenPopupTemplate0:processEvent( {
			name = "gain_focus",
			controller = controller
		} )
	end
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.FullscreenPopupTemplate0:close()
		element.buttons:close()
		element.WCFileshareIconExtraCamRender:close()
		element.WeaponName:close()
		element.ItemName:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "FileshareOptionsDelete.buttonPrompts" ) )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	
	return self
end

