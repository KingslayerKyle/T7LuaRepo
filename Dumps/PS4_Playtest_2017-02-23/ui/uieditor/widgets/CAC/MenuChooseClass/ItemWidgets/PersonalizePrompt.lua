CoD.PersonalizePrompt = InheritFrom( LUI.UIElement )
CoD.PersonalizePrompt.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.PersonalizePrompt )
	self.id = "PersonalizePrompt"
	self.soundSet = "CAC"
	self:setLeftRight( 0, 0, 0, 184 )
	self:setTopBottom( 0, 0, 0, 30 )
	
	local Panel = LUI.UIImage.new()
	Panel:setLeftRight( 0, 1, -12, 12 )
	Panel:setTopBottom( 0.5, 0.5, -18, 18 )
	Panel:setRGB( 0, 0, 0 )
	Panel:setAlpha( 0.7 )
	Panel:setImage( RegisterImage( "uie_t7_menu_frontend_listheaderpanelfull" ) )
	Panel:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_nineslice_normal" ) )
	Panel:setShaderVector( 0, 0, 0, 0, 0 )
	Panel:setupNineSliceShader( 24, 6 )
	self:addElement( Panel )
	self.Panel = Panel
	
	local promptText = LUI.UIText.new()
	promptText:setLeftRight( 0, 1, 8, 0 )
	promptText:setTopBottom( 0.5, 0.5, -12, 12 )
	promptText:setRGB( 0.82, 0.85, 0.88 )
	promptText:setText( Engine.Localize( "MPUI_BUTTON_PERSONALIZE_CAPS" ) )
	promptText:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	promptText:setLetterSpacing( 0.5 )
	promptText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	promptText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( promptText )
	self.promptText = promptText
	
	self.resetProperties = function ()
		promptText:completeAnimation()
		Panel:completeAnimation()
		promptText:setAlpha( 1 )
		Panel:setAlpha( 0.7 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 0 )
			end
		},
		NotVisible = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 2 )
				Panel:completeAnimation()
				self.Panel:setAlpha( 0 )
				self.clipFinished( Panel, {} )
				promptText:completeAnimation()
				self.promptText:setAlpha( 0 )
				self.clipFinished( promptText, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "NotVisible",
			condition = function ( menu, element, event )
				return HidePersonalizePrompt( controller )
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
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

