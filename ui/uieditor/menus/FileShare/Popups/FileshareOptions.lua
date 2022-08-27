-- 4ad1111bc4bb3f5c3d56f2efe1312b4d
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.FileShare.SidePopup.FileshareSidePopupTemplate" )
require( "ui.uieditor.widgets.Footer.fe_footerRighSlideIn" )

local PreLoadFunc = function ( self, controller )
	self.animateInFromOffset = 355
end

local PostLoadFunc = function ( f2_arg0, f2_arg1 )
	f2_arg0.originalOcclusionChange = f2_arg0.m_eventHandlers.occlusion_change
	f2_arg0:registerEventHandler( "occlusion_change", function ( element, event )
		if not event.occluded and element.occludedMenu and element.occludedMenu.menuName == "Theater_SelectFilm" and element.occludedBy and element.occludedBy.menuName == "Fileshare_ShowcaseManager" then
			element.occludedMenu:processEvent( {
				name = "occlusion_change",
				occluded = false,
				occludedBy = element
			} )
		end
		element:originalOcclusionChange( event )
	end )
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
	local f4_local1 = self
	self.anyChildUsesUpdateState = true
	
	local Blackfade = LUI.UIImage.new()
	Blackfade:setLeftRight( true, true, -262, 11 )
	Blackfade:setTopBottom( true, false, 0, 720 )
	Blackfade:setRGB( 0, 0, 0 )
	Blackfade:setAlpha( 0.35 )
	self:addElement( Blackfade )
	self.Blackfade = Blackfade
	
	local FileshareSidePopupTemplate0 = CoD.FileshareSidePopupTemplate.new( f4_local1, controller )
	FileshareSidePopupTemplate0:setLeftRight( true, false, 903, 1280 )
	FileshareSidePopupTemplate0:setTopBottom( true, false, 0, 720 )
	FileshareSidePopupTemplate0.Title:setText( Engine.Localize( "MENU_OPTIONS" ) )
	FileshareSidePopupTemplate0.layout.List0:setDataSource( "FileshareOptionsButtonList" )
	self:addElement( FileshareSidePopupTemplate0 )
	self.FileshareSidePopupTemplate0 = FileshareSidePopupTemplate0
	
	local fefooterRighSlideIn = CoD.fe_footerRighSlideIn.new( f4_local1, controller )
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
	self:registerEventHandler( "like_submitted_success", function ( element, event )
		local f6_local0 = nil
		FileshareLikeVoteSuccessHandler( self, controller, event )
		Close( self, controller )
		if not f6_local0 then
			f6_local0 = element:dispatchEventToChildren( event )
		end
		return f6_local0
	end )
	self:registerEventHandler( "dislike_submitted_success", function ( element, event )
		local f7_local0 = nil
		FileshareDisikeVoteSuccessHandler( self, controller, event )
		Close( self, controller )
		if not f7_local0 then
			f7_local0 = element:dispatchEventToChildren( event )
		end
		return f7_local0
	end )
	self:registerEventHandler( "vote_submitted_failure", function ( element, event )
		local f8_local0 = nil
		FileshareShowErrorToast( self, element, controller )
		Close( self, controller )
		if not f8_local0 then
			f8_local0 = element:dispatchEventToChildren( event )
		end
		return f8_local0
	end )
	self:registerEventHandler( "fileshare_publish_success", function ( element, event )
		local f9_local0 = nil
		Close( self, controller )
		if not f9_local0 then
			f9_local0 = element:dispatchEventToChildren( event )
		end
		return f9_local0
	end )
	self:registerEventHandler( "fileshare_delete_success", function ( element, event )
		local f10_local0 = nil
		FileshareShowDeleteSuccessToast( self, element, controller )
		FileshareDeleteDone( self, element, controller, "", f4_local1 )
		if not f10_local0 then
			f10_local0 = element:dispatchEventToChildren( event )
		end
		return f10_local0
	end )
	self:registerEventHandler( "fileshare_copy_success", function ( element, event )
		local f11_local0 = nil
		FileshareShowDownloadSuccessToast( self, element, controller )
		if not f11_local0 then
			f11_local0 = element:dispatchEventToChildren( event )
		end
		return f11_local0
	end )
	self:registerEventHandler( "fileshare_copy_failure", function ( element, event )
		local f12_local0 = nil
		FileshareShowErrorToast( self, element, controller )
		if not f12_local0 then
			f12_local0 = element:dispatchEventToChildren( event )
		end
		return f12_local0
	end )
	f4_local1:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, nil, function ( f13_arg0, f13_arg1, f13_arg2, f13_arg3 )
		Close( self, f13_arg2 )
		return true
	end, function ( f14_arg0, f14_arg1, f14_arg2 )
		CoD.Menu.SetButtonLabel( f14_arg1, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "MENU_BACK" )
		return true
	end, false )
	f4_local1:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_START, nil, function ( f15_arg0, f15_arg1, f15_arg2, f15_arg3 )
		Close( self, f15_arg2 )
		return true
	end, function ( f16_arg0, f16_arg1, f16_arg2 )
		CoD.Menu.SetButtonLabel( f16_arg1, Enum.LUIButton.LUI_KEY_START, "" )
		return false
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
		menu = f4_local1
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

