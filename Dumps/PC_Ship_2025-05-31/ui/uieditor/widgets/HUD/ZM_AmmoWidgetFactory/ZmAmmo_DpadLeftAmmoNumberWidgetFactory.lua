require( "ui.uieditor.widgets.HUD.ZM_AmmoWidgetFactory.ZmAmmo_DpadLeftAmmoDigitsFactory" )

CoD.ZmAmmo_DpadLeftAmmoNumberWidgetFactory = InheritFrom( LUI.UIElement )
CoD.ZmAmmo_DpadLeftAmmoNumberWidgetFactory.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.ZmAmmo_DpadLeftAmmoNumberWidgetFactory )
	self.id = "ZmAmmo_DpadLeftAmmoNumberWidgetFactory"
	self.soundSet = "HUD"
	self:setLeftRight( true, false, 0, 24 )
	self:setTopBottom( true, false, 0, 24 )
	self.anyChildUsesUpdateState = true
	
	local NumberGlowBackground = LUI.UIImage.new()
	NumberGlowBackground:setLeftRight( true, false, -9.5, 33.5 )
	NumberGlowBackground:setTopBottom( true, false, -6.5, 31 )
	NumberGlowBackground:setImage( RegisterImage( "uie_t7_zm_derriese_hud_ammo_number_glow" ) )
	self:addElement( NumberGlowBackground )
	self.NumberGlowBackground = NumberGlowBackground
	
	local TensDigit = CoD.ZmAmmo_DpadLeftAmmoDigitsFactory.new( menu, controller )
	TensDigit:setLeftRight( true, false, 2.17, 15.17 )
	TensDigit:setTopBottom( true, false, 3, 21 )
	TensDigit:setScale( 1.2 )
	TensDigit:mergeStateConditions( {
		{
			stateName = "Show9",
			condition = function ( menu, element, event )
				return IsModelTensDigitEqualTo( controller, "hudItems.dpadLeftAmmo", 9 )
			end
		},
		{
			stateName = "Show8",
			condition = function ( menu, element, event )
				return IsModelTensDigitEqualTo( controller, "hudItems.dpadLeftAmmo", 8 )
			end
		},
		{
			stateName = "Show7",
			condition = function ( menu, element, event )
				return IsModelTensDigitEqualTo( controller, "hudItems.dpadLeftAmmo", 7 )
			end
		},
		{
			stateName = "Show6",
			condition = function ( menu, element, event )
				return IsModelTensDigitEqualTo( controller, "hudItems.dpadLeftAmmo", 6 )
			end
		},
		{
			stateName = "Show5",
			condition = function ( menu, element, event )
				return IsModelTensDigitEqualTo( controller, "hudItems.dpadLeftAmmo", 5 )
			end
		},
		{
			stateName = "Show4",
			condition = function ( menu, element, event )
				return IsModelTensDigitEqualTo( controller, "hudItems.dpadLeftAmmo", 4 )
			end
		},
		{
			stateName = "Show3",
			condition = function ( menu, element, event )
				return IsModelTensDigitEqualTo( controller, "hudItems.dpadLeftAmmo", 3 )
			end
		},
		{
			stateName = "Show2",
			condition = function ( menu, element, event )
				return IsModelTensDigitEqualTo( controller, "hudItems.dpadLeftAmmo", 2 )
			end
		},
		{
			stateName = "Show1",
			condition = function ( menu, element, event )
				return IsModelTensDigitEqualTo( controller, "hudItems.dpadLeftAmmo", 1 )
			end
		},
		{
			stateName = "Show0",
			condition = function ( menu, element, event )
				return AlwaysFalse()
			end
		},
		{
			stateName = "Faded",
			condition = function ( menu, element, event )
				return AlwaysTrue()
			end
		},
		{
			stateName = "Hidden",
			condition = function ( menu, element, event )
				return AlwaysTrue()
			end
		}
	} )
	TensDigit:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "hudItems.dpadLeftAmmo" ), function ( model )
		menu:updateElementState( TensDigit, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "hudItems.dpadLeftAmmo"
		} )
	end )
	self:addElement( TensDigit )
	self.TensDigit = TensDigit
	
	local OnesDigit = CoD.ZmAmmo_DpadLeftAmmoDigitsFactory.new( menu, controller )
	OnesDigit:setLeftRight( true, false, 10.17, 21.17 )
	OnesDigit:setTopBottom( true, false, 3, 21 )
	OnesDigit:setScale( 1.2 )
	OnesDigit:mergeStateConditions( {
		{
			stateName = "Show9",
			condition = function ( menu, element, event )
				return IsModelOnesDigitEqualTo( controller, "hudItems.dpadLeftAmmo", 9 )
			end
		},
		{
			stateName = "Show8",
			condition = function ( menu, element, event )
				return IsModelOnesDigitEqualTo( controller, "hudItems.dpadLeftAmmo", 8 )
			end
		},
		{
			stateName = "Show7",
			condition = function ( menu, element, event )
				return IsModelOnesDigitEqualTo( controller, "hudItems.dpadLeftAmmo", 7 )
			end
		},
		{
			stateName = "Show6",
			condition = function ( menu, element, event )
				return IsModelOnesDigitEqualTo( controller, "hudItems.dpadLeftAmmo", 6 )
			end
		},
		{
			stateName = "Show5",
			condition = function ( menu, element, event )
				return IsModelOnesDigitEqualTo( controller, "hudItems.dpadLeftAmmo", 5 )
			end
		},
		{
			stateName = "Show4",
			condition = function ( menu, element, event )
				return IsModelOnesDigitEqualTo( controller, "hudItems.dpadLeftAmmo", 4 )
			end
		},
		{
			stateName = "Show3",
			condition = function ( menu, element, event )
				return IsModelOnesDigitEqualTo( controller, "hudItems.dpadLeftAmmo", 3 )
			end
		},
		{
			stateName = "Show2",
			condition = function ( menu, element, event )
				return IsModelOnesDigitEqualTo( controller, "hudItems.dpadLeftAmmo", 2 )
			end
		},
		{
			stateName = "Show1",
			condition = function ( menu, element, event )
				return IsModelOnesDigitEqualTo( controller, "hudItems.dpadLeftAmmo", 1 )
			end
		},
		{
			stateName = "Show0",
			condition = function ( menu, element, event )
				return IsModelOnesDigitEqualTo( controller, "hudItems.dpadLeftAmmo", 0 ) and IsModelValueGreaterThan( controller, "hudItems.dpadLeftAmmo", 0 )
			end
		},
		{
			stateName = "Faded",
			condition = function ( menu, element, event )
				return AlwaysTrue()
			end
		},
		{
			stateName = "Hidden",
			condition = function ( menu, element, event )
				return AlwaysTrue()
			end
		}
	} )
	OnesDigit:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "hudItems.dpadLeftAmmo" ), function ( model )
		menu:updateElementState( OnesDigit, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "hudItems.dpadLeftAmmo"
		} )
	end )
	self:addElement( OnesDigit )
	self.OnesDigit = OnesDigit
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				TensDigit:completeAnimation()
				self.TensDigit:setAlpha( 0 )
				self.clipFinished( TensDigit, {} )
				OnesDigit:completeAnimation()
				self.OnesDigit:setAlpha( 0 )
				self.clipFinished( OnesDigit, {} )
			end
		},
		Visible = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				TensDigit:completeAnimation()
				self.TensDigit:setAlpha( 1 )
				self.clipFinished( TensDigit, {} )
				OnesDigit:completeAnimation()
				self.OnesDigit:setAlpha( 1 )
				self.clipFinished( OnesDigit, {} )
			end
		}
	}
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.TensDigit:close()
		element.OnesDigit:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

