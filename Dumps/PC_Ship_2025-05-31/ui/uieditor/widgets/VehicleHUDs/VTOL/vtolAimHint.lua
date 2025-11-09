CoD.vtolAimHint = InheritFrom( LUI.UIElement )
CoD.vtolAimHint.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.vtolAimHint )
	self.id = "vtolAimHint"
	self.soundSet = "none"
	self:setLeftRight( true, false, 0, 400 )
	self:setTopBottom( true, false, 0, 50 )
	
	local AimHint = LUI.UIText.new()
	AimHint:setLeftRight( true, false, 6.5, 392.5 )
	AimHint:setTopBottom( true, false, 8, 42 )
	AimHint:setText( Engine.Localize( "CP_MI_CAIRO_AQUIFER_VTOL_AIM_HINT" ) )
	AimHint:setTTF( "fonts/default.ttf" )
	AimHint:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	AimHint:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_MIDDLE )
	self:addElement( AimHint )
	self.AimHint = AimHint
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				AimHint:completeAnimation()
				self.AimHint:setAlpha( 0 )
				self.clipFinished( AimHint, {} )
			end
		},
		Show = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				local AimHintFrame2 = function ( AimHint, event )
					local AimHintFrame3 = function ( AimHint, event )
						if not event.interrupted then
							AimHint:beginAnimation( "keyframe", 250, false, false, CoD.TweenType.Linear )
						end
						AimHint:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( AimHint, event )
						else
							AimHint:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						AimHintFrame3( AimHint, event )
						return 
					else
						AimHint:beginAnimation( "keyframe", 250, false, false, CoD.TweenType.Linear )
						AimHint:setAlpha( 0.25 )
						AimHint:registerEventHandler( "transition_complete_keyframe", AimHintFrame3 )
					end
				end
				
				AimHint:completeAnimation()
				self.AimHint:setAlpha( 1 )
				AimHintFrame2( AimHint, {} )
				self.nextClip = "DefaultClip"
			end
		},
		Hide = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				AimHint:completeAnimation()
				self.AimHint:setAlpha( 0 )
				self.clipFinished( AimHint, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "Show",
			condition = function ( menu, element, event )
				return not IsSelfModelValueNilOrZero( element, controller, "showAimHint" )
			end
		},
		{
			stateName = "Hide",
			condition = function ( menu, element, event )
				return IsSelfModelValueNilOrZero( element, controller, "showAimHint" )
			end
		}
	} )
	self:linkToElementModel( self, "showAimHint", true, function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "showAimHint"
		} )
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

