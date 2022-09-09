-- b868af61c82608977f3012c844743d72
-- This hash is used for caching, delete to decompile the file again

CoD.RitualItemTitle = InheritFrom( LUI.UIElement )
CoD.RitualItemTitle.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.RitualItemTitle )
	self.id = "RitualItemTitle"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 181 )
	self:setTopBottom( true, false, 0, 41 )
	
	local LabelBaseLargeRituals = LUI.UIImage.new()
	LabelBaseLargeRituals:setLeftRight( false, false, -90.75, 90.75 )
	LabelBaseLargeRituals:setTopBottom( false, true, -41.25, 0 )
	LabelBaseLargeRituals:setImage( RegisterImage( "uie_t7_base_title_2" ) )
	self:addElement( LabelBaseLargeRituals )
	self.LabelBaseLargeRituals = LabelBaseLargeRituals
	
	local SacrificeRituals = LUI.UIText.new()
	SacrificeRituals:setLeftRight( false, false, -90.75, 90.75 )
	SacrificeRituals:setTopBottom( false, true, -33.63, -13.63 )
	SacrificeRituals:setRGB( 1, 0.87, 0.72 )
	SacrificeRituals:setText( Engine.Localize( "ZMUI_ZOD_INV_SAC" ) )
	SacrificeRituals:setTTF( "fonts/CHARB__.TTF" )
	SacrificeRituals:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	SacrificeRituals:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( SacrificeRituals )
	self.SacrificeRituals = SacrificeRituals
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )

				LabelBaseLargeRituals:completeAnimation()
				self.LabelBaseLargeRituals:setAlpha( 0 )
				self.clipFinished( LabelBaseLargeRituals, {} )

				SacrificeRituals:completeAnimation()
				self.SacrificeRituals:setAlpha( 0 )
				self.clipFinished( SacrificeRituals, {} )
			end
		},
		Visible = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )

				LabelBaseLargeRituals:completeAnimation()
				self.LabelBaseLargeRituals:setAlpha( 1 )
				self.clipFinished( LabelBaseLargeRituals, {} )

				SacrificeRituals:completeAnimation()
				self.SacrificeRituals:setAlpha( 1 )
				self.clipFinished( SacrificeRituals, {} )
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
