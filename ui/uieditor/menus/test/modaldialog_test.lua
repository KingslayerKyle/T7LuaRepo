-- eaeba9857e6fd26fc1257f7466c30ac0
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.GenericPopups.DialogBackground" )
require( "ui.uieditor.widgets.CAC.cac_ElemsSideList" )
require( "ui.uieditor.widgets.MenuSpecificWidgets.Scorestreaks.scorestreakVignetteContainer" )
require( "ui.uieditor.widgets.GenericPopups.DialogSpinner" )
require( "ui.uieditor.widgets.GenericPopups.ModalDialogItems" )
require( "ui.uieditor.widgets.GenericPopups.Generic_Lines_Pop_up" )

LUI.createMenu.ModalDialog_test = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "ModalDialog_test" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "default"
	self:setOwner( controller )
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, true, 0, 0 )
	self:playSound( "menu_open" )
	local f1_local1 = self
	self.anyChildUsesUpdateState = true
	
	local background = LUI.UIImage.new()
	background:setLeftRight( true, false, 0, 1280 )
	background:setTopBottom( true, false, 0, 720 )
	background:setRGB( 0.02, 0, 0 )
	background:setAlpha( 0.75 )
	background:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( background )
	self.background = background
	
	local BackgroundDarken = CoD.DialogBackground.new( f1_local1, controller )
	BackgroundDarken:setLeftRight( false, false, -640, 640 )
	BackgroundDarken:setTopBottom( false, false, -363, 360 )
	BackgroundDarken:setRGB( 0.4, 0.4, 0.4 )
	BackgroundDarken:setAlpha( 0.45 )
	self:addElement( BackgroundDarken )
	self.BackgroundDarken = BackgroundDarken
	
	local cacElemsSideList0 = CoD.cac_ElemsSideList.new( f1_local1, controller )
	cacElemsSideList0:setLeftRight( true, false, 386, 454 )
	cacElemsSideList0:setTopBottom( true, false, 35.5, 705.5 )
	cacElemsSideList0:setRGB( 1, 1, 1 )
	cacElemsSideList0:setAlpha( 0 )
	self:addElement( cacElemsSideList0 )
	self.cacElemsSideList0 = cacElemsSideList0
	
	local scorestreakVignetteContainer = CoD.scorestreakVignetteContainer.new( f1_local1, controller )
	scorestreakVignetteContainer:setLeftRight( true, false, 0, 1280 )
	scorestreakVignetteContainer:setTopBottom( true, false, 0, 720 )
	scorestreakVignetteContainer:setRGB( 1, 1, 1 )
	self:addElement( scorestreakVignetteContainer )
	self.scorestreakVignetteContainer = scorestreakVignetteContainer
	
	local Background = CoD.DialogBackground.new( f1_local1, controller )
	Background:setLeftRight( false, false, -212.5, 233 )
	Background:setTopBottom( false, false, -113, 100 )
	Background:setRGB( 0.05, 0.02, 0.02 )
	Background:setAlpha( 0.85 )
	self:addElement( Background )
	self.Background = Background
	
	local ProcessingSpinner = CoD.DialogSpinner.new( f1_local1, controller )
	ProcessingSpinner:setLeftRight( false, true, -704, -576 )
	ProcessingSpinner:setTopBottom( false, true, -424, -296 )
	ProcessingSpinner:setRGB( 1, 1, 1 )
	ProcessingSpinner:setAlpha( 0 )
	self:addElement( ProcessingSpinner )
	self.ProcessingSpinner = ProcessingSpinner
	
	local ProcessingText = LUI.UIText.new()
	ProcessingText:setLeftRight( true, true, 381.5, -381.5 )
	ProcessingText:setTopBottom( false, false, -93.5, -73.5 )
	ProcessingText:setRGB( 1, 1, 1 )
	ProcessingText:setAlpha( 0 )
	ProcessingText:setText( Engine.Localize( "GROUPS_PROCESSING_REQUEST" ) )
	ProcessingText:setTTF( "fonts/UnitedSansSmCdMd.ttf" )
	ProcessingText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	ProcessingText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( ProcessingText )
	self.ProcessingText = ProcessingText
	
	local WaitSpinner = CoD.DialogSpinner.new( f1_local1, controller )
	WaitSpinner:setLeftRight( false, true, -102, -64 )
	WaitSpinner:setTopBottom( false, true, -74, -36 )
	WaitSpinner:setRGB( 1, 1, 1 )
	WaitSpinner:setAlpha( 0 )
	self:addElement( WaitSpinner )
	self.WaitSpinner = WaitSpinner
	
	local WaitMessage = LUI.UIText.new()
	WaitMessage:setLeftRight( false, true, -367.5, -109 )
	WaitMessage:setTopBottom( false, true, -63, -47 )
	WaitMessage:setRGB( 1, 1, 1 )
	WaitMessage:setAlpha( 0 )
	WaitMessage:setText( Engine.Localize( "PLATFORM_PLEASEWAIT" ) )
	WaitMessage:setTTF( "fonts/UnitedSansSmCdMd.ttf" )
	WaitMessage:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_RIGHT )
	WaitMessage:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( WaitMessage )
	self.WaitMessage = WaitMessage
	
	local ModalDialogItems = CoD.ModalDialogItems.new( f1_local1, controller )
	ModalDialogItems:setLeftRight( false, false, -241.96, 241.96 )
	ModalDialogItems:setTopBottom( false, false, -100, 100 )
	ModalDialogItems:setRGB( 1, 1, 1 )
	self:addElement( ModalDialogItems )
	self.ModalDialogItems = ModalDialogItems
	
	local CategoryListLine = LUI.UIImage.new()
	CategoryListLine:setLeftRight( true, false, 454, 850 )
	CategoryListLine:setTopBottom( true, false, 418, 424 )
	CategoryListLine:setRGB( 0.9, 0.9, 0.9 )
	CategoryListLine:setAlpha( 0.85 )
	CategoryListLine:setImage( RegisterImage( "uie_t7_menu_cac_tabline" ) )
	CategoryListLine:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( CategoryListLine )
	self.CategoryListLine = CategoryListLine
	
	local CategoryListLine00 = LUI.UIImage.new()
	CategoryListLine00:setLeftRight( true, false, 425.5, 873.5 )
	CategoryListLine00:setTopBottom( true, false, 243.5, 249.5 )
	CategoryListLine00:setRGB( 0.9, 0.9, 0.9 )
	CategoryListLine00:setAlpha( 0.5 )
	CategoryListLine00:setImage( RegisterImage( "uie_t7_menu_cac_tabline" ) )
	CategoryListLine00:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( CategoryListLine00 )
	self.CategoryListLine00 = CategoryListLine00
	
	local CategoryListLine0 = LUI.UIImage.new()
	CategoryListLine0:setLeftRight( true, false, 425.5, 873.5 )
	CategoryListLine0:setTopBottom( true, false, 457, 463 )
	CategoryListLine0:setRGB( 0.9, 0.9, 0.9 )
	CategoryListLine0:setAlpha( 0.5 )
	CategoryListLine0:setImage( RegisterImage( "uie_t7_menu_cac_tabline" ) )
	CategoryListLine0:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( CategoryListLine0 )
	self.CategoryListLine0 = CategoryListLine0
	
	local emblemline200 = LUI.UIImage.new()
	emblemline200:setLeftRight( true, false, 424.5, 428.5 )
	emblemline200:setTopBottom( true, false, 244.5, 463 )
	emblemline200:setRGB( 1, 1, 1 )
	emblemline200:setAlpha( 0.39 )
	emblemline200:setImage( RegisterImage( "uie_t7_menu_frontend_featuredemblemline" ) )
	emblemline200:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( emblemline200 )
	self.emblemline200 = emblemline200
	
	local emblemline2000 = LUI.UIImage.new()
	emblemline2000:setLeftRight( true, false, 871.5, 875.5 )
	emblemline2000:setTopBottom( true, false, 244.5, 463 )
	emblemline2000:setRGB( 1, 1, 1 )
	emblemline2000:setAlpha( 0.39 )
	emblemline2000:setImage( RegisterImage( "uie_t7_menu_frontend_featuredemblemline" ) )
	emblemline2000:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( emblemline2000 )
	self.emblemline2000 = emblemline2000
	
	local GenericLinesPopup000 = CoD.Generic_Lines_Pop_up.new( f1_local1, controller )
	GenericLinesPopup000:setLeftRight( true, false, 401, 420 )
	GenericLinesPopup000:setTopBottom( true, false, 312, 364 )
	GenericLinesPopup000:setRGB( 1, 1, 1 )
	self:addElement( GenericLinesPopup000 )
	self.GenericLinesPopup000 = GenericLinesPopup000
	
	local GenericLinesPopup020 = CoD.Generic_Lines_Pop_up.new( f1_local1, controller )
	GenericLinesPopup020:setLeftRight( true, false, 882.5, 898.5 )
	GenericLinesPopup020:setTopBottom( true, false, 308, 360 )
	GenericLinesPopup020:setRGB( 1, 1, 1 )
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
	self.buttonPromptAddFunctions = {}
	self:registerEventHandler( "gamepad_button", function ( element, event )
		local f5_local0 = nil
		if not element:AcceptGamePadButtonInput( event ) or not event.down or event.simulated then
			return 
		elseif element:DoNavigationForGamePadButton( event ) then
			return true
		elseif not self.occludedBy and (event.button == "secondary" or event.button == "key_shortcut" and event.key == "ESCAPE") then
			ModalGoBack( self, element, controller )
		end
		if not f5_local0 then
			f5_local0 = element:dispatchEventToChildren( event )
		end
		return f5_local0
	end )
	ModalDialogItems.id = "ModalDialogItems"
	self:processEvent( {
		name = "menu_loaded",
		controller = controller
	} )
	self:processEvent( {
		name = "update_state",
		menu = f1_local1
	} )
	if not self:restoreState() then
		self.ModalDialogItems:processEvent( {
			name = "gain_focus",
			controller = controller
		} )
	end
	self.close = function ( f6_arg0 )
		f6_arg0.BackgroundDarken:close()
		f6_arg0.cacElemsSideList0:close()
		f6_arg0.scorestreakVignetteContainer:close()
		f6_arg0.Background:close()
		f6_arg0.ProcessingSpinner:close()
		f6_arg0.WaitSpinner:close()
		f6_arg0.ModalDialogItems:close()
		f6_arg0.GenericLinesPopup000:close()
		f6_arg0.GenericLinesPopup020:close()
		CoD.Menu.close( f6_arg0 )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	
	return self
end

