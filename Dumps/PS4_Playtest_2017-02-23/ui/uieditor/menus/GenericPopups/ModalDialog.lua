require( "ui.uieditor.widgets.CAC.cac_ElemsSideList" )
require( "ui.uieditor.widgets.GenericPopups.DialogBackground" )
require( "ui.uieditor.widgets.GenericPopups.DialogSpinner" )
require( "ui.uieditor.widgets.GenericPopups.Generic_Lines_Pop_up" )
require( "ui.uieditor.widgets.GenericPopups.ModalDialogItems" )
require( "ui.uieditor.widgets.MenuSpecificWidgets.Scorestreaks.scorestreakVignetteContainer" )

LUI.createMenu.ModalDialog = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "ModalDialog" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "default"
	self:setOwner( controller )
	self:setLeftRight( 0, 1, 0, 0 )
	self:setTopBottom( 0, 1, 0, 0 )
	self:playSound( "menu_open", controller )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "ModalDialog.buttonPrompts" )
	self.anyChildUsesUpdateState = true
	
	local BackgroundDarken = CoD.DialogBackground.new( self, controller )
	BackgroundDarken:setLeftRight( 0.5, 0.5, -960, 960 )
	BackgroundDarken:setTopBottom( 0.5, 0.5, -544, 540 )
	BackgroundDarken:setRGB( 0.4, 0.4, 0.4 )
	BackgroundDarken:setAlpha( 0.45 )
	self:addElement( BackgroundDarken )
	self.BackgroundDarken = BackgroundDarken
	
	local cacElemsSideList0 = CoD.cac_ElemsSideList.new( self, controller )
	cacElemsSideList0:setLeftRight( 0, 0, 579, 681 )
	cacElemsSideList0:setTopBottom( 0, 0, 53.5, 1058.5 )
	cacElemsSideList0:setAlpha( 0 )
	self:addElement( cacElemsSideList0 )
	self.cacElemsSideList0 = cacElemsSideList0
	
	local scorestreakVignetteContainer = CoD.scorestreakVignetteContainer.new( self, controller )
	scorestreakVignetteContainer:setLeftRight( 0, 0, 0, 1920 )
	scorestreakVignetteContainer:setTopBottom( 0, 0, 0, 1080 )
	self:addElement( scorestreakVignetteContainer )
	self.scorestreakVignetteContainer = scorestreakVignetteContainer
	
	local Background = CoD.DialogBackground.new( self, controller )
	Background:setLeftRight( 0.5, 0.5, -319, 349 )
	Background:setTopBottom( 0.5, 0.5, -170, 150 )
	Background:setRGB( 0.05, 0.02, 0.02 )
	Background:setAlpha( 0.85 )
	self:addElement( Background )
	self.Background = Background
	
	local ProcessingSpinner = CoD.DialogSpinner.new( self, controller )
	ProcessingSpinner:setLeftRight( 1, 1, -1056, -864 )
	ProcessingSpinner:setTopBottom( 1, 1, -636, -444 )
	ProcessingSpinner:setAlpha( 0 )
	self:addElement( ProcessingSpinner )
	self.ProcessingSpinner = ProcessingSpinner
	
	local ProcessingText = LUI.UIText.new()
	ProcessingText:setLeftRight( 0, 1, 572, -572 )
	ProcessingText:setTopBottom( 0.5, 0.5, -140, -110 )
	ProcessingText:setAlpha( 0 )
	ProcessingText:setText( Engine.Localize( "GROUPS_PROCESSING_REQUEST" ) )
	ProcessingText:setTTF( "fonts/UnitedSansSmCdMd.ttf" )
	ProcessingText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	ProcessingText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( ProcessingText )
	self.ProcessingText = ProcessingText
	
	local WaitSpinner = CoD.DialogSpinner.new( self, controller )
	WaitSpinner:setLeftRight( 1, 1, -153, -96 )
	WaitSpinner:setTopBottom( 1, 1, -111, -54 )
	WaitSpinner:setAlpha( 0 )
	self:addElement( WaitSpinner )
	self.WaitSpinner = WaitSpinner
	
	local WaitMessage = LUI.UIText.new()
	WaitMessage:setLeftRight( 1, 1, -551, -163 )
	WaitMessage:setTopBottom( 1, 1, -94, -70 )
	WaitMessage:setAlpha( 0 )
	WaitMessage:setText( Engine.Localize( "PLATFORM_PLEASEWAIT" ) )
	WaitMessage:setTTF( "fonts/UnitedSansSmCdMd.ttf" )
	WaitMessage:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_RIGHT )
	WaitMessage:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( WaitMessage )
	self.WaitMessage = WaitMessage
	
	local ModalDialogItems = CoD.ModalDialogItems.new( self, controller )
	ModalDialogItems:setLeftRight( 0.5, 0.5, -363, 363 )
	ModalDialogItems:setTopBottom( 0.5, 0.5, -150, 150 )
	self:addElement( ModalDialogItems )
	self.ModalDialogItems = ModalDialogItems
	
	local CategoryListLine = LUI.UIImage.new()
	CategoryListLine:setLeftRight( 0, 0, 681, 1275 )
	CategoryListLine:setTopBottom( 0, 0, 627, 636 )
	CategoryListLine:setRGB( 0.9, 0.9, 0.9 )
	CategoryListLine:setAlpha( 0.85 )
	CategoryListLine:setImage( RegisterImage( "uie_t7_menu_cac_tabline" ) )
	self:addElement( CategoryListLine )
	self.CategoryListLine = CategoryListLine
	
	local CategoryListLine00 = LUI.UIImage.new()
	CategoryListLine00:setLeftRight( 0, 0, 638, 1310 )
	CategoryListLine00:setTopBottom( 0, 0, 365, 374 )
	CategoryListLine00:setRGB( 0.9, 0.9, 0.9 )
	CategoryListLine00:setAlpha( 0.5 )
	CategoryListLine00:setImage( RegisterImage( "uie_t7_menu_cac_tabline" ) )
	self:addElement( CategoryListLine00 )
	self.CategoryListLine00 = CategoryListLine00
	
	local CategoryListLine0 = LUI.UIImage.new()
	CategoryListLine0:setLeftRight( 0, 0, 638, 1310 )
	CategoryListLine0:setTopBottom( 0, 0, 685, 694 )
	CategoryListLine0:setRGB( 0.9, 0.9, 0.9 )
	CategoryListLine0:setAlpha( 0.5 )
	CategoryListLine0:setImage( RegisterImage( "uie_t7_menu_cac_tabline" ) )
	self:addElement( CategoryListLine0 )
	self.CategoryListLine0 = CategoryListLine0
	
	local emblemline200 = LUI.UIImage.new()
	emblemline200:setLeftRight( 0, 0, 637, 643 )
	emblemline200:setTopBottom( 0, 0, 367, 695 )
	emblemline200:setAlpha( 0.39 )
	emblemline200:setImage( RegisterImage( "uie_t7_menu_frontend_featuredemblemline" ) )
	emblemline200:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( emblemline200 )
	self.emblemline200 = emblemline200
	
	local emblemline2000 = LUI.UIImage.new()
	emblemline2000:setLeftRight( 0, 0, 1307, 1313 )
	emblemline2000:setTopBottom( 0, 0, 367, 695 )
	emblemline2000:setAlpha( 0.39 )
	emblemline2000:setImage( RegisterImage( "uie_t7_menu_frontend_featuredemblemline" ) )
	emblemline2000:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( emblemline2000 )
	self.emblemline2000 = emblemline2000
	
	local GenericLinesPopup000 = CoD.Generic_Lines_Pop_up.new( self, controller )
	GenericLinesPopup000:setLeftRight( 0, 0, 596, 624 )
	GenericLinesPopup000:setTopBottom( 0, 0, 468, 546 )
	GenericLinesPopup000:setYRot( 199 )
	self:addElement( GenericLinesPopup000 )
	self.GenericLinesPopup000 = GenericLinesPopup000
	
	local GenericLinesPopup020 = CoD.Generic_Lines_Pop_up.new( self, controller )
	GenericLinesPopup020:setLeftRight( 0, 0, 1324, 1348 )
	GenericLinesPopup020:setTopBottom( 0, 0, 462, 540 )
	self:addElement( GenericLinesPopup020 )
	self.GenericLinesPopup020 = GenericLinesPopup020
	
	self.resetProperties = function ()
		BackgroundDarken:completeAnimation()
		WaitSpinner:completeAnimation()
		WaitMessage:completeAnimation()
		ProcessingSpinner:completeAnimation()
		ProcessingText:completeAnimation()
		BackgroundDarken:setAlpha( 0.45 )
		WaitSpinner:setAlpha( 0 )
		WaitMessage:setAlpha( 0 )
		ProcessingSpinner:setAlpha( 0 )
		ProcessingText:setAlpha( 0 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 0 )
			end
		},
		Waiting = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 3 )
				BackgroundDarken:completeAnimation()
				self.BackgroundDarken:setAlpha( 0.55 )
				self.clipFinished( BackgroundDarken, {} )
				WaitSpinner:completeAnimation()
				self.WaitSpinner:setAlpha( 1 )
				self.clipFinished( WaitSpinner, {} )
				WaitMessage:completeAnimation()
				self.WaitMessage:setAlpha( 1 )
				self.clipFinished( WaitMessage, {} )
			end
		},
		Processing = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 3 )
				BackgroundDarken:completeAnimation()
				self.BackgroundDarken:setAlpha( 0.55 )
				self.clipFinished( BackgroundDarken, {} )
				ProcessingSpinner:completeAnimation()
				self.ProcessingSpinner:setAlpha( 1 )
				self.clipFinished( ProcessingSpinner, {} )
				ProcessingText:completeAnimation()
				self.ProcessingText:setAlpha( 0.9 )
				self.clipFinished( ProcessingText, {} )
			end
		}
	}
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, nil, function ( element, menu, controller, model )
		ModalGoBack( self, element, controller )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "", nil )
		return false
	end, false )
	ModalDialogItems.id = "ModalDialogItems"
	self:processEvent( {
		name = "menu_loaded",
		controller = controller
	} )
	self:processEvent( {
		name = "update_state",
		menu = self
	} )
	if not self:restoreState() then
		self.ModalDialogItems:processEvent( {
			name = "gain_focus",
			controller = controller
		} )
	end
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.BackgroundDarken:close()
		self.cacElemsSideList0:close()
		self.scorestreakVignetteContainer:close()
		self.Background:close()
		self.ProcessingSpinner:close()
		self.WaitSpinner:close()
		self.ModalDialogItems:close()
		self.GenericLinesPopup000:close()
		self.GenericLinesPopup020:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "ModalDialog.buttonPrompts" ) )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	return self
end

