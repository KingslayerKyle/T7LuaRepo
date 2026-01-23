require( "ui.uieditor.widgets.GenericPopups.DialogBackground" )
require( "ui.uieditor.widgets.CAC.cac_ElemsSideList" )
require( "ui.uieditor.widgets.MenuSpecificWidgets.Scorestreaks.scorestreakVignetteContainer" )
require( "ui.uieditor.widgets.GenericPopups.DialogSpinner" )
require( "ui.uieditor.widgets.GenericPopups.Generic_Lines_Pop_up" )
require( "ui.uieditor.widgets.Footer.fe_LeftContainer" )

LUI.createMenu.OverwriteProgressWarning = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "OverwriteProgressWarning" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "default"
	self:setOwner( controller )
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, true, 0, 0 )
	self:playSound( "menu_open", controller )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "OverwriteProgressWarning.buttonPrompts" )
	self.anyChildUsesUpdateState = true
	
	local BackgroundDarken = CoD.DialogBackground.new( self, controller )
	BackgroundDarken:setLeftRight( true, true, 0, 0 )
	BackgroundDarken:setTopBottom( true, true, -3, 0 )
	BackgroundDarken:setRGB( 0.4, 0.4, 0.4 )
	BackgroundDarken:setAlpha( 0.8 )
	self:addElement( BackgroundDarken )
	self.BackgroundDarken = BackgroundDarken
	
	local cacElemsSideList0 = CoD.cac_ElemsSideList.new( self, controller )
	cacElemsSideList0:setLeftRight( false, false, -254, -186 )
	cacElemsSideList0:setTopBottom( true, false, 35.5, 705.5 )
	cacElemsSideList0:setAlpha( 0 )
	self:addElement( cacElemsSideList0 )
	self.cacElemsSideList0 = cacElemsSideList0
	
	local scorestreakVignetteContainer = CoD.scorestreakVignetteContainer.new( self, controller )
	scorestreakVignetteContainer:setLeftRight( true, true, 0, 0 )
	scorestreakVignetteContainer:setTopBottom( true, true, 0, 0 )
	self:addElement( scorestreakVignetteContainer )
	self.scorestreakVignetteContainer = scorestreakVignetteContainer
	
	local Background = CoD.DialogBackground.new( self, controller )
	Background:setLeftRight( false, false, -212.5, 233 )
	Background:setTopBottom( false, false, -113, 100 )
	Background:setRGB( 0.05, 0.02, 0.02 )
	Background:setAlpha( 0.85 )
	self:addElement( Background )
	self.Background = Background
	
	local ProcessingSpinner = CoD.DialogSpinner.new( self, controller )
	ProcessingSpinner:setLeftRight( false, false, -64, 64 )
	ProcessingSpinner:setTopBottom( true, false, 296, 424 )
	ProcessingSpinner:setAlpha( 0 )
	self:addElement( ProcessingSpinner )
	self.ProcessingSpinner = ProcessingSpinner
	
	local ProcessingText = LUI.UIText.new()
	ProcessingText:setLeftRight( false, false, -258.5, 258.5 )
	ProcessingText:setTopBottom( true, false, 266.5, 286.5 )
	ProcessingText:setAlpha( 0 )
	ProcessingText:setText( Engine.Localize( "GROUPS_PROCESSING_REQUEST" ) )
	ProcessingText:setTTF( "fonts/UnitedSansSmCdMd.ttf" )
	ProcessingText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	ProcessingText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( ProcessingText )
	self.ProcessingText = ProcessingText
	
	local WaitSpinner = CoD.DialogSpinner.new( self, controller )
	WaitSpinner:setLeftRight( false, false, 538, 576 )
	WaitSpinner:setTopBottom( true, false, 646, 684 )
	WaitSpinner:setAlpha( 0 )
	self:addElement( WaitSpinner )
	self.WaitSpinner = WaitSpinner
	
	local WaitMessage = LUI.UIText.new()
	WaitMessage:setLeftRight( false, false, 272.5, 531 )
	WaitMessage:setTopBottom( true, false, 657, 673 )
	WaitMessage:setAlpha( 0 )
	WaitMessage:setText( Engine.Localize( "PLATFORM_PLEASEWAIT" ) )
	WaitMessage:setTTF( "fonts/UnitedSansSmCdMd.ttf" )
	WaitMessage:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_RIGHT )
	WaitMessage:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( WaitMessage )
	self.WaitMessage = WaitMessage
	
	local CategoryListLine = LUI.UIImage.new()
	CategoryListLine:setLeftRight( false, false, -186, 210 )
	CategoryListLine:setTopBottom( true, false, 418, 424 )
	CategoryListLine:setRGB( 0.9, 0.9, 0.9 )
	CategoryListLine:setAlpha( 0.85 )
	CategoryListLine:setImage( RegisterImage( "uie_t7_menu_cac_tabline" ) )
	self:addElement( CategoryListLine )
	self.CategoryListLine = CategoryListLine
	
	local CategoryListLine00 = LUI.UIImage.new()
	CategoryListLine00:setLeftRight( false, false, -214.5, 233.5 )
	CategoryListLine00:setTopBottom( true, false, 243.5, 249.5 )
	CategoryListLine00:setRGB( 0.9, 0.9, 0.9 )
	CategoryListLine00:setAlpha( 0.5 )
	CategoryListLine00:setImage( RegisterImage( "uie_t7_menu_cac_tabline" ) )
	self:addElement( CategoryListLine00 )
	self.CategoryListLine00 = CategoryListLine00
	
	local CategoryListLine0 = LUI.UIImage.new()
	CategoryListLine0:setLeftRight( false, false, -214.5, 233.5 )
	CategoryListLine0:setTopBottom( true, false, 457, 463 )
	CategoryListLine0:setRGB( 0.9, 0.9, 0.9 )
	CategoryListLine0:setAlpha( 0.5 )
	CategoryListLine0:setImage( RegisterImage( "uie_t7_menu_cac_tabline" ) )
	self:addElement( CategoryListLine0 )
	self.CategoryListLine0 = CategoryListLine0
	
	local emblemline200 = LUI.UIImage.new()
	emblemline200:setLeftRight( false, false, -215.5, -211.5 )
	emblemline200:setTopBottom( true, false, 244.5, 463 )
	emblemline200:setAlpha( 0.39 )
	emblemline200:setImage( RegisterImage( "uie_t7_menu_frontend_featuredemblemline" ) )
	emblemline200:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( emblemline200 )
	self.emblemline200 = emblemline200
	
	local emblemline2000 = LUI.UIImage.new()
	emblemline2000:setLeftRight( false, false, 231.5, 235.5 )
	emblemline2000:setTopBottom( true, false, 244.5, 463 )
	emblemline2000:setAlpha( 0.39 )
	emblemline2000:setImage( RegisterImage( "uie_t7_menu_frontend_featuredemblemline" ) )
	emblemline2000:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( emblemline2000 )
	self.emblemline2000 = emblemline2000
	
	local GenericLinesPopup000 = CoD.Generic_Lines_Pop_up.new( self, controller )
	GenericLinesPopup000:setLeftRight( false, false, -243, -224 )
	GenericLinesPopup000:setTopBottom( true, false, 312, 364 )
	GenericLinesPopup000:setYRot( 199 )
	self:addElement( GenericLinesPopup000 )
	self.GenericLinesPopup000 = GenericLinesPopup000
	
	local GenericLinesPopup020 = CoD.Generic_Lines_Pop_up.new( self, controller )
	GenericLinesPopup020:setLeftRight( false, false, 242.5, 258.5 )
	GenericLinesPopup020:setTopBottom( true, false, 308, 360 )
	self:addElement( GenericLinesPopup020 )
	self.GenericLinesPopup020 = GenericLinesPopup020
	
	local Title = LUI.UIText.new()
	Title:setLeftRight( false, false, -186, 210 )
	Title:setTopBottom( true, false, 260, 296 )
	Title:setRGB( 0.87, 0.88, 0.78 )
	Title:setText( Engine.Localize( "CP_SH_CAIRO_RESTART_MISSION_TITLE" ) )
	Title:setTTF( "fonts/escom.ttf" )
	Title:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	Title:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( Title )
	self.Title = Title
	
	local Subtitle = LUI.UIText.new()
	Subtitle:setLeftRight( false, false, -186, 210 )
	Subtitle:setTopBottom( true, false, 310, 330 )
	Subtitle:setAlpha( 0.9 )
	Subtitle:setText( Engine.Localize( "CP_SH_CAIRO_RESTART_MISSION_TEXT" ) )
	Subtitle:setTTF( "fonts/UnitedSansSmCdMd.ttf" )
	Subtitle:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	Subtitle:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( Subtitle )
	self.Subtitle = Subtitle
	
	local leftButtonPrompts = CoD.fe_LeftContainer.new( self, controller )
	leftButtonPrompts:setLeftRight( false, false, -203.5, 227.5 )
	leftButtonPrompts:setTopBottom( true, false, 424, 456 )
	self:addElement( leftButtonPrompts )
	self.leftButtonPrompts = leftButtonPrompts
	
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
	self:registerEventHandler( "menu_loaded", function ( self, event )
		local f5_local0 = nil
		LockInput( self, controller, true )
		if not f5_local0 then
			f5_local0 = self:dispatchEventToChildren( event )
		end
		return f5_local0
	end )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, nil, function ( element, menu, controller, model )
		SendMenuResponse( self, "OverwriteProgressWarning", "cancel", controller )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "MENU_CANCEL" )
		return true
	end, false )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
		SendMenuResponse( self, "OverwriteProgressWarning", "", controller )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "CP_SH_CAIRO_READY_ROOM2" )
		return true
	end, false )
	LUI.OverrideFunction_CallOriginalFirst( self, "close", function ( element )
		LockInput( self, controller, false )
	end )
	leftButtonPrompts:setModel( self.buttonModel, controller )
	self:processEvent( {
		name = "menu_loaded",
		controller = controller
	} )
	self:processEvent( {
		name = "update_state",
		menu = self
	} )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.BackgroundDarken:close()
		element.cacElemsSideList0:close()
		element.scorestreakVignetteContainer:close()
		element.Background:close()
		element.ProcessingSpinner:close()
		element.WaitSpinner:close()
		element.GenericLinesPopup000:close()
		element.GenericLinesPopup020:close()
		element.leftButtonPrompts:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "OverwriteProgressWarning.buttonPrompts" ) )
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	
	return self
end

