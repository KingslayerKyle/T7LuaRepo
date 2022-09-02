-- d881c11822353b890433ec1237e69b72
-- This hash is used for caching, delete to decompile the file again

local PostLoadFunc = function ( f1_arg0, f1_arg1 )
	f1_arg0:setHandleMouse( true )

	LUI.OverrideFunction_CallOriginalSecond( f1_arg0, "playClip", function ( element, f2_arg1 )
		if f2_arg1 == "Over" then
			element:playSound( "gain_focus" )
		end
	end )
end

CoD.CycleOverButton = InheritFrom( LUI.UIElement )
CoD.CycleOverButton.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.CycleOverButton )
	self.id = "CycleOverButton"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 40 )
	self:setTopBottom( true, false, 0, 40 )
	
	local arrowL = LUI.UIImage.new()
	arrowL:setLeftRight( false, false, -13, 13 )
	arrowL:setTopBottom( false, false, -13, 13 )
	arrowL:setZRot( -90 )
	arrowL:setImage( RegisterImage( "uie_t7_cp_hud_tacmode_arrow" ) )
	arrowL:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( arrowL )
	self.arrowL = arrowL
	
	local HexLeft = LUI.UIImage.new()
	HexLeft:setLeftRight( false, false, -13, 13 )
	HexLeft:setTopBottom( false, false, -13, 13 )
	HexLeft:setAlpha( 0.2 )
	HexLeft:setZRot( -90 )
	HexLeft:setImage( RegisterImage( "uie_t7_cp_hud_abilitywheel_iconhex" ) )
	HexLeft:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( HexLeft )
	self.HexLeft = HexLeft
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )

				arrowL:beginAnimation( "keyframe", 239, false, false, CoD.TweenType.Linear )
				arrowL:setRGB( 1, 1, 1 )
				arrowL:registerEventHandler( "transition_complete_keyframe", self.clipFinished )

				HexLeft:completeAnimation()
				self.HexLeft:setAlpha( 0 )
				self.clipFinished( HexLeft, {} )
			end
		},
		KMouse = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )

				arrowL:completeAnimation()
				self.arrowL:setLeftRight( false, false, -13, 13 )
				self.arrowL:setTopBottom( false, false, -13, 13 )
				self.arrowL:setRGB( 1, 1, 1 )
				self.clipFinished( arrowL, {} )

				HexLeft:completeAnimation()
				self.HexLeft:setLeftRight( false, false, -13, 13 )
				self.HexLeft:setTopBottom( false, false, -13, 13 )
				self.HexLeft:setRGB( 1, 1, 1 )
				self.HexLeft:setAlpha( 1 )
				self.clipFinished( HexLeft, {} )
			end,
			Over = function ()
				self:setupElementClipCounter( 2 )

				arrowL:completeAnimation()
				self.arrowL:setLeftRight( false, false, -20, 20 )
				self.arrowL:setTopBottom( false, false, -20, 20 )
				self.arrowL:setRGB( ColorSet.Orange.r, ColorSet.Orange.g, ColorSet.Orange.b )
				self.clipFinished( arrowL, {} )

				HexLeft:completeAnimation()
				self.HexLeft:setLeftRight( false, false, -20, 20 )
				self.HexLeft:setTopBottom( false, false, -20, 20 )
				self.HexLeft:setRGB( ColorSet.Orange.r, ColorSet.Orange.g, ColorSet.Orange.b )
				self.HexLeft:setAlpha( 1 )
				self.clipFinished( HexLeft, {} )
			end
		}
	}

	self:mergeStateConditions( {
		{
			stateName = "KMouse",
			condition = function ( menu, element, event )
				return not IsGamepad( controller )
			end
		}
	} )
	if self.m_eventHandlers.input_source_changed then
		local f3_local3 = self.m_eventHandlers.input_source_changed
		self:registerEventHandler( "input_source_changed", function ( element, event )
			event.menu = event.menu or menu
			element:updateState( event )
			return f3_local3( element, event )
		end )
	else
		self:registerEventHandler( "input_source_changed", LUI.UIElement.updateState )
	end
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "LastInput" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "LastInput"
		} )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

