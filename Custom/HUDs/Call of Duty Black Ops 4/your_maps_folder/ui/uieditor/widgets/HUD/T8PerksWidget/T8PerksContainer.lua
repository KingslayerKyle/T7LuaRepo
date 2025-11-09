-- Decompiled using CoDLuaDecompiler by JariKCoding
-- https://github.com/JariKCoding/CoDLuaDecompiler

-- Author: Kingslayer Kyle
-- DD MM YY: 31/08/2022
-- Edits: Added comments, named functions & variables, fixed some bugs with the conditions in the HandlePerksList function

require( "ui.uieditor.widgets.HUD.ZM_Perks.PerkListItemFactory" )

-- A table that contains information about each of the perks
-- 1) Name of the perk
-- 2) How much it costs
-- 3) Description (What it does)
-- 4) Image name of the perk (Needs to be included in your maps zone: image,image_name_in_ape)
-- 5) Specialty name (Usually in the .gsh file for the perk)
-- 6) Clientfield name (Usually in the .gsh file for the perk, DO NOT INCLUDE "hudItems.perks.", only what comes after it)
-- NOTE: The last entry in the table should NOT have a comma ","
-- NOTE: The name, cost, description & specialty are specific to the Buyable Perk Machine
-- NOTE: If you are not using the Buyable Perk Machine you can remove everything except image & clientFieldName (You don't have to, it doesn't matter)
-- BLACK: ^0, RED: ^1, GREEN: ^2, YELLOW: ^3, BLUE: ^4, CYAN: ^5, MAGENTA: ^6, WHITE: ^7, MYTEAM: ^8, ENEMYTEAM: ^9
CoD.ZMPerks = {
	{
		name = "^2MULE KICK",
		cost = 4000,
		description = "Gain an additional primary weapon slot",
		image = "ui_icon_perks_zm_mulekick_lg",
		specialty = "specialty_additionalprimaryweapon",
		clientFieldName = "additional_primary_weapon"
	},
	{
		name = "^8DEAD SHOT",
		cost = 1500,
		description = "Auto-target the head on ADS",
		image = "ui_icon_perks_zm_deadshot_lg",
		specialty = "specialty_deadshot",
		clientFieldName = "dead_shot"
	},
	{
		name = "^3DOUBLE TAP",
		cost = 2000,
		description = "Increase bullet damage",
		image = "ui_icon_perks_zm_doubletap_lg",
		specialty = "specialty_doubletap2",
		clientFieldName = "doubletap2"
	},
	{
		name = "^9JUGGERNOG",
		cost = 2500,
		description = "Increase health",
		image = "ui_icon_perks_zm_juggernaut_lg",
		specialty = "specialty_armorvest",
		clientFieldName = "juggernaut"
	},
	{
		name = "^3STAMINUP",
		cost = 2000,
		description = "Increase sprint speed",
		image = "ui_icon_perks_zm_staminup_lg",
		specialty = "specialty_staminup",
		clientFieldName = "marathon"
	},
	{
		name = "^5QUICK REVIVE",
		cost = 1500,
		description = "Revive yourself (solo) / Revive others faster (co-op)",
		image = "ui_icon_perks_zm_quickrevive_lg",
		specialty = "specialty_quickrevive",
		clientFieldName = "quick_revive"
	},
	{
		name = "^2SPEED COLA",
		cost = 3000,
		description = "Reload faster",
		image = "ui_icon_perks_zm_fastreload_lg",
		specialty = "specialty_fastreload",
		clientFieldName = "sleight_of_hand"
	},
	{
		name = "^9WIDOWS WINE",
		cost = 4000,
		description = "Zombies are slowed when they attack you",
		image = "ui_icon_perks_zm_widowswine_lg",
		specialty = "specialty_widowswine",
		clientFieldName = "widows_wine"
	},
	{
		name = "^5ELECTRIC CHERRY",
		cost = 2000,
		description = "Electrical discharge on reload",
		image = "ui_icon_perks_zm_electric_cherry_lg",
		specialty = "specialty_electriccherry",
		clientFieldName = "electric_cherry"
	}
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
	for index = 1, #CoD.ZMPerks do
		-- The model value for the individual perk, which indicates it's status, 0 == off, 1 == on, 2 == paused
		local perkStatus = Engine.GetModelValue( Engine.GetModel( perksParentModel, CoD.ZMPerks[index].clientFieldName ) )

		-- Let's check the model value is not nil, and then check if it's an active perk (value is more than 1)
		if perkStatus ~= nil and perkStatus > 0 then
			-- If it's not in element.perksList, let's add it
			if not GetPerkIndex( element.perksList, CoD.ZMPerks[index].clientFieldName ) then
				table.insert( element.perksList, {
					models = {
						image = CoD.ZMPerks[index].image,
						status = perkStatus,
						newPerk = false
					},
					properties = {
						key = CoD.ZMPerks[index].clientFieldName
					}
				} )

				-- Perk has been added to the table
				tableUpdated = true
			end

			-- Let's make sure the status that's stored on the table is equal to the current model value
			local perkIndexToCheck = CheckPerkIndexForUpdate( element.perksList, CoD.ZMPerks[index].clientFieldName, perkStatus )

			-- If it isn't, let's update it
			if perkIndexToCheck > 0 then
				element.perksList[perkIndexToCheck].models.status = perkStatus
				
				Engine.SetModelValue( Engine.GetModel( Engine.GetModel( Engine.GetModelForController( controller ), "ZMPerksFactory" ), tostring( perkIndexToCheck ) .. ".status" ), perkStatus )
			end

		-- Otherwise, let's remove it if it's in element.perksList
		else
			-- Get the perk index to remove
			local perkIndexToCheck = GetPerkIndex( element.perksList, CoD.ZMPerks[index].clientFieldName )

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
	-- Create table for our datasource
	local perks = {}

	-- This function handles element.perksList
	HandlePerksList( element, controller )

	-- Insert 4 blank perks to start with to keep the images aligned
	for index = 1, 4 do
		table.insert( perks, {
			models = {
				image = "blacktransparent"
			}
		} )
	end

	-- Add the first 4 perks to the perks table
	for index = 1, #element.perksList do
		if index <= 4 then
			perks[index] = element.perksList[index]
		end
	end

	-- After it's been handled, let's pass it to the datasource so that it updates the UIList
	return perks
end, true )

