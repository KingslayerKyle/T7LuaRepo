-- 885eee980a495cd925914231befda334
-- This hash is used for caching, delete to decompile the file again

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
	self:setLeftRight( true, false, 0, 204 )
	self:setTopBottom( true, false, 0, 24 )
	
	local supportBacking = LUI.UIImage.new()
	supportBacking:setLeftRight( true, true, 0, 0 )
	supportBacking:setTopBottom( true, false, 0, 24 )
	supportBacking:setAlpha( 0.6 )
	self:addElement( supportBacking )
	self.supportBacking = supportBacking
	
	local supportingText = LUI.UITightText.new()
	supportingText:setLeftRight( true, false, 7, 423 )
	supportingText:setTopBottom( true, false, 0, 24 )
	supportingText:setRGB( 0, 0, 0 )
	supportingText:setTTF( "fonts/default.ttf" )
	supportingText:linkToElementModel( self, "supportText", true, function ( model )
		local supportText = Engine.GetModelValue( model )
		if supportText then
			supportingText:setText( Engine.Localize( supportText ) )
		end
	end )
	self:addElement( supportingText )
	self.supportingText = supportingText
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )

				supportBacking:completeAnimation()
				self.supportBacking:setAlpha( 0.6 )
				self.clipFinished( supportBacking, {} )

				supportingText:completeAnimation()
				self.supportingText:setAlpha( 1 )
				self.clipFinished( supportingText, {} )
			end
		},
		NoSupport = {
			DefaultClip = function ()
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

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.supportingText:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

