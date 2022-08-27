-- 6efdf696374e630ad3062beaa21d78ce
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.HUD.ZM_Perks.PerkListItemFactory" )

local f0_local0 = {
	additional_primary_weapon = "specialty_giant_three_guns_zombies",
	dead_shot = "specialty_giant_ads_zombies",
	dive_to_nuke = "specialty_divetonuke_zombies",
	doubletap2 = "specialty_giant_doubletap_zombies",
	juggernaut = "specialty_giant_juggernaut_zombies",
	marathon = "specialty_giant_marathon_zombies",
	quick_revive = "specialty_giant_quickrevive_zombies",
	sleight_of_hand = "specialty_giant_fastreload_zombies",
	tombstone = "specialty_tombstone_zombies",
	widows_wine = "specialty_giant_widows_wine_zombies",
	electric_cherry = "specialty_blue_electric_cherry_zombies"
}
local f0_local1 = function ( f1_arg0, f1_arg1 )
	if f1_arg0 ~= nil then
		for f1_local0 = 1, #f1_arg0, 1 do
			if f1_arg0[f1_local0].properties.key == f1_arg1 then
				return f1_local0
			end
		end
	end
	return nil
end

local f0_local2 = function ( f2_arg0, f2_arg1, f2_arg2 )
	if f2_arg0 ~= nil then
		for f2_local0 = 1, #f2_arg0, 1 do
			if f2_arg0[f2_local0].properties.key == f2_arg1 and f2_arg0[f2_local0].models.status ~= f2_arg2 then
				return f2_local0
			end
		end
	end
	return -1
end

local f0_local3 = function ( f3_arg0, f3_arg1 )
	if not f3_arg0.perksList then
		f3_arg0.perksList = {}
	end
	local f3_local0 = false
	local f3_local1 = Engine.GetModel( Engine.GetModelForController( f3_arg1 ), "hudItems.perks" )
	for f3_local6, f3_local7 in pairs( f0_local0 ) do
		local f3_local8 = Engine.GetModelValue( Engine.GetModel( f3_local1, f3_local6 ) )
		if f3_local8 ~= nil and f3_local8 > 0 then
			if not f0_local1( f3_arg0.perksList, f3_local6 ) then
				table.insert( f3_arg0.perksList, {
					models = {
						image = f3_local7,
						status = f3_local8,
						newPerk = false
					},
					properties = {
						key = f3_local6
					}
				} )
				f3_local0 = true
			end
			local f3_local5 = f0_local2( f3_arg0.perksList, f3_local6, f3_local8 )
			if f3_local5 > 0 then
				f3_arg0.perksList[f3_local5].models.status = f3_local8
				Engine.SetModelValue( Engine.GetModel( Engine.GetModel( Engine.GetModelForController( f3_arg1 ), "ZMPerksFactory" ), tostring( f3_local5 ) .. ".status" ), f3_local8 )
			end
		end
		local f3_local5 = f0_local1( f3_arg0.perksList, f3_local6 )
		if f3_local5 then
			table.remove( f3_arg0.perksList, f3_local5 )
			f3_local0 = true
		end
	end
	if f3_local0 then
		for f3_local2 = 1, #f3_arg0.perksList, 1 do
			f3_arg0.perksList[f3_local2].models.newPerk = f3_local2 == #f3_arg0.perksList
		end
	end
	if f3_local0 then
		return true
	end
	for f3_local2 = 1, #f3_arg0.perksList, 1 do
		Engine.SetModelValue( Engine.GetModel( f3_local1, f3_arg0.perksList[f3_local2].properties.key ), f3_arg0.perksList[f3_local2].models.status )
	end
	return false
end

DataSources.ZMPerksFactory = DataSourceHelpers.ListSetup( "ZMPerksFactory", function ( f4_arg0, f4_arg1 )
	f0_local3( f4_arg1, f4_arg0 )
	return f4_arg1.perksList
end, true )
local PreLoadFunc = function ( self, controller )
	local f5_local0 = Engine.CreateModel( Engine.GetModelForController( controller ), "hudItems.perks" )
	for f5_local4, f5_local5 in pairs( f0_local0 ) do
		self:subscribeToModel( Engine.CreateModel( f5_local0, f5_local4 ), function ( model )
			if f0_local3( self.PerkList, controller ) then
				self.PerkList:updateDataSource()
			end
		end, false )
	end
end

CoD.ZMPerksContainerFactory = InheritFrom( LUI.UIElement )
CoD.ZMPerksContainerFactory.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.ZMPerksContainerFactory )
	self.id = "ZMPerksContainerFactory"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 151 )
	self:setTopBottom( true, false, 0, 36 )
	self.anyChildUsesUpdateState = true
	
	local PerkList = LUI.UIList.new( menu, controller, 2, 0, nil, false, false, 0, 0, false, false )
	PerkList:makeFocusable()
	PerkList:setLeftRight( true, false, 0, 378 )
	PerkList:setTopBottom( false, true, -36, 0 )
	PerkList:setWidgetType( CoD.PerkListItemFactory )
	PerkList:setHorizontalCount( 10 )
	PerkList:setDataSource( "ZMPerksFactory" )
	self:addElement( PerkList )
	self.PerkList = PerkList
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				PerkList:completeAnimation()
				self.PerkList:setAlpha( 1 )
				self.clipFinished( PerkList, {} )
			end
		},
		Hidden = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				PerkList:completeAnimation()
				self.PerkList:setAlpha( 0 )
				self.clipFinished( PerkList, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "Hidden",
			condition = function ( menu, element, event )
				local f10_local0 = Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_AMMO_COUNTER_HIDE )
				if not f10_local0 then
					f10_local0 = Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_DEMO_ALL_GAME_HUD_HIDDEN )
					if not f10_local0 then
						f10_local0 = Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_DEMO_CAMERA_MODE_MOVIECAM )
						if not f10_local0 then
							f10_local0 = Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_EMP_ACTIVE )
							if not f10_local0 then
								f10_local0 = Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_GAME_ENDED )
								if not f10_local0 then
									if Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_HUD_VISIBLE ) then
										f10_local0 = Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_IN_GUIDED_MISSILE )
										if not f10_local0 then
											f10_local0 = Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_IN_REMOTE_KILLSTREAK_STATIC )
											if not f10_local0 then
												f10_local0 = Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_IN_VEHICLE )
												if not f10_local0 then
													f10_local0 = Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_IS_FLASH_BANGED )
													if not f10_local0 then
														f10_local0 = Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_IS_PLAYER_IN_AFTERLIFE )
														if not f10_local0 then
															f10_local0 = Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_IS_SCOPED )
															if not f10_local0 then
																f10_local0 = Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN )
																if not f10_local0 then
																	f10_local0 = Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_UI_ACTIVE )
																end
															end
														end
													end
												end
											end
										end
									else
										f10_local0 = true
									end
								end
							end
						end
					end
				end
				return f10_local0
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
	PerkList.id = "PerkList"
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.PerkList:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

