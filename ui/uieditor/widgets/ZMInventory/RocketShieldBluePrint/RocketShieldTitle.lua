-- 36914afcfbc8a47d136f25c40632442b
-- This hash is used for caching, delete to decompile the file again

CoD.RocketShieldTitle = InheritFrom( LUI.UIElement )
CoD.RocketShieldTitle.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.RocketShieldTitle )
	self.id = "RocketShieldTitle"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 181 )
	self:setTopBottom( true, false, 0, 41 )
	
	local LabelBaseLargeShield = LUI.UIImage.new()
	LabelBaseLargeShield:setLeftRight( true, false, 0, 181.5 )
	LabelBaseLargeShield:setTopBottom( false, true, -41.25, 0 )
	LabelBaseLargeShield:setImage( RegisterImage( "uie_t7_base_title_2" ) )
	self:addElement( LabelBaseLargeShield )
	self.LabelBaseLargeShield = LabelBaseLargeShield
	
	local RocketShield = LUI.UIText.new()
	RocketShield:setLeftRight( true, false, 0, 181.5 )
	RocketShield:setTopBottom( false, true, -33.63, -13.63 )
	RocketShield:setRGB( 1, 0.87, 0.72 )
	RocketShield:setText( Engine.Localize( "ZMUI_ZOD_INV_ROCKETSHILED" ) )
	RocketShield:setTTF( "fonts/CHARB__.TTF" )
	RocketShield:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	RocketShield:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( RocketShield )
	self.RocketShield = RocketShield
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )

				LabelBaseLargeShield:completeAnimation()
				self.LabelBaseLargeShield:setAlpha( 0 )
				self.clipFinished( LabelBaseLargeShield, {} )

				RocketShield:completeAnimation()
				self.RocketShield:setAlpha( 0 )
				self.clipFinished( RocketShield, {} )
			end
		},
		Visible = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )

				LabelBaseLargeShield:completeAnimation()
				self.LabelBaseLargeShield:setAlpha( 1 )
				self.clipFinished( LabelBaseLargeShield, {} )

				RocketShield:completeAnimation()
				self.RocketShield:setAlpha( 1 )
				self.clipFinished( RocketShield, {} )
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
