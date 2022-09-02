-- 5db8b0575cf71af339ec53dcd6975814
-- This hash is used for caching, delete to decompile the file again

CoD.vtolLandHint = InheritFrom( LUI.UIElement )
CoD.vtolLandHint.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.vtolLandHint )
	self.id = "vtolLandHint"
	self.soundSet = "none"
	self:setLeftRight( true, false, 0, 310 )
	self:setTopBottom( true, false, 0, 50 )
	
	local LandHint = LUI.UIText.new()
	LandHint:setLeftRight( true, false, 5.5, 303.5 )
	LandHint:setTopBottom( true, false, 8, 42 )
	LandHint:setText( Engine.Localize( "CP_MI_CAIRO_AQUIFER_VTOL_LAND_HINT" ) )
	LandHint:setTTF( "fonts/default.ttf" )
	LandHint:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	LandHint:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_MIDDLE )
	self:addElement( LandHint )
	self.LandHint = LandHint
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )

				LandHint:completeAnimation()
				self.LandHint:setAlpha( 0 )
				self.clipFinished( LandHint, {} )
			end
		},
		Show = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )

				local LandHintFrame2 = function ( LandHint, event )
					if not event.interrupted then
						LandHint:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Linear )
					end
					LandHint:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( LandHint, event )
					else
						LandHint:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				LandHint:completeAnimation()
				self.LandHint:setAlpha( 0 )
				LandHintFrame2( LandHint, {} )
			end
		},
		Hide = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )

				LandHint:completeAnimation()
				self.LandHint:setAlpha( 0 )
				self.clipFinished( LandHint, {} )
			end
		}
	}

	self:mergeStateConditions( {
		{
			stateName = "Show",
			condition = function ( menu, element, event )
				return not IsSelfModelValueNilOrZero( element, controller, "showLandHint" )
			end
		},
		{
			stateName = "Hide",
			condition = function ( menu, element, event )
				return IsSelfModelValueNilOrZero( element, controller, "showLandHint" )
			end
		}
	} )
	self:linkToElementModel( self, "showLandHint", true, function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "showLandHint"
		} )
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

