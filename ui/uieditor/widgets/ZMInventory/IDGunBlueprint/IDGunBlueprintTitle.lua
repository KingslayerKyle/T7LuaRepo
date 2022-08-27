-- 44d80a0f138078e9277faf56e2e38aa0
-- This hash is used for caching, delete to decompile the file again

CoD.IDGunBlueprintTitle = InheritFrom( LUI.UIElement )
CoD.IDGunBlueprintTitle.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.IDGunBlueprintTitle )
	self.id = "IDGunBlueprintTitle"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 182 )
	self:setTopBottom( true, false, 0, 41 )
	
	local LabelBaseLargeIDGun = LUI.UIImage.new()
	LabelBaseLargeIDGun:setLeftRight( false, false, -90.75, 90.75 )
	LabelBaseLargeIDGun:setTopBottom( false, true, -41.25, 0 )
	LabelBaseLargeIDGun:setImage( RegisterImage( "uie_t7_base_title_2" ) )
	self:addElement( LabelBaseLargeIDGun )
	self.LabelBaseLargeIDGun = LabelBaseLargeIDGun
	
	local ApothiconServant = LUI.UIText.new()
	ApothiconServant:setLeftRight( false, false, -90.75, 90.75 )
	ApothiconServant:setTopBottom( false, true, -33.63, -13.63 )
	ApothiconServant:setRGB( 1, 0.87, 0.72 )
	ApothiconServant:setText( Engine.Localize( "ZMUI_ZOD_INV_ID" ) )
	ApothiconServant:setTTF( "fonts/CHARB__.TTF" )
	ApothiconServant:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	ApothiconServant:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( ApothiconServant )
	self.ApothiconServant = ApothiconServant
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				LabelBaseLargeIDGun:completeAnimation()
				self.LabelBaseLargeIDGun:setAlpha( 0 )
				self.clipFinished( LabelBaseLargeIDGun, {} )
				ApothiconServant:completeAnimation()
				self.ApothiconServant:setAlpha( 0 )
				self.clipFinished( ApothiconServant, {} )
			end
		},
		Visible = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				LabelBaseLargeIDGun:completeAnimation()
				self.LabelBaseLargeIDGun:setAlpha( 1 )
				self.clipFinished( LabelBaseLargeIDGun, {} )
				ApothiconServant:completeAnimation()
				self.ApothiconServant:setAlpha( 1 )
				self.clipFinished( ApothiconServant, {} )
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

