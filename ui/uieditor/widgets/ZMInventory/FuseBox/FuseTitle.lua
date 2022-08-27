-- 2f3e7efe32cb0fdc3926f0b8f08db6ef
-- This hash is used for caching, delete to decompile the file again

CoD.FuseTitle = InheritFrom( LUI.UIElement )
CoD.FuseTitle.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.FuseTitle )
	self.id = "FuseTitle"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 99 )
	self:setTopBottom( true, false, 0, 41 )
	
	local LabelBaseSmall = LUI.UIImage.new()
	LabelBaseSmall:setLeftRight( true, false, 0, 99 )
	LabelBaseSmall:setTopBottom( false, true, -41.25, 0 )
	LabelBaseSmall:setImage( RegisterImage( "uie_t7_base_title_1" ) )
	self:addElement( LabelBaseSmall )
	self.LabelBaseSmall = LabelBaseSmall
	
	local Fuses = LUI.UIText.new()
	Fuses:setLeftRight( true, false, 7, 92 )
	Fuses:setTopBottom( false, true, -33.63, -13.63 )
	Fuses:setRGB( 1, 0.87, 0.72 )
	Fuses:setText( Engine.Localize( "ZMUI_ZOD_INV_FUSES" ) )
	Fuses:setTTF( "fonts/CHARB__.TTF" )
	Fuses:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	Fuses:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( Fuses )
	self.Fuses = Fuses
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				LabelBaseSmall:completeAnimation()
				self.LabelBaseSmall:setAlpha( 0 )
				self.clipFinished( LabelBaseSmall, {} )
				Fuses:completeAnimation()
				self.Fuses:setAlpha( 0 )
				self.clipFinished( Fuses, {} )
			end
		},
		Visible = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				LabelBaseSmall:completeAnimation()
				self.LabelBaseSmall:setAlpha( 1 )
				self.clipFinished( LabelBaseSmall, {} )
				Fuses:completeAnimation()
				self.Fuses:setAlpha( 1 )
				self.clipFinished( Fuses, {} )
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

