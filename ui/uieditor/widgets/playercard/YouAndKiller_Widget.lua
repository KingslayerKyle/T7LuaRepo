-- ded374bbc9e771e7faa365e4cba17d84
-- This hash is used for caching, delete to decompile the file again

CoD.YouAndKiller_Widget = InheritFrom( LUI.UIElement )
CoD.YouAndKiller_Widget.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.YouAndKiller_Widget )
	self.id = "YouAndKiller_Widget"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 200 )
	self:setTopBottom( true, false, 0, 26 )
	
	local topbarbg = LUI.UIImage.new()
	topbarbg:setLeftRight( true, true, 0, 0 )
	topbarbg:setTopBottom( true, true, 0, 0 )
	topbarbg:setImage( RegisterImage( "uie_img_t7_hud_widget_playercard_topbar_bg" ) )
	self:addElement( topbarbg )
	self.topbarbg = topbarbg
	
	local KillerYouLabels = LUI.UIText.new()
	KillerYouLabels:setLeftRight( true, false, 8, 195 )
	KillerYouLabels:setTopBottom( true, false, 5, 23 )
	KillerYouLabels:setText( Engine.Localize( "MENU_NEW" ) )
	KillerYouLabels:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	KillerYouLabels:setLetterSpacing( 1 )
	KillerYouLabels:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	KillerYouLabels:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( KillerYouLabels )
	self.KillerYouLabels = KillerYouLabels
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )
			end
		},
		Killcam = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )
			end
		},
		NemesisKillcam = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "Killcam",
			condition = function ( menu, element, event )
				return Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_IN_KILLCAM ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_NEMESIS_KILLCAM )
			end
		},
		{
			stateName = "NemesisKillcam",
			condition = function ( menu, element, event )
				return Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_NEMESIS_KILLCAM )
			end
		}
	} )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IN_KILLCAM ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IN_KILLCAM
		} )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_NEMESIS_KILLCAM ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_NEMESIS_KILLCAM
		} )
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

