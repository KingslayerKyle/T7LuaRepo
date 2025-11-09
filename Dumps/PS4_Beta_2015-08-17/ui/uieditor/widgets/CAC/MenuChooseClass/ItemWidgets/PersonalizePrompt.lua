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
	self:setLeftRight( true, false, 0, 123 )
	self:setTopBottom( true, false, 0, 20 )
	
	local Panel = LUI.UIImage.new()
	Panel:setLeftRight( true, true, -8, 8 )
	Panel:setTopBottom( false, false, -12, 12 )
	Panel:setRGB( 0, 0, 0 )
	Panel:setAlpha( 0.7 )
	Panel:setImage( RegisterImage( "uie_t7_menu_frontend_listheaderpanelfull" ) )
	Panel:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_nineslice_normal" ) )
	Panel:setShaderVector( 0, 0.12, 0.17, 0, 0 )
	Panel:setupNineSliceShader( 16, 4 )
	self:addElement( Panel )
	self.Panel = Panel
	
	local promptText = LUI.UIText.new()
	promptText:setLeftRight( true, true, 5.18, 0 )
	promptText:setTopBottom( false, false, -8, 8 )
	promptText:setRGB( 0.82, 0.85, 0.88 )
	promptText:setText( Engine.Localize( "MPUI_BUTTON_PERSONALIZE_CAPS" ) )
	promptText:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	promptText:setLetterSpacing( 0.5 )
	promptText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	promptText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( promptText )
	self.promptText = promptText
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				Panel:completeAnimation()
				self.Panel:setAlpha( 0.7 )
				self.clipFinished( Panel, {} )
				promptText:completeAnimation()
				self.promptText:setAlpha( 1 )
				self.clipFinished( promptText, {} )
			end
		},
		NotVisible = {
			DefaultClip = function ()
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

