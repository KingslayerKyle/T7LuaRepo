require( "ui.uieditor.menus.AfterActionReportMenu" )
require( "ui.uieditor.widgets.MenuSpecificWidgets.RewardsListWidget" )

local PostLoadFunc = function ( self )
	self.rewardsList:processEvent( {
		name = "gain_focus",
		controller = controller
	} )
end

LUI.createMenu.Rewards = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "Rewards" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "default"
	self:setOwner( controller )
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, true, 0, 0 )
	self:playSound( "menu_open" )
	self.anyChildUsesUpdateState = true
	
	local background = LUI.UIImage.new()
	background:setLeftRight( true, true, 0, 0 )
	background:setTopBottom( true, true, 0, 0 )
	background:setRGB( 0, 0, 0 )
	background:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( background )
	self.background = background
	
	local background2 = LUI.UIImage.new()
	background2:setLeftRight( true, true, 0, 0 )
	background2:setTopBottom( false, false, -232, 248 )
	background2:setRGB( 0.21, 0.21, 0.21 )
	background2:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( background2 )
	self.background2 = background2
	
	local titleLabel = LUI.UITightText.new()
	titleLabel:setLeftRight( true, false, 191, 325 )
	titleLabel:setTopBottom( true, false, 150, 198 )
	titleLabel:setRGB( 1, 1, 1 )
	titleLabel:setText( Engine.Localize( "MPUI_REWARDS_CAPS" ) )
	titleLabel:setTTF( "fonts/default.ttf" )
	self:addElement( titleLabel )
	self.titleLabel = titleLabel
	
	local itemNameLabel = LUI.UITightText.new()
	itemNameLabel:setLeftRight( true, false, 191, 277 )
	itemNameLabel:setTopBottom( true, false, 442.5, 472.5 )
	itemNameLabel:setRGB( 1, 1, 1 )
	itemNameLabel:setTTF( "fonts/default.ttf" )
	self:addElement( itemNameLabel )
	self.itemNameLabel = itemNameLabel
	
	local itemDescLabel = LUI.UITightText.new()
	itemDescLabel:setLeftRight( true, false, 191, 723 )
	itemDescLabel:setTopBottom( true, false, 472.5, 497.5 )
	itemDescLabel:setRGB( 1, 1, 1 )
	itemDescLabel:setAlpha( 0 )
	itemDescLabel:setTTF( "fonts/default.ttf" )
	self:addElement( itemDescLabel )
	self.itemDescLabel = itemDescLabel
	
	local itemDesc2Label = LUI.UITightText.new()
	itemDesc2Label:setLeftRight( true, false, 191, 489 )
	itemDesc2Label:setTopBottom( true, false, 497.5, 522.5 )
	itemDesc2Label:setRGB( 0.61, 0.61, 0.61 )
	itemDesc2Label:setTTF( "fonts/default.ttf" )
	self:addElement( itemDesc2Label )
	self.itemDesc2Label = itemDesc2Label
	
	local missionStatusLabel = LUI.UITightText.new()
	missionStatusLabel:setLeftRight( true, false, 793, 855 )
	missionStatusLabel:setTopBottom( true, false, 167, 192 )
	missionStatusLabel:setRGB( 0.22, 0.76, 0.32 )
	missionStatusLabel:setTTF( "fonts/default.ttf" )
	self:addElement( missionStatusLabel )
	self.missionStatusLabel = missionStatusLabel
	
	local gameTypeLabel = LUI.UITightText.new()
	gameTypeLabel:setLeftRight( true, false, 941, 1017 )
	gameTypeLabel:setTopBottom( true, false, 167, 192 )
	gameTypeLabel:setRGB( 1, 1, 1 )
	gameTypeLabel:setText( Engine.Localize( "MPUI_SABOTAGE_CAPS" ) )
	gameTypeLabel:setTTF( "fonts/default.ttf" )
	self:addElement( gameTypeLabel )
	self.gameTypeLabel = gameTypeLabel
	
	local locationLabel = LUI.UITightText.new()
	locationLabel:setLeftRight( false, true, -248, -100 )
	locationLabel:setTopBottom( true, false, 171, 191 )
	locationLabel:setRGB( 1, 1, 1 )
	locationLabel:setText( Engine.Localize( "CPUI_CP_HUB_SING_HILLTOP_PARK_C" ) )
	locationLabel:setTTF( "fonts/default.ttf" )
	self:addElement( locationLabel )
	self.locationLabel = locationLabel
	
	local rewardsList = LUI.UIList.new( self, controller, 25, 0, nil, false, false, 0, 0, false, true )
	rewardsList:makeFocusable()
	rewardsList:setLeftRight( true, false, 186, 1571 )
	rewardsList:setTopBottom( true, false, 218, 428 )
	rewardsList:setRGB( 1, 1, 1 )
	rewardsList:setDataSource( "Rewards" )
	rewardsList:setWidgetType( CoD.RewardsListWidget )
	rewardsList:setHorizontalCount( 6 )
	rewardsList:setSpacing( 25 )
	self:addElement( rewardsList )
	self.rewardsList = rewardsList
	
	itemNameLabel:linkToElementModel( rewardsList, "rewardName", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			itemNameLabel:setText( Engine.Localize( modelValue ) )
		end
	end )
	itemDescLabel:linkToElementModel( rewardsList, "rewardDesc1", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			itemDescLabel:setText( Engine.Localize( modelValue ) )
		end
	end )
	itemDesc2Label:linkToElementModel( rewardsList, "rewardDesc2", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			itemDesc2Label:setText( Engine.Localize( modelValue ) )
		end
	end )
	self.missionStatusLabel:linkToElementModel( self, "matchResult", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			missionStatusLabel:setText( Engine.Localize( modelValue ) )
		end
	end )
	self.buttonPromptAddFunctions = {}
	self.buttonPromptAddFunctions.primary = function ( menu, element, event )
		menu:addButtonPrompt( "primary", Engine.Localize( "MENU_CONTINUE" ), "ENTER", element )
		return true
	end
	
	self.buttonPromptAddFunctions.primary( self, self, {
		controller = controller
	} )
	self:registerEventHandler( "gamepad_button", function ( element, event )
		local retVal = nil
		if not element:AcceptGamePadButtonInput( event ) or not event.down or event.simulated then
			return 
		elseif element:DoNavigationForGamePadButton( event ) then
			return true
		elseif not self.occludedBy and (event.button == "primary" or event.button == "key_shortcut" and event.key == "ENTER") then
			NavigateToMenu( self, "AfterActionReportMenu", false, controller )
		end
		if not retVal then
			retVal = element:dispatchEventToChildren( event )
		end
		return retVal
	end )
	rewardsList.id = "rewardsList"
	self:processEvent( {
		name = "menu_loaded",
		controller = controller
	} )
	self:processEvent( {
		name = "update_state",
		menu = self
	} )
	if not self:restoreState() then
		self.rewardsList:processEvent( {
			name = "gain_focus",
			controller = controller
		} )
	end
	self.close = function ( self )
		self.rewardsList:close()
		self.itemNameLabel:close()
		self.itemDescLabel:close()
		self.itemDesc2Label:close()
		self.missionStatusLabel:close()
		CoD.Menu.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	return self
end

