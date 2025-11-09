CoD.InventoryTextBox_Genesis = InheritFrom( LUI.UIElement )
CoD.InventoryTextBox_Genesis.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.InventoryTextBox_Genesis )
	self.id = "InventoryTextBox_Genesis"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 107 )
	self:setTopBottom( true, false, 0, 14 )
	
	local TextKeeper = LUI.UIText.new()
	TextKeeper:setLeftRight( true, true, -147.25, 148.25 )
	TextKeeper:setTopBottom( true, true, -0.02, 0 )
	TextKeeper:setRGB( 0.27, 0.25, 0.23 )
	TextKeeper:setText( Engine.Localize( "ZM_GENESIS_ROBOT_NAME" ) )
	TextKeeper:setTTF( "fonts/FoundryGridnik-Medium.ttf" )
	TextKeeper:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	TextKeeper:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	LUI.OverrideFunction_CallOriginalFirst( TextKeeper, "setText", function ( element, controller )
		ScaleWidgetToLabelCentered( self, element, 0 )
	end )
	self:addElement( TextKeeper )
	self.TextKeeper = TextKeeper
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				TextKeeper:completeAnimation()
				self.TextKeeper:setAlpha( 0 )
				self.clipFinished( TextKeeper, {} )
			end
		},
		Visible = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				TextKeeper:completeAnimation()
				self.TextKeeper:setAlpha( 1 )
				self.clipFinished( TextKeeper, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "Visible",
			condition = function ( menu, element, event )
				return Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN )
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
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

