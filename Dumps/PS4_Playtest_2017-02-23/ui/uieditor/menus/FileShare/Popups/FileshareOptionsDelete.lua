require( "ui.uieditor.widgets.FileShare.FullscreenPopup.FullscreenPopupTemplate" )
require( "ui.uieditor.widgets.Footer.fe_LeftContainer_NOTLobby" )

LUI.createMenu.FileshareOptionsDelete = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "FileshareOptionsDelete" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "default"
	self:setOwner( controller )
	self:setLeftRight( 0, 1, 0, 0 )
	self:setTopBottom( 0, 1, 0, 0 )
	self:playSound( "menu_open", controller )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "FileshareOptionsDelete.buttonPrompts" )
	self.anyChildUsesUpdateState = true
	
	local FullscreenPopupTemplate0 = CoD.FullscreenPopupTemplate.new( self, controller )
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
		self:updateElementState( FullscreenPopupTemplate0, {
			name = "model_validation",
			menu = self,
			modelValue = Engine.GetModelValue( model ),
			modelName = "fileshareRoot.isDeleting"
		} )
	end )
	FullscreenPopupTemplate0:setLeftRight( 0, 0, 0, 1920 )
	FullscreenPopupTemplate0:setTopBottom( 0, 0, 0, 1080 )
	FullscreenPopupTemplate0.RedLine:setRGB( 1, 0, 0 )
	FullscreenPopupTemplate0.ButtonList:setDataSource( "FileshareOptionsDeleteButtonList" )
	FullscreenPopupTemplate0.WorkingTitle:setText( Engine.Localize( "MENU_FILESHARE_DELETING" ) )
	FullscreenPopupTemplate0.Title:setText( Engine.Localize( "MENU_FILESHARE_DELETE_PROMPT" ) )
	FullscreenPopupTemplate0.Subtitle:setText( Engine.Localize( "MENU_FILESHARE_DELETE_PROMPT_DESC" ) )
	FullscreenPopupTemplate0.DoneTitle:setText( Engine.Localize( "MENU_FILESHARE_DELETE_SUCCESS" ) )
	FullscreenPopupTemplate0.ErrorSubtitle:setText( Engine.Localize( "MENU_FILESHARE_DELETE_ERROR" ) )
	self:addElement( FullscreenPopupTemplate0 )
	self.FullscreenPopupTemplate0 = FullscreenPopupTemplate0
	
	local BG = LUI.UIImage.new()
	BG:setLeftRight( 0, 0, 145, 670 )
	BG:setTopBottom( 0, 0, 334, 769 )
	BG:setRGB( 0.4, 0.4, 0.4 )
	BG:setAlpha( FileshareShowDeleteOptionItem( 0.5 ) )
	self:addElement( BG )
	self.BG = BG
	
	local WCFileshareIconExtraCamRender = LUI.UIImage.new()
	WCFileshareIconExtraCamRender:setLeftRight( 0, 0, 145, 670 )
	WCFileshareIconExtraCamRender:setTopBottom( 1, 1, -746, -311 )
	WCFileshareIconExtraCamRender:setAlpha( FileshareShowDeleteOptionItem( 1 ) )
	WCFileshareIconExtraCamRender:subscribeToGlobalModel( controller, "FileshareSelectedItem", "fileId", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			WCFileshareIconExtraCamRender:setupWCFileshareIconExtraCamRender( GetFileshareExtraCamParameters( controller, modelValue ) )
		end
	end )
	self:addElement( WCFileshareIconExtraCamRender )
	self.WCFileshareIconExtraCamRender = WCFileshareIconExtraCamRender
	
	local WeaponNameBg = LUI.UIImage.new()
	WeaponNameBg:setLeftRight( 0, 0, 145, 670 )
	WeaponNameBg:setTopBottom( 0, 0, 723, 771 )
	WeaponNameBg:setRGB( 0, 0, 0 )
	WeaponNameBg:setAlpha( FileshareShowDeleteOptionItem( 0.8 ) )
	self:addElement( WeaponNameBg )
	self.WeaponNameBg = WeaponNameBg
	
	local WeaponName = LUI.UITightText.new()
	WeaponName:setLeftRight( 0, 0, 149, 670 )
	WeaponName:setTopBottom( 0, 0, 728, 766 )
	WeaponName:setAlpha( FileshareShowDeleteOptionItem( 1 ) )
	WeaponName:setTTF( "fonts/default.ttf" )
	WeaponName:subscribeToGlobalModel( controller, "FileshareSelectedItem", "weaponName", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			WeaponName:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( WeaponName )
	self.WeaponName = WeaponName
	
	local ItemNameBg = LUI.UIImage.new()
	ItemNameBg:setLeftRight( 0, 0, 145, 670 )
	ItemNameBg:setTopBottom( 0, 0, 674, 722 )
	ItemNameBg:setAlpha( FileshareShowDeleteOptionItem( 0.8 ) )
	self:addElement( ItemNameBg )
	self.ItemNameBg = ItemNameBg
	
	local ItemName = LUI.UITightText.new()
	ItemName:setLeftRight( 0, 0, 149, 670 )
	ItemName:setTopBottom( 0, 0, 675, 720 )
	ItemName:setRGB( 0, 0, 0 )
	ItemName:setAlpha( FileshareShowDeleteOptionItem( 1 ) )
	ItemName:setTTF( "fonts/default.ttf" )
	ItemName:subscribeToGlobalModel( controller, "FileshareSelectedItem", "fileName", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			ItemName:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( ItemName )
	self.ItemName = ItemName
	
	local buttons = CoD.fe_LeftContainer_NOTLobby.new( self, controller )
	buttons:setLeftRight( 0.5, 0.5, -811, -163 )
	buttons:setTopBottom( 0, 0, 798, 846 )
	self:addElement( buttons )
	self.buttons = buttons
	
	self:registerEventHandler( "fileshare_delete_success", function ( element, event )
		local retVal = nil
		FileshareDeleteDone( self, element, controller, "", self )
		if not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return retVal
	end )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, nil, function ( element, menu, controller, model )
		GoBack( self, controller )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "MENU_BACK", nil )
		return true
	end, false )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "", nil )
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
		menu = self
	} )
	if not self:restoreState() then
		self.FullscreenPopupTemplate0:processEvent( {
			name = "gain_focus",
			controller = controller
		} )
	end
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.FullscreenPopupTemplate0:close()
		self.buttons:close()
		self.WCFileshareIconExtraCamRender:close()
		self.WeaponName:close()
		self.ItemName:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "FileshareOptionsDelete.buttonPrompts" ) )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	return self
end

