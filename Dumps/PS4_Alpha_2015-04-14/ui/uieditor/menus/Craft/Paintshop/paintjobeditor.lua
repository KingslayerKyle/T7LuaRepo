require( "ui.uieditor.widgets.Craft.EmblemEditor.EmblemLayerContainer" )
require( "ui.uieditor.widgets.Craft.EmblemEditor.EmblemEditorControls" )

local PostLoadFunc = function ( self )
	self.disableDarkenElement = true
end

LUI.createMenu.PaintjobEditor = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "PaintjobEditor" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "default"
	self:setOwner( controller )
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, true, 0, 0 )
	self:playSound( "menu_open" )
	self.anyChildUsesUpdateState = true
	
	local title = LUI.UIText.new()
	title:setLeftRight( true, false, 96, 449 )
	title:setTopBottom( true, false, 54, 102 )
	title:setRGB( 0.5, 0.51, 0.52 )
	title:setText( Engine.Localize( "MENU_PAINTSHOP_CAPS" ) )
	title:setTTF( "fonts/GatewayA2.ttf" )
	title:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	title:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( title )
	self.title = title
	
	local layerCarousel = LUI.UIList.new( self, controller, 1, 200, nil, false, false, 0, 0, false, false )
	layerCarousel:makeFocusable()
	layerCarousel:setLeftRight( true, false, 96, 914 )
	layerCarousel:setTopBottom( true, false, 491.62, 581.62 )
	layerCarousel:setRGB( 1, 1, 1 )
	layerCarousel:setDataSource( "EmblemLayerList" )
	layerCarousel:setWidgetType( CoD.EmblemLayerContainer )
	layerCarousel:setHorizontalCount( 9 )
	layerCarousel:setSpacing( 1 )
	self:addElement( layerCarousel )
	self.layerCarousel = layerCarousel
	
	local controls = CoD.EmblemEditorControls.new( self, controller )
	controls:setLeftRight( true, false, -61.5, 338.5 )
	controls:setTopBottom( true, false, 119, 399 )
	self:addElement( controls )
	self.controls = controls
	
	self.buttonPromptAddFunctions = {}
	self.buttonPromptAddFunctions.secondary = function ( menu, element, event )
		menu:addButtonPrompt( "secondary", Engine.Localize( "MENU_BACK" ), "ESCAPE", element )
		return true
	end
	
	self.buttonPromptAddFunctions.secondary( self, self, {
		controller = controller
	} )
	self:registerEventHandler( "gamepad_button", function ( element, event )
		local retVal = nil
		if not element:AcceptGamePadButtonInput( event ) or not event.down or event.simulated then
			return 
		elseif element:DoNavigationForGamePadButton( event ) then
			return true
		elseif not self.occludedBy and (event.button == "secondary" or event.button == "key_shortcut" and event.key == "ESCAPE") then
			GoBack( self, controller )
			PaintjobEditor_Back( self, element, controller )
		end
		if not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return retVal
	end )
	layerCarousel.id = "layerCarousel"
	self:processEvent( {
		name = "menu_loaded",
		controller = controller
	} )
	self:processEvent( {
		name = "update_state",
		menu = self
	} )
	if not self:restoreState() then
		self.layerCarousel:processEvent( {
			name = "gain_focus",
			controller = controller
		} )
	end
	self.close = function ( self )
		self.layerCarousel:close()
		self.controls:close()
		CoD.Menu.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	return self
end

