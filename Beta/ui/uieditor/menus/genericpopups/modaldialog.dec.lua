require( "ui.uieditor.widgets.GenericPopups.DialogBackground" )
require( "ui.uieditor.widgets.CAC.cac_ElemsSideList" )
require( "ui.uieditor.widgets.MenuSpecificWidgets.Scorestreaks.scorestreakVignetteContainer" )
require( "ui.uieditor.widgets.GenericPopups.DialogSpinner" )
require( "ui.uieditor.widgets.GenericPopups.ModalDialogItems" )
require( "ui.uieditor.widgets.GenericPopups.Generic_Lines_Pop_up" )

LUI.createMenu.ModalDialog = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "ModalDialog" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "default"
	self:setOwner( controller )
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, true, 0, 0 )
	self:playSound( "menu_open" )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "ModalDialog.buttonPrompts" )
	local menu = self
	self.anyChildUsesUpdateState = true
	
	local BackgroundDarken = CoD.DialogBackground.new( menu, controller )
	BackgroundDarken:setLeftRight( false, false, -640, 640 )
	BackgroundDarken:setTopBottom( false, false, -363, 360 )
	BackgroundDarken:setRGB( 0.4, 0.4, 0.4 )
	BackgroundDarken:setAlpha( 0.45 )
	self:addElement( BackgroundDarken )
	self.BackgroundDarken = BackgroundDarken
	
	local cacElemsSideList0 = CoD.cac_ElemsSideList.new( menu, controller )
	cacElemsSideList0:setLeftRight( true, false, 386, 454 )
	cacElemsSideList0:setTopBottom( true, false, 35.5, 705.5 )
	cacElemsSideList0:setAlpha( 0 )
	self:addElement( cacElemsSideList0 )
	self.cacElemsSideList0 = cacElemsSideList0
	
	local scorestreakVignetteContainer = CoD.scorestreakVignetteContainer.new( menu, controller )
	scorestreakVignetteContainer:setLeftRight( true, false, 0, 1280 )
	scorestreakVignetteContainer:setTopBottom( true, false, 0, 720 )
	self:addElement( scorestreakVignetteContainer )
	self.scorestreakVignetteContainer = scorestreakVignetteContainer
	
	local Background = CoD.DialogBackground.new( menu, controller )
	Background:setLeftRight( false, false, -212.5, 233 )
	Background:setTopBottom( false, false, -113, 100 )
	Background:setRGB( 0.05, 0.02, 0.02 )
	Background:setAlpha( 0.85 )
	self:addElement( Background )
	self.Background = Background
	
	local ProcessingSpinner = CoD.DialogSpinner.new( menu, controller )
	ProcessingSpinner:setLeftRight( false, true, -704, -576 )
	ProcessingSpinner:setTopBottom( false, true, -424, -296 )
	ProcessingSpinner:setAlpha( 0 )
	self:addElement( ProcessingSpinner )
	self.ProcessingSpinner = ProcessingSpinner
	
	local ProcessingText = LUI.UIText.new()
	ProcessingText:setLeftRight( true, true, 381.5, -381.5 )
	ProcessingText:setTopBottom( false, false, -93.5, -73.5 )
	ProcessingText:setAlpha( 0 )
	ProcessingText:setText( Engine.Localize( "GROUPS_PROCESSING_REQUEST" ) )
	ProcessingText:setTTF( "fonts/UnitedSansSmCdMd.ttf" )
	ProcessingText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	ProcessingText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( ProcessingText )
	self.ProcessingText = ProcessingText
	
	local WaitSpinner = CoD.DialogSpinner.new( menu, controller )
	WaitSpinner:setLeftRight( false, true, -102, -64 )
	WaitSpinner:setTopBottom( false, true, -74, -36 )
	WaitSpinner:setAlpha( 0 )
	self:addElement( WaitSpinner )
	self.WaitSpinner = WaitSpinner
	
	local WaitMessage = LUI.UIText.new()
	WaitMessage:setLeftRight( false, true, -367.5, -109 )
	WaitMessage:setTopBottom( false, true, -63, -47 )
	WaitMessage:setAlpha( 0 )
	WaitMessage:setText( Engine.Localize( "PLATFORM_PLEASEWAIT" ) )
	WaitMessage:setTTF( "fonts/UnitedSansSmCdMd.ttf" )
	WaitMessage:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_RIGHT )
	WaitMessage:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( WaitMessage )
	self.WaitMessage = WaitMessage
	
	local ModalDialogItems = CoD.ModalDialogItems.new( menu, controller )
	ModalDialogItems:setLeftRight( false, false, -241.96, 241.96 )
	ModalDialogItems:setTopBottom( false, false, -100, 100 )
	self:addElement( ModalDialogItems )
	self.ModalDialogItems = ModalDialogItems
	
	local CategoryListLine = LUI.UIImage.new()
	CategoryListLine:setLeftRight( true, false, 454, 850 )
	CategoryListLine:setTopBottom( true, false, 418, 424 )
	CategoryListLine:setRGB( 0.9, 0.9, 0.9 )
	CategoryListLine:setAlpha( 0.85 )
	CategoryListLine:setImage( RegisterImage( "uie_t7_menu_cac_tabline" ) )
	self:addElement( CategoryListLine )
	self.CategoryListLine = CategoryListLine
	
	local CategoryListLine00 = LUI.UIImage.new()
	CategoryListLine00:setLeftRight( true, false, 425.5, 873.5 )
	CategoryListLine00:setTopBottom( true, false, 243.5, 249.5 )
	CategoryListLine00:setRGB( 0.9, 0.9, 0.9 )
	CategoryListLine00:setAlpha( 0.5 )
	CategoryListLine00:setImage( RegisterImage( "uie_t7_menu_cac_tabline" ) )
	self:addElement( CategoryListLine00 )
	self.CategoryListLine00 = CategoryListLine00
	
	local CategoryListLine0 = LUI.UIImage.new()
	CategoryListLine0:setLeftRight( true, false, 425.5, 873.5 )
	CategoryListLine0:setTopBottom( true, false, 457, 463 )
	CategoryListLine0:setRGB( 0.9, 0.9, 0.9 )
	CategoryListLine0:setAlpha( 0.5 )
	CategoryListLine0:setImage( RegisterImage( "uie_t7_menu_cac_tabline" ) )
	self:addElement( CategoryListLine0 )
	self.CategoryListLine0 = CategoryListLine0
	
	local emblemline200 = LUI.UIImage.new()
	emblemline200:setLeftRight( true, false, 424.5, 428.5 )
	emblemline200:setTopBottom( true, false, 244.5, 463 )
	emblemline200:setAlpha( 0.39 )
	emblemline200:setImage( RegisterImage( "uie_t7_menu_frontend_featuredemblemline" ) )
	emblemline200:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( emblemline200 )
	self.emblemline200 = emblemline200
	
	local emblemline2000 = LUI.UIImage.new()
	emblemline2000:setLeftRight( true, false, 871.5, 875.5 )
	emblemline2000:setTopBottom( true, false, 244.5, 463 )
	emblemline2000:setAlpha( 0.39 )
	emblemline2000:setImage( RegisterImage( "uie_t7_menu_frontend_featuredemblemline" ) )
	emblemline2000:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( emblemline2000 )
	self.emblemline2000 = emblemline2000
	
	local GenericLinesPopup000 = CoD.Generic_Lines_Pop_up.new( menu, controller )
	GenericLinesPopup000:setLeftRight( true, false, 397, 416 )
	GenericLinesPopup000:setTopBottom( true, false, 312, 364 )
	GenericLinesPopup000:setYRot( 199 )
	self:addElement( GenericLinesPopup000 )
	self.GenericLinesPopup000 = GenericLinesPopup000
	
	local GenericLinesPopup020 = CoD.Generic_Lines_Pop_up.new( menu, controller )
	GenericLinesPopup020:setLeftRight( true, false, 882.5, 898.5 )
	GenericLinesPopup020:setTopBottom( true, false, 308, 360 )
	self:addElement( GenericLinesPopup020 )
	self.GenericLinesPopup020 = GenericLinesPopup020
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 4 )
				ProcessingSpinner:completeAnimation()
				self.ProcessingSpinner:setAlpha( 0 )
				self.clipFinished( ProcessingSpinner, {} )
				ProcessingText:completeAnimation()
				self.ProcessingText:setAlpha( 0 )
				self.clipFinished( ProcessingText, {} )
				WaitSpinner:completeAnimation()
				self.WaitSpinner:setAlpha( 0 )
				self.clipFinished( WaitSpinner, {} )
				WaitMessage:completeAnimation()
				self.WaitMessage:setAlpha( 0 )
				self.clipFinished( WaitMessage, {} )
			end
		},
		Waiting = {
			DefaultClip = function ()
				self:setupElementClipCounter( 5 )
				BackgroundDarken:completeAnimation()
				self.BackgroundDarken:setAlpha( 0.55 )
				self.clipFinished( BackgroundDarken, {} )
				ProcessingSpinner:completeAnimation()
				self.ProcessingSpinner:setAlpha( 0 )
				self.clipFinished( ProcessingSpinner, {} )
				ProcessingText:completeAnimation()
				self.ProcessingText:setAlpha( 0 )
				self.clipFinished( ProcessingText, {} )
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
				self:setupElementClipCounter( 5 )
				BackgroundDarken:completeAnimation()
				self.BackgroundDarken:setAlpha( 0.55 )
				self.clipFinished( BackgroundDarken, {} )
				ProcessingSpinner:completeAnimation()
				self.ProcessingSpinner:setAlpha( 1 )
				self.clipFinished( ProcessingSpinner, {} )
				ProcessingText:completeAnimation()
				self.ProcessingText:setAlpha( 0.9 )
				self.clipFinished( ProcessingText, {} )
				WaitSpinner:completeAnimation()
				self.WaitSpinner:setAlpha( 0 )
				self.clipFinished( WaitSpinner, {} )
				WaitMessage:completeAnimation()
				self.WaitMessage:setAlpha( 0 )
				self.clipFinished( WaitMessage, {} )
			end
		}
	}
	menu:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, nil, function ( element, menu, controller, model )
		ModalGoBack( self, element, controller )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "" )
		return false
	end, false )
	ModalDialogItems.id = "ModalDialogItems"
	self:processEvent( {
		name = "menu_loaded",
		controller = controller
	} )
	self:processEvent( {
		name = "update_state",
		menu = menu
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

