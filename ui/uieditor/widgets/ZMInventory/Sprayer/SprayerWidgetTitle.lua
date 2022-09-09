-- bb9e55a81b5978f3bdbf70157bf1ba20
-- This hash is used for caching, delete to decompile the file again

CoD.SprayerWidgetTitle = InheritFrom( LUI.UIElement )
CoD.SprayerWidgetTitle.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.SprayerWidgetTitle )
	self.id = "SprayerWidgetTitle"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 182 )
	self:setTopBottom( true, false, 0, 41 )
	
	local LabelBaseLargeItems = LUI.UIImage.new()
	LabelBaseLargeItems:setLeftRight( false, true, -181.5, 0 )
	LabelBaseLargeItems:setTopBottom( false, true, -41.25, 0 )
	LabelBaseLargeItems:setImage( RegisterImage( "uie_t7_base_title_2" ) )
	self:addElement( LabelBaseLargeItems )
	self.LabelBaseLargeItems = LabelBaseLargeItems
	
	local SpecialItems = LUI.UIText.new()
	SpecialItems:setLeftRight( false, true, -181.5, 0 )
	SpecialItems:setTopBottom( false, true, -33.63, -13.63 )
	SpecialItems:setRGB( 1, 0.87, 0.72 )
	SpecialItems:setText( Engine.Localize( "ZMUI_ZOD_INV_SPE" ) )
	SpecialItems:setTTF( "fonts/CHARB__.TTF" )
	SpecialItems:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	SpecialItems:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( SpecialItems )
	self.SpecialItems = SpecialItems
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )

				LabelBaseLargeItems:completeAnimation()
				self.LabelBaseLargeItems:setAlpha( 0 )
				self.clipFinished( LabelBaseLargeItems, {} )

				SpecialItems:completeAnimation()
				self.SpecialItems:setAlpha( 0 )
				self.clipFinished( SpecialItems, {} )
			end
		},
		Visible = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )

				LabelBaseLargeItems:completeAnimation()
				self.LabelBaseLargeItems:setAlpha( 1 )
				self.clipFinished( LabelBaseLargeItems, {} )

				SpecialItems:completeAnimation()
				self.SpecialItems:setAlpha( 1 )
				self.clipFinished( SpecialItems, {} )
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
