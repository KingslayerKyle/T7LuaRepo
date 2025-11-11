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
	self:setLeftRight( 0, 1, 0, 0 )
	self:setTopBottom( 0, 1, 0, 0 )
	self:playSound( "menu_open", controller )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "Rewards.buttonPrompts" )
	self.anyChildUsesUpdateState = true
	
	local background = LUI.UIImage.new()
	background:setLeftRight( 0, 1, 0, 0 )
	background:setTopBottom( 0, 1, 0, 0 )
	background:setRGB( 0, 0, 0 )
	self:addElement( background )
	self.background = background
	
	local background2 = LUI.UIImage.new()
	background2:setLeftRight( 0, 1, 0, 0 )
	background2:setTopBottom( 0.5, 0.5, -348, 372 )
	background2:setRGB( 0.21, 0.21, 0.21 )
	self:addElement( background2 )
	self.background2 = background2
	
	local titleLabel = LUI.UITightText.new()
	titleLabel:setLeftRight( 0, 0, 287, 488 )
	titleLabel:setTopBottom( 0, 0, 225, 297 )
	titleLabel:setText( Engine.Localize( "MPUI_REWARDS_CAPS" ) )
	titleLabel:setTTF( "fonts/default.ttf" )
	self:addElement( titleLabel )
	self.titleLabel = titleLabel
	
	local itemNameLabel = LUI.UITightText.new()
	itemNameLabel:setLeftRight( 0, 0, 287, 416 )
	itemNameLabel:setTopBottom( 0, 0, 664, 709 )
	itemNameLabel:setTTF( "fonts/default.ttf" )
	self:addElement( itemNameLabel )
	self.itemNameLabel = itemNameLabel
	
	local itemDescLabel = LUI.UITightText.new()
	itemDescLabel:setLeftRight( 0, 0, 287, 1085 )
	itemDescLabel:setTopBottom( 0, 0, 709, 747 )
	itemDescLabel:setAlpha( 0 )
	itemDescLabel:setTTF( "fonts/default.ttf" )
	self:addElement( itemDescLabel )
	self.itemDescLabel = itemDescLabel
	
	local itemDesc2Label = LUI.UITightText.new()
	itemDesc2Label:setLeftRight( 0, 0, 286, 733 )
	itemDesc2Label:setTopBottom( 0, 0, 746, 784 )
	itemDesc2Label:setRGB( 0.61, 0.61, 0.61 )
	itemDesc2Label:setTTF( "fonts/default.ttf" )
	self:addElement( itemDesc2Label )
	self.itemDesc2Label = itemDesc2Label
	
	local missionStatusLabel = LUI.UITightText.new()
	missionStatusLabel:setLeftRight( 0, 0, 1189, 1282 )
	missionStatusLabel:setTopBottom( 0, 0, 250, 288 )
	missionStatusLabel:setRGB( 0.22, 0.76, 0.32 )
	missionStatusLabel:setTTF( "fonts/default.ttf" )
	self:addElement( missionStatusLabel )
	self.missionStatusLabel = missionStatusLabel
	
	local gameTypeLabel = LUI.UITightText.new()
	gameTypeLabel:setLeftRight( 0, 0, 1411, 1525 )
	gameTypeLabel:setTopBottom( 0, 0, 250, 288 )
	gameTypeLabel:setText( Engine.Localize( "MPUI_SABOTAGE_CAPS" ) )
	gameTypeLabel:setTTF( "fonts/default.ttf" )
	self:addElement( gameTypeLabel )
	self.gameTypeLabel = gameTypeLabel
	
	local locationLabel = LUI.UITightText.new()
	locationLabel:setLeftRight( 1, 1, -372, -150 )
	locationLabel:setTopBottom( 0, 0, 257, 287 )
	locationLabel:setText( Engine.Localize( "CPUI_CP_HUB_SING_HILLTOP_PARK_C" ) )
	locationLabel:setTTF( "fonts/default.ttf" )
	self:addElement( locationLabel )
	self.locationLabel = locationLabel
	
	local rewardsList = LUI.UIList.new( self, controller, 38, 0, nil, false, false, 0, 0, false, false )
	rewardsList:makeFocusable()
	rewardsList:setLeftRight( 0, 0, 278, 2358 )
	rewardsList:setTopBottom( 0, 0, 327, 642 )
	rewardsList:setWidgetType( CoD.RewardsListWidget )
	rewardsList:setHorizontalCount( 6 )
	rewardsList:setSpacing( 38 )
	rewardsList:setDataSource( "Rewards" )
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
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
		NavigateToMenu( self, "AfterActionReportMenu", false, controller )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_CONTINUE", nil )
		return true
	end, false )
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
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.rewardsList:close()
		self.itemNameLabel:close()
		self.itemDescLabel:close()
		self.itemDesc2Label:close()
		self.missionStatusLabel:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "Rewards.buttonPrompts" ) )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	return self
end

