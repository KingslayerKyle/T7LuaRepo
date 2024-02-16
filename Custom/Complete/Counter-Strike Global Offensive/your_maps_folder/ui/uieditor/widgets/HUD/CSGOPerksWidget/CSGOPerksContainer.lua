-- Decompiled using CoDLuaDecompiler by JariKCoding
-- https://github.com/JariKCoding/CoDLuaDecompiler

-- Author: Kingslayer Kyle
-- DD MM YY: 31/08/2022
-- Edits: Added comments, named functions & variables, fixed some bugs with the conditions in the HandlePerksList function

require( "ui.uieditor.widgets.HUD.ZM_Perks.PerkListItemFactory" )

-- A table that contains the clientfield names and images of the perks
local perksTable = {
	additional_primary_weapon = "csgo_perk_three_guns",
	dead_shot = "csgo_perk_ads",
	doubletap2 = "csgo_perk_doubletap",
	juggernaut = "csgo_perk_juggernaut",
	marathon = "csgo_perk_marathon",
	quick_revive = "csgo_perk_quickrevive",
	sleight_of_hand = "csgo_perk_fastreload",
	widows_wine = "csgo_perk_widows_wine",
	electric_cherry = "csgo_perk_electric_cherry"
}

-- Summary: Used in the HandlePerksList function to get the perk index on the current iteration from element.perksList
-- Arg 1: A table that contains the player's current perks
-- Arg 2: The perk's clientfield name
local GetPerkIndex = function ( perksList, perkCF )
	if perksList ~= nil then
		for index = 1, #perksList do
			if perksList[index].properties.key == perkCF then
				return index
			end
		end
	end

	return nil
end

-- Summary: Used in the HandlePerksList function to check if the status stored on the table needs to be updated with the current model value
-- Arg 1: A table that contains the player's current perks
-- Arg 2: The perk's clientfield name
-- Arg 3: The model value of the current perk which indicates it's status, 0 == off, 1 == on, 2 == paused
local CheckPerkIndexForUpdate = function ( perksList, perkCF, perkStatus )
	if perksList ~= nil then
		for index = 1, #perksList do
			if perksList[index].properties.key == perkCF and perksList[index].models.status ~= perkStatus then
				return index
			end
		end
	end

	return -1
end

-- Summary: Handles the element.perksList table, which is used to store the player's current perks
-- Arg 1: The UIList
-- Arg 2: The instance
local HandlePerksList = function ( element, controller )
	-- Create element.perksList if it doesn't already exist, this will be used to store the player's current perks
	if not element.perksList then
		element.perksList = {}
	end

	-- bool, whether or not something was added to the table or removed from the table
	local tableUpdated = false

	-- Parent model, that each of the perks' sub-models will be stored on
	local perksParentModel = Engine.GetModel( Engine.GetModelForController( controller ), "hudItems.perks" )

	-- Loop through each of the perks in perksTable
	for key, value in pairs( perksTable ) do
		-- The model value for the individual perk, which indicates it's status, 0 == off, 1 == on, 2 == paused
		local perkStatus = Engine.GetModelValue( Engine.GetModel( perksParentModel, key ) )

		-- Let's check the model value is not nil, and then check if it's an active perk (value is more than 1)
		if perkStatus ~= nil and perkStatus > 0 then
			-- If it's not in element.perksList, let's add it
			if not GetPerkIndex( element.perksList, key ) then
				table.insert( element.perksList, {
					models = {
						image = value,
						status = perkStatus,
						newPerk = false
					},
					properties = {
						key = key
					}
				} )

				-- Perk has been added to the table
				tableUpdated = true
			end

			-- Let's make sure the status that's stored on the table is equal to the current model value
			local perkIndexToCheck = CheckPerkIndexForUpdate( element.perksList, key, perkStatus )

			-- If it isn't, let's update it
			if perkIndexToCheck > 0 then
				element.perksList[perkIndexToCheck].models.status = perkStatus
				
				Engine.SetModelValue( Engine.GetModel( Engine.GetModel( Engine.GetModelForController( controller ), "ZMPerksFactory" ), tostring( perkIndexToCheck ) .. ".status" ), perkStatus )
			end

		-- Otherwise, let's remove it if it's in element.perksList
		else
			-- Get the perk index to remove
			local perkIndexToCheck = GetPerkIndex( element.perksList, key )

			-- If we get a hit, remove it
			if perkIndexToCheck then
				table.remove( element.perksList, perkIndexToCheck )
				
				-- Perk has been removed from the table
				tableUpdated = true
			end
		end
	end

	if tableUpdated then
		-- Set newPerk if applicable, this is an animation that plays when the player receives a new perk
		for index = 1, #element.perksList do
			element.perksList[index].models.newPerk = index == #element.perksList
		end

		-- This is used on each perk model subscription in PreLoadFunc to know whether or not the datasource needs to be updated
		return true
	else
		-- Set the perks' model value to the status stored on element.perksList
		for index = 1, #element.perksList do
			Engine.SetModelValue( Engine.GetModel( perksParentModel, element.perksList[index].properties.key ), element.perksList[index].models.status )
		end

		-- This is used on each perk model subscription in PreLoadFunc to know whether or not the datasource needs to be updated
		return false
	end
