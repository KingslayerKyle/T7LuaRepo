-- d0a670c75368df46d37df7a8074f17d6
-- This hash is used for caching, delete to decompile the file again

CoD.ButtonGenericWithMouseFunc = InheritFrom( LUI.UIElement )
CoD.ButtonGenericWithMouseFunc.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.ButtonGenericWithMouseFunc )
	self.id = "ButtonGenericWithMouseFunc"
	self.soundSet = "HUD"
	self:setLeftRight( true, false, 0, 32 )
	self:setTopBottom( true, false, 0, 32 )
	
	local ButtonIcon = LUI.UIImage.new()
	ButtonIcon:setLeftRight( true, true, 0, 0 )
	ButtonIcon:setTopBottom( true, true, 0, 0 )
	ButtonIcon:setScale( 0.6 )
	ButtonIcon:setImage( RegisterImage( "uie_headicon_dead" ) )
	self:addElement( ButtonIcon )
	self.ButtonIcon = ButtonIcon
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )

				ButtonIcon:completeAnimation()
				self.ButtonIcon:setRGB( 1, 1, 1 )
				self.ButtonIcon:setAlpha( 1 )
				self.clipFinished( ButtonIcon, {} )
			end,
			Over = function ()
				self:setupElementClipCounter( 1 )

				ButtonIcon:completeAnimation()
				self.ButtonIcon:setRGB( 1, 0.41, 0 )
				self.ButtonIcon:setAlpha( 1 )
				self.clipFinished( ButtonIcon, {} )
			end
		},
		Disabled = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )

				ButtonIcon:completeAnimation()
				self.ButtonIcon:setRGB( 1, 1, 1 )
				self.ButtonIcon:setAlpha( 0.75 )
				self.clipFinished( ButtonIcon, {} )
			end
		}
	}

	self:mergeStateConditions( {
		{
			stateName = "Disabled",
			condition = function ( menu, element, event )
				return not ChatClientIsAvailable( self, element, controller )
			end
		}
	} )
	self:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "ChatClientGlobal.update" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "ChatClientGlobal.update"
		} )
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
