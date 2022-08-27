-- 2a0f89a71f63406eda3ae90d10cbfe76
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.FileShare.SidePopup.FileshareSidePopupTemplate" )
require( "ui.uieditor.widgets.Footer.fe_footerRighSlideIn" )

LUI.createMenu.LocalScreenshotsOptions = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "LocalScreenshotsOptions" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "default"
	self:setOwner( controller )
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, true, 0, 0 )
	self:playSound( "menu_open", controller )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "LocalScreenshotsOptions.buttonPrompts" )
	local f1_local1 = self
	self.anyChildUsesUpdateState = true
	
	local Blackfade = LUI.UIImage.new()
	Blackfade:setLeftRight( true, true, -262, 11 )
	Blackfade:setTopBottom( true, false, 0, 720 )
	Blackfade:setRGB( 0, 0, 0 )
	Blackfade:setAlpha( 0.35 )
	self:addElement( Blackfade )
	self.Blackfade = Blackfade
	
	local FileshareSidePopupTemplate0 = CoD.FileshareSidePopupTemplate.new( f1_local1, controller )
	FileshareSidePopupTemplate0:setLeftRight( true, false, 903, 1280 )
	FileshareSidePopupTemplate0:setTopBottom( true, false, 0, 720 )
	FileshareSidePopupTemplate0.Title:setText( Engine.Localize( "MENU_OPTIONS" ) )
	FileshareSidePopupTemplate0.layout.List0:setDataSource( "ScreenshotsOptionsButtonList" )
	self:addElement( FileshareSidePopupTemplate0 )
	self.FileshareSidePopupTemplate0 = FileshareSidePopupTemplate0
	
	local fefooterRighSlideIn = CoD.fe_footerRighSlideIn.new( f1_local1, controller )
	fefooterRighSlideIn:setLeftRight( false, true, -464, -32 )
	fefooterRighSlideIn:setTopBottom( false, true, -75, -43 )
	self:addElement( fefooterRighSlideIn )
	self.fefooterRighSlideIn = fefooterRighSlideIn
	
	FileshareSidePopupTemplate0:linkToElementModel( FileshareSidePopupTemplate0.layout.List0, "hintText", true, function ( model )
		local hintText = Engine.GetModelValue( model )
		if hintText then
			FileshareSidePopupTemplate0.layout.hintText.ItemHintText:setText( Engine.Localize( hintText ) )
		end
	end )
	self:registerEventHandler( "fileshare_publish_success", function ( element, event )
		local f3_local0 = nil
		FileshareShowPublishSuccessToast( self, element, controller )
		Close( self, controller )
		if not f3_local0 then
			f3_local0 = element:dispatchEventToChildren( event )
		end
		return f3_local0
	end )
	self:registerEventHandler( "fileshare_delete_success", function ( element, event )
		local f4_local0 = nil
		FileshareShowDeleteSuccessToast( self, element, controller )
		FileshareDeleteDone( self, element, controller, "", f1_local1 )
		if not f4_local0 then
			f4_local0 = element:dispatchEventToChildren( event )
		end
		return f4_local0
	end )
	self:registerEventHandler( "fileshare_publish_failure", function ( element, event )
		local f5_local0 = nil
		FileshareShowErrorToast( self, element, controller )
		Close( self, controller )
		if not f5_local0 then
			f5_local0 = element:dispatchEventToChildren( event )
		end
		return f5_local0
	end )
	self:registerEventHandler( "fileshare_delete_failure", function ( element, event )
		local f6_local0 = nil
		FileshareShowErrorToast( self, element, controller )
		Close( self, controller )
		if not f6_local0 then
			f6_local0 = element:dispatchEventToChildren( event )
		end
		return f6_local0
	end )
	f1_local1:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, nil, function ( f7_arg0, f7_arg1, f7_arg2, f7_arg3 )
		Close( self, f7_arg2 )
		return true
	end, function ( f8_arg0, f8_arg1, f8_arg2 )
		CoD.Menu.SetButtonLabel( f8_arg1, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "MENU_CLOSE" )
		return true
	end, false )
	f1_local1:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_START, nil, function ( f9_arg0, f9_arg1, f9_arg2, f9_arg3 )
		Close( self, f9_arg2 )
		return true
	end, function ( f10_arg0, f10_arg1, f10_arg2 )
		CoD.Menu.SetButtonLabel( f10_arg1, Enum.LUIButton.LUI_KEY_START, "MENU_CLOSE1" )
		return true
	end, false )
	LUI.OverrideFunction_CallOriginalFirst( self, "close", function ( element )
		ClearSavedState( self, controller )
		PreserveThumbnails( controller, false )
	end )
	FileshareSidePopupTemplate0.id = "FileshareSidePopupTemplate0"
	fefooterRighSlideIn.buttons:setModel( self.buttonModel, controller )
	self:processEvent( {
		name = "menu_loaded",
		controller = controller
	} )
	self:processEvent( {
		name = "update_state",
		menu = f1_local1
	} )
	if not self:restoreState() then
		self.FileshareSidePopupTemplate0:processEvent( {
			name = "gain_focus",
			controller = controller
		} )
	end
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.FileshareSidePopupTemplate0:close()
		element.fefooterRighSlideIn:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "LocalScreenshotsOptions.buttonPrompts" ) )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	
	return self
end

