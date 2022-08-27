-- cc6e13361a82d551fbbba454f2a3cdbe
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.FileShare.FullscreenPopup.FullscreenPopupTemplate" )

local PreLoadFunc = function ( self, controller )
	self:setModel( CoD.perController[controller].selectedpaintjobModel )
end

LUI.createMenu.PaintjobClearConfirmation = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "PaintjobClearConfirmation" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "default"
	self:setOwner( controller )
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, true, 0, 0 )
	self:playSound( "menu_open", controller )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "PaintjobClearConfirmation.buttonPrompts" )
	local f2_local1 = self
	self.anyChildUsesUpdateState = true
	
	local FullscreenPopupTemplate0 = CoD.FullscreenPopupTemplate.new( f2_local1, controller )
	FullscreenPopupTemplate0:setLeftRight( true, false, 0, 1280 )
	FullscreenPopupTemplate0:setTopBottom( true, false, 0, 720 )
	FullscreenPopupTemplate0.RedLine:setRGB( 1, 0, 0 )
	FullscreenPopupTemplate0.Title:setText( Engine.Localize( "MENU_PAINTJOB_DELETE_CONFIRMATION" ) )
	FullscreenPopupTemplate0.ButtonList:setDataSource( "PaintjobOptionsClearButtonList" )
	FullscreenPopupTemplate0.Subtitle:setText( Engine.Localize( "MENU_CANNOT_UNDO" ) )
	FullscreenPopupTemplate0.WorkingTitle:setText( Engine.Localize( "MENU_NEW" ) )
	FullscreenPopupTemplate0.DoneTitle:setText( Engine.Localize( "MENU_NEW" ) )
	FullscreenPopupTemplate0.ErrorSubtitle:setText( Engine.Localize( "MENU_NEW" ) )
	self:addElement( FullscreenPopupTemplate0 )
	self.FullscreenPopupTemplate0 = FullscreenPopupTemplate0
	
	FullscreenPopupTemplate0.id = "FullscreenPopupTemplate0"
	self:processEvent( {
		name = "menu_loaded",
		controller = controller
	} )
	self:processEvent( {
		name = "update_state",
		menu = f2_local1
	} )
	if not self:restoreState() then
		self.FullscreenPopupTemplate0:processEvent( {
			name = "gain_focus",
			controller = controller
		} )
	end
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.FullscreenPopupTemplate0:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "PaintjobClearConfirmation.buttonPrompts" ) )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	
	return self
end

