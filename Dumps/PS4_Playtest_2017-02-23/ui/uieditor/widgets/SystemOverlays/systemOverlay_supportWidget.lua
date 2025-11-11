CoD.systemOverlay_supportWidget = InheritFrom( LUI.UIElement )
CoD.systemOverlay_supportWidget.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.systemOverlay_supportWidget )
	self.id = "systemOverlay_supportWidget"
	self.soundSet = "default"
	self:setLeftRight( 0, 0, 0, 306 )
	self:setTopBottom( 0, 0, 0, 36 )
	
	local supportBacking = LUI.UIImage.new()
	supportBacking:setLeftRight( 0, 1, 0, 0 )
	supportBacking:setTopBottom( 0, 0, 0, 36 )
	supportBacking:setAlpha( 0.6 )
	self:addElement( supportBacking )
	self.supportBacking = supportBacking
	
	local supportingText = LUI.UITightText.new()
	supportingText:setLeftRight( 0, 0, 10, 634 )
	supportingText:setTopBottom( 0, 0, 0, 36 )
	supportingText:setRGB( 0, 0, 0 )
	supportingText:setTTF( "fonts/default.ttf" )
	supportingText:linkToElementModel( self, "supportText", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			supportingText:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( supportingText )
	self.supportingText = supportingText
	
	self.resetProperties = function ()
		supportingText:completeAnimation()
		supportBacking:completeAnimation()
		supportingText:setAlpha( 1 )
		supportBacking:setAlpha( 0.6 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 0 )
			end
		},
		NoSupport = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 2 )
				supportBacking:completeAnimation()
				self.supportBacking:setAlpha( 0 )
				self.clipFinished( supportBacking, {} )
				supportingText:completeAnimation()
				self.supportingText:setAlpha( 0 )
				self.clipFinished( supportingText, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "NoSupport",
			condition = function ( menu, element, event )
				return not IsSelfModelValueNonEmptyString( element, controller, "supportText" )
			end
		}
	} )
	self:linkToElementModel( self, "supportText", true, function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "supportText"
		} )
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.supportingText:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

