-- fe02ef1399559f6caf9805eb7a77ec55
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.Border" )

CoD.JoinButtonPrompt = InheritFrom( LUI.UIElement )
CoD.JoinButtonPrompt.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.JoinButtonPrompt )
	self.id = "JoinButtonPrompt"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 26 )
	self:setTopBottom( true, false, 0, 26 )
	
	local GpadButtonImage = LUI.UIImage.new()
	GpadButtonImage:setLeftRight( true, false, 0, 26 )
	GpadButtonImage:setTopBottom( true, false, 0, 26 )
	GpadButtonImage:subscribeToGlobalModel( controller, "Controller", "alt1_button_image", function ( model )
		local alt1ButtonImage = Engine.GetModelValue( model )
		if alt1ButtonImage then
			GpadButtonImage:setImage( RegisterImage( alt1ButtonImage ) )
		end
	end )
	self:addElement( GpadButtonImage )
	self.GpadButtonImage = GpadButtonImage
	
	local KMprompt = LUI.UIText.new()
	KMprompt:setLeftRight( false, true, -26, 0 )
	KMprompt:setTopBottom( true, false, 0, 26 )
	KMprompt:setAlpha( 0 )
	KMprompt:setText( Engine.Localize( "J" ) )
	KMprompt:setTTF( "fonts/default.ttf" )
	KMprompt:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	KMprompt:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( KMprompt )
	self.KMprompt = KMprompt
	
	local Border = CoD.Border.new( menu, controller )
	Border:setLeftRight( true, true, 0, 0 )
	Border:setTopBottom( true, true, 0, 0 )
	Border:setRGB( 0.79, 0.78, 0.78 )
	self:addElement( Border )
	self.Border = Border
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 3 )

				GpadButtonImage:completeAnimation()
				self.GpadButtonImage:setAlpha( 1 )
				self.clipFinished( GpadButtonImage, {} )

				KMprompt:completeAnimation()
				self.KMprompt:setAlpha( 0 )
				self.clipFinished( KMprompt, {} )

				Border:completeAnimation()
				self.Border:setAlpha( 0 )
				self.clipFinished( Border, {} )
			end
		},
		KBMouse = {
			DefaultClip = function ()
				self:setupElementClipCounter( 3 )

				GpadButtonImage:completeAnimation()
				self.GpadButtonImage:setAlpha( 0 )
				self.clipFinished( GpadButtonImage, {} )

				KMprompt:completeAnimation()
				self.KMprompt:setAlpha( 1 )
				self.clipFinished( KMprompt, {} )

				Border:completeAnimation()
				self.Border:setAlpha( 1 )
				self.clipFinished( Border, {} )
			end
		}
	}

	self:mergeStateConditions( {
		{
			stateName = "KBMouse",
			condition = function ( menu, element, event )
				return not IsGamepad( controller )
			end
		}
	} )
	if self.m_eventHandlers.input_source_changed then
		local f1_local4 = self.m_eventHandlers.input_source_changed
		self:registerEventHandler( "input_source_changed", function ( element, event )
			event.menu = event.menu or menu
			element:updateState( event )
			return f1_local4( element, event )
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

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.Border:close()
		element.GpadButtonImage:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

