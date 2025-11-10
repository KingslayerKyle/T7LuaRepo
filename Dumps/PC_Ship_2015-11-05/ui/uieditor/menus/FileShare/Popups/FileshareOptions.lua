require( "ui.uieditor.widgets.FileShare.SidePopup.FileshareSidePopupTemplate" )
require( "ui.uieditor.widgets.Footer.fe_footerRighSlideIn" )

local PreLoadFunc = function ( self, controller )
	self.animateInFromOffset = 355
end

LUI.createMenu.FileshareOptions = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "FileshareOptions" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "default"
	self:setOwner( controller )
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, true, 0, 0 )
	self:playSound( "menu_open", controller )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "FileshareOptions.buttonPrompts" )
	self.anyChildUsesUpdateState = true
	
	local Blackfade = LUI.UIImage.new()
	Blackfade:setLeftRight( true, true, -262, 11 )
	Blackfade:setTopBottom( true, false, 0, 720 )
	Blackfade:setRGB( 0, 0, 0 )
	Blackfade:setAlpha( 0.35 )
	self:addElement( Blackfade )
	self.Blackfade = Blackfade
	
	local FileshareSidePopupTemplate0 = CoD.FileshareSidePopupTemplate.new( self, controller )
	FileshareSidePopupTemplate0:setLeftRight( true, false, 903, 1280 )
	FileshareSidePopupTemplate0:setTopBottom( true, false, 0, 720 )
	FileshareSidePopupTemplate0.Title:setText( Engine.Localize( "MENU_OPTIONS" ) )
	FileshareSidePopupTemplate0.layout.List0:setDataSource( "FileshareOptionsButtonList" )
	self:addElement( FileshareSidePopupTemplate0 )
	self.FileshareSidePopupTemplate0 = FileshareSidePopupTemplate0
	
	local fefooterRighSlideIn = CoD.fe_footerRighSlideIn.new( self, controller )
	fefooterRighSlideIn:setLeftRight( false, true, -464, -32 )
	fefooterRighSlideIn:setTopBottom( false, true, -75, -43 )
	self:addElement( fefooterRighSlideIn )
	self.fefooterRighSlideIn = fefooterRighSlideIn
	
	FileshareSidePopupTemplate0:linkToElementModel( FileshareSidePopupTemplate0.layout.List0, "hintText", true, function ( model )
		local hintText = Engine.GetModelValue( model )
		if hintText then
			FileshareSidePopupTemplate0.layout.description:setText( Engine.Localize( hintText ) )
		end
	end )
	self:registerEventHandler( "like_submitted_success", function ( self, event )
		local f4_local0 = nil
		FileshareLikeVoteSuccessHandler( self, controller, event )
		Close( self, controller )
		if not f4_local0 then
			f4_local0 = self:dispatchEventToChildren( event )
		end
		return f4_local0
	end )
	self:registerEventHandler( "dislike_submitted_success", function ( self, event )
		local f5_local0 = nil
		FileshareDisikeVoteSuccessHandler( self, controller, event )
		Close( self, controller )
		if not f5_local0 then
			f5_local0 = self:dispatchEventToChildren( event )
		end
		return f5_local0
	end )
	self:registerEventHandler( "vote_submitted_failure", function ( self, event )
		local f6_local0 = nil
		FileshareShowErrorToast( self, self, controller )
		Close( self, controller )
		if not f6_local0 then
			f6_local0 = self:dispatchEventToChildren( event )
		end
		return f6_local0
	end )
	self:registerEventHandler( "fileshare_download_success", function ( self, event )
		local f7_local0 = nil
		FileshareShowDownloadSuccessToast( self, self, controller )
		Close( self, controller )
		if not f7_local0 then
			f7_local0 = self:dispatchEventToChildren( event )
		end
		return f7_local0
	end )
	self:registerEventHandler( "fileshare_publish_success", function ( self, event )
		local f8_local0 = nil
		FileshareShowPublishSuccessToast( self, self, controller )
		Close( self, controller )
		if not f8_local0 then
			f8_local0 = self:dispatchEventToChildren( event )
		end
		return f8_local0
	end )
	self:registerEventHandler( "fileshare_delete_success", function ( self, event )
		local f9_local0 = nil
		FileshareShowDeleteSuccessToast( self, self, controller )
		if not f9_local0 then
			f9_local0 = self:dispatchEventToChildren( event )
		end
		return f9_local0
	end )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, nil, function ( element, menu, controller, model )
		Close( self, controller )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "MENU_BACK" )
		return true
	end, false )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_START, nil, function ( element, menu, controller, model )
		Close( self, controller )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_START, "" )
		return false
	end, false )
	LUI.OverrideFunction_CallOriginalFirst( self, "close", function ( element )
		ClearSavedState( self, controller )
	end )
	FileshareSidePopupTemplate0.id = "FileshareSidePopupTemplate0"
	fefooterRighSlideIn.buttons:setModel( self.buttonModel, controller )
	self:processEvent( {
		name = "menu_loaded",
		controller = controller
	} )
	self:processEvent( {
		name = "update_state",
		menu = self
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
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "FileshareOptions.buttonPrompts" ) )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	
	return self
end