DataSources.ZMPerksFactory2 = DataSourceHelpers.ListSetup( "ZMPerksFactory2", function ( controller, element )
	-- Create table for our datasource
	local perks = {}

	-- This function handles element.perksList
	HandlePerksList( element, controller )

	-- If we don't have at least 5 perks, just return the empty table
	if #element.perksList <= 4 then
		return perks
	end

	-- Insert every perk after the 4th to the perks table
	for index = 1, #element.perksList do
		if index > 4 then
			table.insert( perks, element.perksList[index] )
		end
	end

	-- After it's been handled, let's pass it to the datasource so that it updates the UIList
	return perks
end, true )

local PreLoadFunc = function ( self, controller )
	-- Create the parent model, that each of the perks' sub-models will be stored on
	local perksParentModel = Engine.CreateModel( Engine.GetModelForController( controller ), "hudItems.perks" )

	-- Creates and subscribes to each of the sub-models of the perks
	for index = 1, #CoD.ZMPerks do
		self:subscribeToModel( Engine.CreateModel( perksParentModel, CoD.ZMPerks[index].clientFieldName ), function ( model )
			-- If HandlePerksList returns true, let's update the datasource
			if HandlePerksList( self.PerkList, controller ) then
				self.PerkList:updateDataSource()
			end

			if HandlePerksList( self.PerkList2, controller ) then
				self.PerkList2:updateDataSource()
			end
		end, false )
	end
