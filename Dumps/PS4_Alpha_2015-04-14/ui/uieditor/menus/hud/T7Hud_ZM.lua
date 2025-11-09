require( "ui.uieditor.widgets.MPHudWidgets.CursorHint" )
require( "ui.uieditor.widgets.ZMBuildables.QuestItemList" )
require( "ui.uieditor.widgets.ZMBuildables.BuildableIcon" )

local PostLoadFunc = function ( self )
	local controller = self:getOwner()
	local mapName = CoD.Zombie.GetUIMapName()
	local itemHolderClientFieldName = CoD.Zombie.SideQuest.ItemHolderClientFieldName[mapName]
	if self.questItemList and self.questItemList.questList and self.questItemList.questList.ZombieQuestItemList then
		for index, infoTable in ipairs( self.questItemList.questList.ZombieQuestItemList ) do
			local clientFieldName = infoTable.properties.clientFieldName
			if clientFieldName then
				self:registerEventHandler( clientFieldName, CoD.Zombie.ZodUpdateQuest )
			end
			local itemName = infoTable.properties.name
			if itemName then
				self:registerEventHandler( itemHolderClientFieldName .. itemName, CoD.Zombie.ZodItemHolderUpdate )
			end
		end
	end
	if self.shieldCraftableList and self.shieldCraftableList.questList and self.shieldCraftableList.questList.ZombieCraftableList then
		for index, infoTable in ipairs( self.shieldCraftableList.questList.ZombieCraftableList ) do
			local clientFieldName = infoTable.properties.clientFieldName
			if clientFieldName then
				self:registerEventHandler( clientFieldName, CoD.Zombie.UpdateCraftable )
			end
		end
	end
	if CoD.Zombie.PersistentItemInfo[mapName] then
		if self.persistentItem then
			self.persistentItem.iconImage:setImage( RegisterImage( CoD.Zombie.PersistentItemInfo[mapName].image ) )
		end
		self:registerEventHandler( CoD.Zombie.PersistentItemInfo[mapName].clientFieldName, CoD.Zombie.ZodUpdatePersistentIcon )
	end
	CoD.Zombie.SideQuest.PlayerPieceInfo[mapName] = {
		0,
		0,
		0,
		0
	}
	CoD.Zombie.SideQuest.HasPersistentItem[mapName] = false
	if self.heldItem1 then
		self.heldItem1:setModel( nil )
		self.heldItem1:setAlpha( 0 )
	end
end

