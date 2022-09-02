-- 838caa0fcb7d279b0772f6089deb0d13
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.HUD.ZM_Perks.PerkListItemFactory" )

local f0_local0 = {
	"specialty_purple_staminup_zombies",
	"specialty_purple_juggernaut_zombies"
}
DataSources.ZMWearablePerks = ListHelper_SetupDataSource( "ZMWearablePerks", function ( f1_arg0 )
	local f1_local0 = Engine.GetModel( Engine.GetModelForController( f1_arg0 ), "zmInventory.wearable_perk_icons" )
	local f1_local1 = {}
	if f1_local0 then
		local f1_local2 = Engine.GetModelValue( f1_local0 )
		for f1_local6, f1_local7 in ipairs( f0_local0 ) do
			if CoD.BitUtility.IsBitwiseAndNonZero( f1_local2, f1_local6 ) then
				table.insert( f1_local1, {
					models = {
						image = f1_local7,
						newPerk = true,
						status = 1
					},
					properties = {}
				} )
			end
		end
	end
	return f1_local1
end )
local PostLoadFunc = function ( self, controller, menu )
	local f2_local0 = Engine.CreateModel( Engine.GetModelForController( controller ), "zmInventory.wearable_perk_icons" )
	if f2_local0 then
		self.GridLayout0:subscribeToModel( f2_local0, function ( model )
			if Engine.GetModelValue( model ) ~= nil then
				self.GridLayout0:updateDataSource()
			end
		end )
	end
end

CoD.WearablePerksContainer_Genesis = InheritFrom( LUI.UIElement )
CoD.WearablePerksContainer_Genesis.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.WearablePerksContainer_Genesis )
	self.id = "WearablePerksContainer_Genesis"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 74 )
	self:setTopBottom( true, false, 0, 36 )
	self.anyChildUsesUpdateState = true
	
	local GridLayout0 = LUI.GridLayout.new( menu, controller, false, 0, 0, 2, 0, nil, nil, false, false, 0, 0, false, false )
	GridLayout0:setLeftRight( true, false, 0, 74 )
	GridLayout0:setTopBottom( true, false, 0, 36 )
	GridLayout0:setWidgetType( CoD.PerkListItemFactory )
	GridLayout0:setHorizontalCount( 2 )
	GridLayout0:setDataSource( "ZMWearablePerks" )
	self:addElement( GridLayout0 )
	self.GridLayout0 = GridLayout0
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )

				GridLayout0:completeAnimation()
				self.GridLayout0:setAlpha( 1 )
				self.clipFinished( GridLayout0, {} )
			end
		},
		Invisible = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )

				GridLayout0:completeAnimation()
				self.GridLayout0:setAlpha( 0 )
				self.clipFinished( GridLayout0, {} )
			end
		}
	}

	self:mergeStateConditions( {
		{
			stateName = "Invisible",
			condition = function ( menu, element, event )
				local f7_local0 = Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_DEMO_ALL_GAME_HUD_HIDDEN )
				if not f7_local0 then
					f7_local0 = Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_DEMO_CAMERA_MODE_MOVIECAM )
					if not f7_local0 then
						if Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_HUD_VISIBLE ) then
							f7_local0 = Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN )
						else
							f7_local0 = true
						end
					end
				end
				return f7_local0
			end
		}
	} )
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
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_HUD_VISIBLE ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_HUD_VISIBLE
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

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.GridLayout0:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

