require( "ui.uieditor.widgets.HUD.ZM_Inventory.SidequestIconContainer" )

CoD.SidequestIconInventoryWidget = InheritFrom( LUI.UIElement )
CoD.SidequestIconInventoryWidget.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.SidequestIconInventoryWidget )
	self.id = "SidequestIconInventoryWidget"
	self.soundSet = "HUD"
	self:setLeftRight( true, false, 0, 390 )
	self:setTopBottom( true, false, 0, 94 )
	self.anyChildUsesUpdateState = true
	
	local BackgroundPannelMid = LUI.UIImage.new()
	BackgroundPannelMid:setLeftRight( true, false, 28, 362 )
	BackgroundPannelMid:setTopBottom( true, false, -12, 106 )
	BackgroundPannelMid:setImage( RegisterImage( "uie_t7_zm_hd_inventory_base_mid" ) )
	self:addElement( BackgroundPannelMid )
	self.BackgroundPannelMid = BackgroundPannelMid
	
	local BackgroundPannelLarge = LUI.UIImage.new()
	BackgroundPannelLarge:setLeftRight( true, false, -16, 406 )
	BackgroundPannelLarge:setTopBottom( true, false, -12, 106 )
	BackgroundPannelLarge:setImage( RegisterImage( "uie_t7_zm_hd_inventory_base_large" ) )
	self:addElement( BackgroundPannelLarge )
	self.BackgroundPannelLarge = BackgroundPannelLarge
	
	local BackgroundPannelSmall = LUI.UIImage.new()
	BackgroundPannelSmall:setLeftRight( true, false, 133, 257 )
	BackgroundPannelSmall:setTopBottom( true, false, -12, 106 )
	BackgroundPannelSmall:setAlpha( 0 )
	BackgroundPannelSmall:setImage( RegisterImage( "uie_t7_zm_hd_inventory_base_small" ) )
	self:addElement( BackgroundPannelSmall )
	self.BackgroundPannelSmall = BackgroundPannelSmall
	
	local SidequestIconContainer = CoD.SidequestIconContainer.new( menu, controller )
	SidequestIconContainer:setLeftRight( false, false, -195, 195 )
	SidequestIconContainer:setTopBottom( false, false, -43, 53 )
	self:addElement( SidequestIconContainer )
	self.SidequestIconContainer = SidequestIconContainer
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 4 )
				BackgroundPannelMid:completeAnimation()
				self.BackgroundPannelMid:setAlpha( 0 )
				self.clipFinished( BackgroundPannelMid, {} )
				BackgroundPannelLarge:completeAnimation()
				self.BackgroundPannelLarge:setAlpha( 0 )
				self.clipFinished( BackgroundPannelLarge, {} )
				BackgroundPannelSmall:completeAnimation()
				self.BackgroundPannelSmall:setAlpha( 0 )
				self.clipFinished( BackgroundPannelSmall, {} )
				SidequestIconContainer:completeAnimation()
				self.SidequestIconContainer:setAlpha( 0 )
				self.clipFinished( SidequestIconContainer, {} )
			end
		},
		Show4 = {
			DefaultClip = function ()
				self:setupElementClipCounter( 4 )
				BackgroundPannelMid:completeAnimation()
				self.BackgroundPannelMid:setAlpha( 0 )
				self.clipFinished( BackgroundPannelMid, {} )
				BackgroundPannelLarge:completeAnimation()
				self.BackgroundPannelLarge:setAlpha( 1 )
				self.clipFinished( BackgroundPannelLarge, {} )
				BackgroundPannelSmall:completeAnimation()
				self.BackgroundPannelSmall:setAlpha( 0 )
				self.clipFinished( BackgroundPannelSmall, {} )
				SidequestIconContainer:completeAnimation()
				self.SidequestIconContainer:setAlpha( 1 )
				self.clipFinished( SidequestIconContainer, {} )
			end
		},
		Show3 = {
			DefaultClip = function ()
				self:setupElementClipCounter( 4 )
				BackgroundPannelMid:completeAnimation()
				self.BackgroundPannelMid:setAlpha( 1 )
				self.clipFinished( BackgroundPannelMid, {} )
				BackgroundPannelLarge:completeAnimation()
				self.BackgroundPannelLarge:setAlpha( 0 )
				self.clipFinished( BackgroundPannelLarge, {} )
				BackgroundPannelSmall:completeAnimation()
				self.BackgroundPannelSmall:setAlpha( 0 )
				self.clipFinished( BackgroundPannelSmall, {} )
				SidequestIconContainer:completeAnimation()
				self.SidequestIconContainer:setAlpha( 1 )
				self.clipFinished( SidequestIconContainer, {} )
			end
		},
		Show1 = {
			DefaultClip = function ()
				self:setupElementClipCounter( 4 )
				BackgroundPannelMid:completeAnimation()
				self.BackgroundPannelMid:setAlpha( 0 )
				self.clipFinished( BackgroundPannelMid, {} )
				BackgroundPannelLarge:completeAnimation()
				self.BackgroundPannelLarge:setAlpha( 0 )
				self.clipFinished( BackgroundPannelLarge, {} )
				BackgroundPannelSmall:completeAnimation()
				self.BackgroundPannelSmall:setAlpha( 1 )
				self.clipFinished( BackgroundPannelSmall, {} )
				SidequestIconContainer:completeAnimation()
				self.SidequestIconContainer:setAlpha( 1 )
				self.clipFinished( SidequestIconContainer, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "Show4",
			condition = function ( menu, element, event )
				return Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN ) and IsMapName( "zm_moon" )
			end
		},
		{
			stateName = "Show3",
			condition = function ( menu, element, event )
				return Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN ) and IsMapName( "zm_temple" )
			end
		},
		{
			stateName = "Show1",
			condition = function ( menu, element, event )
				return Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN ) and IsMapName( "zm_theater" )
			end
		}
	} )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN
		} )
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.SidequestIconContainer:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