end

CoD.T8PerksContainer = InheritFrom( LUI.UIElement )
CoD.T8PerksContainer.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.T8PerksContainer )
	self.id = "T8PerksContainer"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 1280 )
	self:setTopBottom( true, false, 0, 720 )
	self.anyChildUsesUpdateState = true

	self.Background = LUI.UIImage.new()
	self.Background:setLeftRight( false, false, -119.5, 119.5 )
	self.Background:setTopBottom( false, true, -69, -33 )
	self.Background:setImage( RegisterImage( "t8_hud_perks_frame" ) )
	self:addElement( self.Background )
	
	self.PerkList = LUI.UIList.new( menu, controller, 6.5, 0, nil, false, false, 0, 0, false, false )
	self.PerkList:makeFocusable()
	self.PerkList:setLeftRight( false, false, 0, 0 )
	self.PerkList:setTopBottom( false, true, 0, -49.5 )
	self.PerkList:setWidgetType( CoD.PerkListItemFactory )
	self.PerkList:setHorizontalCount( 4 )
	self.PerkList:setDataSource( "ZMPerksFactory" )
	self:addElement( self.PerkList )

	self.PerkList2 = LUI.UIList.new( menu, controller, 3.5, 0, nil, false, false, 0, 0, false, false )
	self.PerkList2:makeFocusable()
	self.PerkList2:setLeftRight( true, false, 245.5, 0 )
	self.PerkList2:setTopBottom( false, true, 0, -30 )
	self.PerkList2:setWidgetType( CoD.PerkListItemFactory )
	self.PerkList2:setHorizontalCount( 10 )
	self.PerkList2:setDataSource( "ZMPerksFactory2" )
	self:addElement( self.PerkList2 )
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 3 )

				self.Background:completeAnimation()
				self.Background:setAlpha( 1 )
				self.clipFinished( self.Background, {} )

				self.PerkList:completeAnimation()
				self.PerkList:setAlpha( 1 )
				self.clipFinished( self.PerkList, {} )

				self.PerkList2:completeAnimation()
				self.PerkList2:setAlpha( 1 )
				self.clipFinished( self.PerkList2, {} )
			end,
			Hidden = function ()
				self:setupElementClipCounter( 3 )
	
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

				self.Background:completeAnimation()
				self.Background:setAlpha( 1 )
				HiddenTransition( self.Background, {} )

				self.PerkList:completeAnimation()
				self.PerkList:setAlpha( 1 )
				HiddenTransition( self.PerkList, {} )

				self.PerkList2:completeAnimation()
				self.PerkList2:setAlpha( 1 )
				HiddenTransition( self.PerkList2, {} )
			end
		},
		Hidden = {
			DefaultClip = function ()
				self:setupElementClipCounter( 3 )

				self.Background:completeAnimation()
				self.Background:setAlpha( 0 )
				self.clipFinished( self.Background, {} )

				self.PerkList:completeAnimation()
				self.PerkList:setAlpha( 0 )
				self.clipFinished( self.PerkList, {} )

				self.PerkList2:completeAnimation()
				self.PerkList2:setAlpha( 0 )
				self.clipFinished( self.PerkList2, {} )
			end,
			DefaultState = function ()
				self:setupElementClipCounter( 3 )

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

				self.Background:completeAnimation()
				self.Background:setAlpha( 0 )
				DefaultStateTransition( self.Background, {} )

				self.PerkList:completeAnimation()
				self.PerkList:setAlpha( 0 )
				DefaultStateTransition( self.PerkList, {} )

				self.PerkList2:completeAnimation()
				self.PerkList2:setAlpha( 0 )
				DefaultStateTransition( self.PerkList2, {} )
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
	self.PerkList2.id = "PerkList2"

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.Background:close()
		element.PerkList:close()
		element.PerkList2:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