LUI.createMenu.T7Hud_ZM = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "T7Hud_ZM" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "HUD"
	self:setOwner( controller )
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, true, 0, 0 )
	self:playSound( "menu_open" )
	self.anyChildUsesUpdateState = true
	local CursorHint = CoD.CursorHint.new( self, controller )
	CursorHint:setLeftRight( false, false, -250, 250 )
	CursorHint:setTopBottom( true, false, 522, 616 )
	CursorHint:setRGB( 1, 1, 1 )
	CursorHint:mergeStateConditions( {
		{
			stateName = "Active_1x1",
			condition = function ( menu, element, event )
				local f3_local0 = IsCursorHintActive( controller )
				if f3_local0 then
					if Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_IS_FLASH_BANGED ) or Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_UI_ACTIVE ) or Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_SPECTATING_CLIENT ) or Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_IN_GUIDED_MISSILE ) or Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_SELECTING_LOCATIONAL_KILLSTREAK ) or Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_IS_DEMO_PLAYING ) or Engine.GetModelValue( Engine.GetModel( DataSources.HUDItems.getModel( controller ), "cursorHintIconRatio" ) ) ~= 1 then
						f3_local0 = false
					else
						f3_local0 = true
					end
				end
				return f3_local0
			end
		},
		{
			stateName = "Active_2x1",
			condition = function ( menu, element, event )
				local f4_local0 = IsCursorHintActive( controller )
				if f4_local0 then
					if Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_IS_FLASH_BANGED ) or Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_UI_ACTIVE ) or Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_SPECTATING_CLIENT ) or Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_IN_GUIDED_MISSILE ) or Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_SELECTING_LOCATIONAL_KILLSTREAK ) or Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_IS_DEMO_PLAYING ) or Engine.GetModelValue( Engine.GetModel( DataSources.HUDItems.getModel( controller ), "cursorHintIconRatio" ) ) ~= 2 then
						f4_local0 = false
					else
						f4_local0 = true
					end
				end
				return f4_local0
			end
		},
		{
			stateName = "Active_4x1",
			condition = function ( menu, element, event )
				local f5_local0 = IsCursorHintActive( controller )
				if f5_local0 then
					if Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_IS_FLASH_BANGED ) or Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_UI_ACTIVE ) or Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_SPECTATING_CLIENT ) or Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_IN_GUIDED_MISSILE ) or Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_SELECTING_LOCATIONAL_KILLSTREAK ) or Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_IS_DEMO_PLAYING ) or Engine.GetModelValue( Engine.GetModel( DataSources.HUDItems.getModel( controller ), "cursorHintIconRatio" ) ) ~= 4 then
						f5_local0 = false
					else
						f5_local0 = true
					end
				end
				return f5_local0
			end
		}
	} )
	CursorHint:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "hudItems.showCursorHint" ), function ( model )
		self:updateElementState( CursorHint, {
			name = "model_validation",
			menu = self,
			modelValue = Engine.GetModelValue( model ),
			modelName = "hudItems.showCursorHint"
		} )
	end )
	if CursorHint.m_eventHandlers.hud_update_refresh then
		local currentEv = CursorHint.m_eventHandlers.hud_update_refresh
		CursorHint:registerEventHandler( "hud_update_refresh", function ( self, event )
			event.menu = event.menu or self
			self:updateState( event )
			return currentEv( self, event )
		end )
	else
		CursorHint:registerEventHandler( "hud_update_refresh", LUI.UIElement.updateState )
	end
	CursorHint:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IS_FLASH_BANGED ), function ( model )
		self:updateElementState( CursorHint, {
			name = "model_validation",
			menu = self,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IS_FLASH_BANGED
		} )
	end )
	CursorHint:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_UI_ACTIVE ), function ( model )
		self:updateElementState( CursorHint, {
			name = "model_validation",
			menu = self,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_UI_ACTIVE
		} )
	end )
	CursorHint:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_SPECTATING_CLIENT ), function ( model )
		self:updateElementState( CursorHint, {
			name = "model_validation",
			menu = self,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_SPECTATING_CLIENT
		} )
	end )
	CursorHint:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IN_GUIDED_MISSILE ), function ( model )
		self:updateElementState( CursorHint, {
			name = "model_validation",
			menu = self,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IN_GUIDED_MISSILE
		} )
	end )
	CursorHint:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_SELECTING_LOCATIONAL_KILLSTREAK ), function ( model )
		self:updateElementState( CursorHint, {
			name = "model_validation",
			menu = self,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_SELECTING_LOCATIONAL_KILLSTREAK
		} )
	end )
	CursorHint:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IS_DEMO_PLAYING ), function ( model )
		self:updateElementState( CursorHint, {
			name = "model_validation",
			menu = self,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IS_DEMO_PLAYING
		} )
	end )
	self:addElement( CursorHint )
	self.CursorHint = CursorHint
	
	local currentEv = CoD.QuestItemList.new( self, controller )
	currentEv:setLeftRight( true, false, 84, 340 )
	currentEv:setTopBottom( true, false, 163.5, 211.5 )
	currentEv:setRGB( 1, 1, 1 )
	currentEv.questList:setDataSource( "ZombieCraftableList" )
	self:addElement( currentEv )
	self.shieldCraftableList = currentEv
	
	local questItemList = CoD.QuestItemList.new( self, controller )
	questItemList:setLeftRight( true, false, 923, 1179 )
	questItemList:setTopBottom( true, false, 54, 102 )
	questItemList:setRGB( 1, 1, 1 )
	questItemList.questList:setDataSource( "ZombieQuestItemList" )
	self:addElement( questItemList )
	self.questItemList = questItemList
	
	local persistentItem = CoD.BuildableIcon.new( self, controller )
	persistentItem:setLeftRight( true, false, 84, 132 )
	persistentItem:setTopBottom( true, false, 54, 102 )
	persistentItem:setRGB( 1, 1, 1 )
	persistentItem:setAlpha( 0 )
	self:addElement( persistentItem )
	self.persistentItem = persistentItem
	
	local heldItem1 = CoD.BuildableIcon.new( self, controller )
	heldItem1:setLeftRight( true, false, 148, 196 )
	heldItem1:setTopBottom( true, false, 54, 102 )
	heldItem1:setRGB( 1, 1, 1 )
	heldItem1:setAlpha( 0 )
	self:addElement( heldItem1 )
	self.heldItem1 = heldItem1
	
	local heldItem2 = CoD.BuildableIcon.new( self, controller )
	heldItem2:setLeftRight( true, false, 200, 248 )
	heldItem2:setTopBottom( true, false, 54, 102 )
	heldItem2:setRGB( 1, 1, 1 )
	heldItem2:setAlpha( 0 )
	self:addElement( heldItem2 )
	self.heldItem2 = heldItem2
	
	self:processEvent( {
		name = "menu_loaded",
		controller = controller
	} )
	self:processEvent( {
		name = "update_state",
		menu = self
	} )
	self.close = function ( self )
		self.CursorHint:close()
		self.shieldCraftableList:close()
		self.questItemList:close()
		self.persistentItem:close()
		self.heldItem1:close()
		self.heldItem2:close()
		CoD.Menu.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	return self
end

