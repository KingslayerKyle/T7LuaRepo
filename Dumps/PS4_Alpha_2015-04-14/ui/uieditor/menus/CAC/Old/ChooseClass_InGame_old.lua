require( "ui.uieditor.widgets.BackgroundFrames.CACBackground_old" )
require( "ui.uieditor.widgets.CAC.List1ButtonChooseClass" )
require( "ui.uieditor.widgets.CAC.MenuChooseClassold.chooseClassWidget_old" )
require( "ui.uieditor.widgets.CAC.ClassAllocation" )

local PreLoadFunc = function ( self, controller )
	CoD.CACUtility.SetDefaultCACRoot( controller )
end

local PostLoadFunc = function ( self )
	local controller = self:getOwner()
	if not CoD.MenuNavigation then
		CoD.MenuNavigation = {}
	end
	CoD.MenuNavigation[controller] = {
		{
			"class"
		}
	}
end

LUI.createMenu.ChooseClass_InGame_old = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "ChooseClass_InGame_old" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "CAC"
	self:setOwner( controller )
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, true, 0, 0 )
	self:playSound( "menu_open" )
	self.anyChildUsesUpdateState = true
	
	local blackimage = LUI.UIImage.new()
	blackimage:setLeftRight( true, true, 0, 0 )
	blackimage:setTopBottom( true, true, 0, 0 )
	blackimage:setRGB( 0, 0, 0 )
	blackimage:setAlpha( 0.2 )
	blackimage:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( blackimage )
	self.blackimage = blackimage
	
	local background = CoD.CACBackground_old.new( self, controller )
	background:setLeftRight( true, true, 0, 0 )
	background:setTopBottom( true, true, 0, 0 )
	background:setRGB( 1, 1, 1 )
	background.titleLabel:setText( Engine.Localize( "MPUI_CHOOSE_CLASS_CAPS" ) )
	self:addElement( background )
	self.background = background
	
	local title = LUI.UITightText.new()
	title:setLeftRight( true, false, 96, 375 )
	title:setTopBottom( true, false, 54, 102 )
	title:setRGB( 0.5, 0.51, 0.52 )
	title:setAlpha( 0 )
	title:setText( Engine.Localize( "MPUI_CHOOSE_CLASS_CAPS" ) )
	title:setTTF( "fonts/default.ttf" )
	self:addElement( title )
	self.title = title
	
	local classList = LUI.UIList.new( self, controller, 2, 0, nil, false, false, 0, 0, false, false )
	classList:makeFocusable()
	classList:setLeftRight( true, false, 47, 327 )
	classList:setTopBottom( true, false, 98, 606 )
	classList:setRGB( 1, 1, 1 )
	classList:setDataSource( "ChooseClass_InGame" )
	classList:setWidgetType( CoD.List1ButtonChooseClass )
	classList:setVerticalCount( 15 )
	classList:registerEventHandler( "list_item_button_action", function ( element, event )
		local retVal = nil
		ChangeClass( self, element, controller )
		return retVal
	end )
	classList:registerEventHandler( "list_item_gain_focus", function ( element, event )
		local retVal = nil
		UpdateClassView( self, element, controller )
		return retVal
	end )
	self:addElement( classList )
	self.classList = classList
	
	local chooseClassWidget = CoD.chooseClassWidget_old.new( self, controller )
	chooseClassWidget:setLeftRight( false, true, -965, -144.5 )
	chooseClassWidget:setTopBottom( true, false, 103, 646 )
	chooseClassWidget:setRGB( 1, 1, 1 )
	self:addElement( chooseClassWidget )
	self.chooseClassWidget = chooseClassWidget
	
	local classAllocation = CoD.ClassAllocation.new( self, controller )
	classAllocation:setLeftRight( false, true, -531, -96 )
	classAllocation:setTopBottom( true, false, 43, 78 )
	classAllocation:setRGB( 1, 1, 1 )
	classAllocation:setAlpha( 0 )
	self:addElement( classAllocation )
	self.classAllocation = classAllocation
	
	background:linkToElementModel( classList, nil, false, function ( model )
		background:setModel( model, controller )
	end )
	chooseClassWidget:linkToElementModel( classList, nil, false, function ( model )
		chooseClassWidget:setModel( model, controller )
	end )
	classAllocation:linkToElementModel( classList, nil, false, function ( model )
		classAllocation:setModel( model, controller )
	end )
	self.buttonPromptAddFunctions = {}
	self.buttonPromptAddFunctions.secondary = function ( menu, element, event )
		menu:addButtonPrompt( "secondary", Engine.Localize( "MP_BACK" ), "ESCAPE", element )
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
			SendMenuResponse( self, "ChooseClass_InGame", "cancel", controller )
			GoBack( self, controller )
		end
		if not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return retVal
	end )
	classList.id = "classList"
	self:processEvent( {
		name = "menu_loaded",
		controller = controller
	} )
	self:processEvent( {
		name = "update_state",
		menu = self
	} )
	if not self:restoreState() then
		self.classList:processEvent( {
			name = "gain_focus",
			controller = controller
		} )
	end
	self.close = function ( self )
		self.background:close()
		self.classList:close()
		self.chooseClassWidget:close()
		self.classAllocation:close()
		CoD.Menu.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	return self
end

