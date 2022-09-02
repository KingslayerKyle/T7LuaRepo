-- cfe3ff2dee54f5e45ae3244e778ba42e
-- This hash is used for caching, delete to decompile the file again

CoD.weakpoint_NewHex = InheritFrom( LUI.UIElement )
CoD.weakpoint_NewHex.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.weakpoint_NewHex )
	self.id = "weakpoint_NewHex"
	self.soundSet = "HUD"
	self:setLeftRight( true, false, 0, 516 )
	self:setTopBottom( true, false, 0, 468 )
	
	local NewHex = LUI.UIImage.new()
	NewHex:setLeftRight( true, true, 64.5, -64.5 )
	NewHex:setTopBottom( true, true, 58.5, -58.5 )
	NewHex:setAlpha( RandomAddPercent( -100, 1 ) )
	NewHex:setImage( RegisterImage( "uie_t7_cp_hud_weakpoint_newhex" ) )
	NewHex:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( NewHex )
	self.NewHex = NewHex
	
	local NewHex0 = LUI.UIImage.new()
	NewHex0:setLeftRight( true, true, 64.5, -64.5 )
	NewHex0:setTopBottom( true, true, 58.5, -58.5 )
	NewHex0:setZoom( 200 )
	NewHex0:setImage( RegisterImage( "uie_t7_cp_hud_weakpoint_newhexblur" ) )
	NewHex0:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( NewHex0 )
	self.NewHex0 = NewHex0
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )

				local NewHexFrame2 = function ( NewHex, event )
					if not event.interrupted then
						NewHex:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
					end
					NewHex:setAlpha( RandomAddPercent( -100, 1 ) )
					if event.interrupted then
						self.clipFinished( NewHex, event )
					else
						NewHex:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				NewHex:completeAnimation()
				self.NewHex:setAlpha( RandomAddPercent( -100, 1 ) )
				NewHexFrame2( NewHex, {} )

				self.nextClip = "DefaultClip"
			end,
			Close = function ()
				self:setupElementClipCounter( 0 )

			end,
			Medium = function ()
				self:setupElementClipCounter( 0 )

			end,
			Far = function ()
				self:setupElementClipCounter( 0 )

			end,
			Obscured = function ()
				self:setupElementClipCounter( 0 )

			end
		},
		Close = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )

			end,
			DefaultState = function ()
				self:setupElementClipCounter( 0 )

			end,
			Medium = function ()
				self:setupElementClipCounter( 0 )

			end,
			Far = function ()
				self:setupElementClipCounter( 0 )

			end,
			Obscured = function ()
				self:setupElementClipCounter( 0 )

			end
		},
		Medium = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )

			end,
			DefaultState = function ()
				self:setupElementClipCounter( 0 )

			end,
			Close = function ()
				self:setupElementClipCounter( 0 )

			end,
			Far = function ()
				self:setupElementClipCounter( 0 )

			end,
			Obscured = function ()
				self:setupElementClipCounter( 0 )

			end
		},
		Far = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )

			end,
			DefaultState = function ()
				self:setupElementClipCounter( 0 )

			end,
			Close = function ()
				self:setupElementClipCounter( 0 )

			end,
			Medium = function ()
				self:setupElementClipCounter( 0 )

			end,
			Obscured = function ()
				self:setupElementClipCounter( 0 )

			end
		},
		Obscured = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )

			end,
			DefaultState = function ()
				self:setupElementClipCounter( 0 )

			end,
			Close = function ()
				self:setupElementClipCounter( 0 )

			end,
			Medium = function ()
				self:setupElementClipCounter( 0 )

			end,
			Far = function ()
				self:setupElementClipCounter( 0 )

			end
		}
	}

	self:mergeStateConditions( {
		{
			stateName = "Close",
			condition = function ( menu, element, event )
				return IsSelfModelValueEqualToEnum( element, controller, "status", Enum.WeakpointWidgetStates.WEAKPOINT_STATE_CLOSE )
			end
		},
		{
			stateName = "Medium",
			condition = function ( menu, element, event )
				return IsSelfModelValueEqualToEnum( element, controller, "status", Enum.WeakpointWidgetStates.WEAKPOINT_STATE_MEDIUM )
			end
		},
		{
			stateName = "Far",
			condition = function ( menu, element, event )
				return IsSelfModelValueEqualToEnum( element, controller, "status", Enum.WeakpointWidgetStates.WEAKPOINT_STATE_FAR )
			end
		},
		{
			stateName = "Obscured",
			condition = function ( menu, element, event )
				return IsSelfModelValueEqualToEnum( element, controller, "status", Enum.WeakpointWidgetStates.WEAKPOINT_STATE_OBSCURED )
			end
		}
	} )
	self:linkToElementModel( self, "status", true, function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "status"
		} )
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