end

DataSources.ZMPerksFactory = DataSourceHelpers.ListSetup( "ZMPerksFactory", function ( controller, element )
	-- This function handles element.perksList
	HandlePerksList( element, controller )
	-- After it's been handled, let's pass it to the datasource so that it updates the UIList
	return element.perksList
end, true )

local PreLoadFunc = function ( self, controller )
	-- Create the parent model, that each of the perks' sub-models will be stored on
	local perksParentModel = Engine.CreateModel( Engine.GetModelForController( controller ), "hudItems.perks" )

	-- Creates and subscribes to each of the sub-models of the perks
	for key, value in pairs( perksTable ) do
		self:subscribeToModel( Engine.CreateModel( perksParentModel, key ), function ( model )
			-- If HandlePerksList returns true, let's update the datasource
			if HandlePerksList( self.PerkList, controller ) then
				self.PerkList:updateDataSource()
			end
		end, false )
	end
end

CoD.CSGOPerksContainer = InheritFrom( LUI.UIElement )
CoD.CSGOPerksContainer.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.CSGOPerksContainer )
	self.id = "CSGOPerksContainer"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 1280 )
	self:setTopBottom( true, false, 0, 720 )
	self.anyChildUsesUpdateState = true
	
	self.PerkList = LUI.UIList.new( menu, controller, 2, 0, nil, false, false, 0, 0, false, false )
	self.PerkList:makeFocusable()
	self.PerkList:setLeftRight( false, false, 0, 0 )
	self.PerkList:setTopBottom( false, true, 0, -5 )
	self.PerkList:setWidgetType( CoD.PerkListItemFactory )
	self.PerkList:setHorizontalCount( 10 )
	self.PerkList:setVerticalCount( 2 )
	self.PerkList:setDataSource( "ZMPerksFactory" )
	self:addElement( self.PerkList )
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )

				self.PerkList:completeAnimation()
				self.PerkList:setAlpha( 1 )
				self.clipFinished( self.PerkList, {} )
			end,
			Hidden = function ()
				self:setupElementClipCounter( 1 )
	
				local HiddenTransition = function ( element, event )
					if not event.interrupted then
						element:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
					end
	
					element:setAlpha( 0 )
	
					if event.interrupted then
						self.clipFinished( element, event )
					else
						element:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end

				self.PerkList:completeAnimation()
				self.PerkList:setAlpha( 1 )
				HiddenTransition( self.PerkList, {} )
			end
		},
		Hidden = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )

				self.PerkList:completeAnimation()
				self.PerkList:setAlpha( 0 )
				self.clipFinished( self.PerkList, {} )
			end,
			DefaultState = function ()
				self:setupElementClipCounter( 1 )

				local DefaultStateTransition = function ( element, event )
					if not event.interrupted then
						element:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
					end
	
					element:setAlpha( 1 )
	
					if event.interrupted then
						self.clipFinished( element, event )
					else
						element:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end

				self.PerkList:completeAnimation()
				self.PerkList:setAlpha( 0 )
				DefaultStateTransition( self.PerkList, {} )
			end
		}
	}
	
	self:mergeStateConditions( {
		{
			stateName = "Hidden",
			condition = function ( menu, element, event )
				if not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_AMMO_COUNTER_HIDE )
				and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_DEMO_ALL_GAME_HUD_HIDDEN )
				and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_DEMO_CAMERA_MODE_MOVIECAM )
				and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_EMP_ACTIVE )
				and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_GAME_ENDED )
				and Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_HUD_VISIBLE )
				and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_IN_GUIDED_MISSILE )
				and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_IN_REMOTE_KILLSTREAK_STATIC )
				and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_IN_VEHICLE )
				and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_IS_FLASH_BANGED )
				and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_IS_PLAYER_IN_AFTERLIFE )
				and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_IS_SCOPED )
				and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN )
				and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_UI_ACTIVE ) then
					return false
				else
					return true
				end
			end
		}
	} )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_AMMO_COUNTER_HIDE ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_AMMO_COUNTER_HIDE
		} )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_DEMO_ALL_GAME_HUD_HIDDEN ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_DEMO_ALL_GAME_HUD_HIDDEN
		} )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_DEMO_CAMERA_MODE_MOVIECAM ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_DEMO_CAMERA_MODE_MOVIECAM
		} )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_EMP_ACTIVE ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_EMP_ACTIVE
		} )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_GAME_ENDED ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_GAME_ENDED
		} )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_HUD_VISIBLE ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_HUD_VISIBLE
		} )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IN_GUIDED_MISSILE ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IN_GUIDED_MISSILE
		} )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IN_REMOTE_KILLSTREAK_STATIC ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IN_REMOTE_KILLSTREAK_STATIC
		} )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IN_VEHICLE ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IN_VEHICLE
		} )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IS_FLASH_BANGED ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IS_FLASH_BANGED
		} )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IS_PLAYER_IN_AFTERLIFE ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IS_PLAYER_IN_AFTERLIFE
		} )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IS_SCOPED ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IS_SCOPED
		} )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN
		} )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_UI_ACTIVE ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_UI_ACTIVE
		} )
	end )

	self.PerkList.id = "PerkList"

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.PerkList:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
