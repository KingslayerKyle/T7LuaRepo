-- de93f92e0c1b5d54bca18c3ab04e5b5e
-- This hash is used for caching, delete to decompile the file again

CoD.BM_Debug_LootItemStats = InheritFrom( LUI.UIElement )
CoD.BM_Debug_LootItemStats.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.BM_Debug_LootItemStats )
	self.id = "BM_Debug_LootItemStats"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 200 )
	self:setTopBottom( true, false, 0, 25 )
	
	local DebugLootItemStats = LUI.UIText.new()
	DebugLootItemStats:setLeftRight( true, false, 0, 590 )
	DebugLootItemStats:setTopBottom( true, false, 0, 18 )
	DebugLootItemStats:setAlpha( 0 )
	DebugLootItemStats:setText( Engine.Localize( "COMMON: $(debugLootItemStats.commonDiscreteCount) / $(debugLootItemStats.commonDupeCount)    RARE: $(debugLootItemStats.rareDiscreteCount) / $(debugLootItemStats.rareDupeCount)    LEGENDARY: $(debugLootItemStats.legendaryDiscreteCount) / $(debugLootItemStats.legendaryDupeCount)    EPIC: $(debugLootItemStats.epicDiscreteCount) / $(debugLootItemStats.epicDupeCount)    MELEE: $(debugLootItemStats.meleeDiscreteCount) / $(debugLootItemStats.meleeDupeCount)    RANGE: $(debugLootItemStats.rangeDiscreteCount) / $(debugLootItemStats.rangeDupeCount)" ) )
	DebugLootItemStats:setTTF( "fonts/default.ttf" )
	DebugLootItemStats:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	DebugLootItemStats:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( DebugLootItemStats )
	self.DebugLootItemStats = DebugLootItemStats
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )

				DebugLootItemStats:completeAnimation()
				self.DebugLootItemStats:setAlpha( 0 )
				self.clipFinished( DebugLootItemStats, {} )
			end
		},
		Visible = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )

				DebugLootItemStats:completeAnimation()
				self.DebugLootItemStats:setAlpha( 1 )
				self.clipFinished( DebugLootItemStats, {} )
			end
		}
	}

	self:mergeStateConditions( {
		{
			stateName = "Visible",
			condition = function ( menu, element, event )
				return IsIntDvarNonZero( "loot_showLootItemStats" )
			end
		}
	} )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
