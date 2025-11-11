CoD.freeCursorUnlockDescriptionInfo = InheritFrom( LUI.UIElement )
CoD.freeCursorUnlockDescriptionInfo.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.freeCursorUnlockDescriptionInfo )
	self.id = "freeCursorUnlockDescriptionInfo"
	self.soundSet = "none"
	self:setLeftRight( 0, 0, 0, 420 )
	self:setTopBottom( 0, 0, 0, 100 )
	
	local BlackBG2 = LUI.UIImage.new()
	BlackBG2:setLeftRight( 0, 1, 0, 0 )
	BlackBG2:setTopBottom( 0, 1, 0, 0 )
	BlackBG2:setRGB( 0.97, 0.92, 0.1 )
	BlackBG2:setAlpha( 0.95 )
	self:addElement( BlackBG2 )
	self.BlackBG2 = BlackBG2
	
	local unlockDescription = LUI.UIText.new()
	unlockDescription:setLeftRight( 0, 0, 20, 400 )
	unlockDescription:setTopBottom( 0, 0, 5, 32 )
	unlockDescription:setRGB( 0, 0, 0 )
	unlockDescription:setTTF( "fonts/default.ttf" )
	unlockDescription:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	unlockDescription:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	unlockDescription:linkToElementModel( self, "unlockDescription", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			unlockDescription:setText( Engine.Localize( modelValue ) )
		end
	end )
	LUI.OverrideFunction_CallOriginalFirst( unlockDescription, "setText", function ( element, text )
		if IsTextEmpty( element ) then
			CollapseFreeCursorElement( self )
		else
			UpdateWidgetHeightToMultilineText( self, element, 5 )
		end
	end )
	self:addElement( unlockDescription )
	self.unlockDescription = unlockDescription
	
	self.resetProperties = function ()
		BlackBG2:completeAnimation()
		unlockDescription:completeAnimation()
		BlackBG2:setRGB( 0.97, 0.92, 0.1 )
		BlackBG2:setAlpha( 0.95 )
		unlockDescription:setAlpha( 1 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 0 )
			end
		},
		Free = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 1 )
				BlackBG2:completeAnimation()
				self.BlackBG2:setRGB( 0, 0.67, 0.93 )
				self.clipFinished( BlackBG2, {} )
			end
		},
		Hidden = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 2 )
				BlackBG2:completeAnimation()
				self.BlackBG2:setAlpha( 0 )
				self.clipFinished( BlackBG2, {} )
				unlockDescription:completeAnimation()
				self.unlockDescription:setAlpha( 0 )
				self.clipFinished( unlockDescription, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "Free",
			condition = function ( menu, element, event )
				return IsSelfModelValueNonEmptyString( element, controller, "unlockDescription" ) and IsSelfModelValueEqualTo( element, controller, "cost", 0 )
			end
		},
		{
			stateName = "Hidden",
			condition = function ( menu, element, event )
				return not IsSelfModelValueNonEmptyString( element, controller, "unlockDescription" )
			end
		}
	} )
	self:linkToElementModel( self, "unlockDescription", true, function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "unlockDescription"
		} )
	end )
	self:linkToElementModel( self, "cost", true, function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "cost"
		} )
	end )
	LUI.OverrideFunction_CallOriginalFirst( self, "setState", function ( element, state )
		CollapseFreeCursorElement( self )
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.unlockDescription:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

