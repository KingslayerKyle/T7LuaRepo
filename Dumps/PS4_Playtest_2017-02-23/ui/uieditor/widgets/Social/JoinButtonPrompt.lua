if IsPC() then
	require( "ui.uieditor.widgets.Border" )
end
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
	self:setLeftRight( 0, 0, 0, 39 )
	self:setTopBottom( 0, 0, 0, 39 )
	
	local GpadButtonImage = LUI.UIImage.new()
	GpadButtonImage:setLeftRight( 0, 0, 0, 39 )
	GpadButtonImage:setTopBottom( 0, 0, 0, 39 )
	GpadButtonImage:subscribeToGlobalModel( controller, "Controller", "alt1_button_image", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			GpadButtonImage:setImage( RegisterImage( modelValue ) )
		end
	end )
	self:addElement( GpadButtonImage )
	self.GpadButtonImage = GpadButtonImage
	
	local KMprompt = nil
	if IsPC() then
		KMprompt = LUI.UIText.new()
		KMprompt:setLeftRight( 1, 1, -39, 0 )
		KMprompt:setTopBottom( 0, 0, 0, 39 )
		KMprompt:setAlpha( 0 )
		KMprompt:setText( Engine.Localize( "J" ) )
		KMprompt:setTTF( "fonts/default.ttf" )
		KMprompt:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
		KMprompt:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
		self:addElement( KMprompt )
		self.KMprompt = KMprompt
		
	else
		KMprompt = LUI.UIElement.createFake()
		self.KMprompt = KMprompt
	end
	local Border = nil
	if IsPC() then
		Border = CoD.Border.new( menu, controller )
		Border:setLeftRight( 0, 1, 0, 0 )
		Border:setTopBottom( 0, 1, 0, 0 )
		Border:setRGB( 0.79, 0.78, 0.78 )
		self:addElement( Border )
		self.Border = Border
		
	else
		Border = LUI.UIElement.createFake()
		self.Border = Border
	end
	self.resetProperties = function ()
		Border:completeAnimation()
		GpadButtonImage:completeAnimation()
		KMprompt:completeAnimation()
		Border:setAlpha( 1 )
		GpadButtonImage:setAlpha( 1 )
		KMprompt:setAlpha( 0 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( IsPC() and 1 or 0 )
				Border:completeAnimation()
				self.Border:setAlpha( 0 )
				self.clipFinished( Border, {} )
			end
		},
		KBMouse = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( IsPC() and 2 or 1 )
				GpadButtonImage:completeAnimation()
				self.GpadButtonImage:setAlpha( 0 )
				self.clipFinished( GpadButtonImage, {} )
				KMprompt:completeAnimation()
				self.KMprompt:setAlpha( 1 )
				self.clipFinished( KMprompt, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "KBMouse",
			condition = function ( menu, element, event )
				local f6_local0
				if not IsGamepad( controller ) then
					f6_local0 = IsPC()
				else
					f6_local0 = false
				end
				return f6_local0
			end
		}
	} )
	if self.m_eventHandlers.input_source_changed then
		local currentEv = self.m_eventHandlers.input_source_changed
		self:registerEventHandler( "input_source_changed", function ( self, event )
			event.menu = event.menu or menu
			self:updateState( event )
			return currentEv( self, event )
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
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.Border:close()
		self.GpadButtonImage:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

