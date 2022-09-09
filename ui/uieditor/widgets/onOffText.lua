-- be4349b6d51e112805dcb7794a87440e
-- This hash is used for caching, delete to decompile the file again

CoD.onOffText = InheritFrom( LUI.UIElement )
CoD.onOffText.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( true )
	self:setClass( CoD.onOffText )
	self.id = "onOffText"
	self.soundSet = "none"
	self:setLeftRight( true, false, 0, 500 )
	self:setTopBottom( true, false, 0, 25 )
	
	local lbText = LUI.UIText.new()
	lbText:setLeftRight( true, true, 0, 0 )
	lbText:setTopBottom( true, false, 0, 25 )
	lbText:setText( Engine.Localize( "^BBUTTON_LUI_SHOULDERL^" ) )
	lbText:setTTF( "fonts/default.ttf" )
	lbText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	lbText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( lbText )
	self.lbText = lbText
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )

				lbText:completeAnimation()
				self.lbText:setAlpha( 1 )
				self.clipFinished( lbText, {} )
			end,
			Active = function ()
				self:setupElementClipCounter( 0 )
			end
		},
		Invisible = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )

				lbText:completeAnimation()
				self.lbText:setAlpha( 0 )
				self.clipFinished( lbText, {} )
			end,
			Active = function ()
				self:setupElementClipCounter( 0 )
			end
		},
		HiddenPC = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )

				lbText:completeAnimation()
				self.lbText:setAlpha( 0 )
				self.clipFinished( lbText, {} )
			end
		}
	}

	self:mergeStateConditions( {
		{
			stateName = "Invisible",
			condition = function ( menu, element, event )
				return true
			end
		},
		{
			stateName = "HiddenPC",
			condition = function ( menu, element, event )
				return IsPC() and not IsGamepad( controller )
			end
		}
	} )
	if self.m_eventHandlers.input_source_changed then
		local f1_local2 = self.m_eventHandlers.input_source_changed
		self:registerEventHandler( "input_source_changed", function ( element, event )
			event.menu = event.menu or menu
			element:updateState( event )
			return f1_local2( element, event )
		end )
	else
		self:registerEventHandler( "input_source_changed", LUI.UIElement.updateState )
	end
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
