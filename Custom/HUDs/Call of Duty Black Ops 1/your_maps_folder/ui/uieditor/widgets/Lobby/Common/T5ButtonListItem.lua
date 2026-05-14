CoD.T5ButtonListItem = InheritFrom( LUI.UIElement )
CoD.T5ButtonListItem.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.T5ButtonListItem )
	self.id = "T5ButtonListItem"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 322.5 )
	self:setTopBottom( true, false, 0, 25.5 )
	self:makeFocusable()
	self:setHandleMouse( true )
	self.anyChildUsesUpdateState = true

	self.Background = LUI.UIImage.new()
	self.Background:setLeftRight( true, true, 0, 0 )
	self.Background:setTopBottom( true, true, 0, 0 )
	self.Background:setImage( RegisterImage( "$white" ) )
	self:addElement( self.Background )

	self.btnDisplayText = LUI.UIText.new()
	self.btnDisplayText:setLeftRight( true, true, -63, 0 )
	self.btnDisplayText:setTopBottom( true, true, -5 + 2, 4 + 2 )
	self.btnDisplayText:setTTF( "fonts/helvetica_neue_67_medium_cond.ttf" )
	self.btnDisplayText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	self.btnDisplayText:setScale( 0.5 )
	self.btnDisplayText:linkToElementModel( self, "displayText", true, function ( model ) 
		local displayText = Engine.GetModelValue( model )

		if displayText then
			self.btnDisplayText:setText( Engine.Localize( LocalizeToUpperString( displayText ) ) )
		end
	end )
	self:addElement( self.btnDisplayText )
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )

				self.Background:completeAnimation()
				self.Background:setRGB( 0, 0, 0 )
				self.clipFinished( self.Background, {} )

				self.btnDisplayText:completeAnimation()
				self.btnDisplayText:setRGB( 1, 1, 1 )
				self.clipFinished( self.btnDisplayText, {} )
			end,
			Focus = function ()
				self:setupElementClipCounter( 2 )

				self.Background:completeAnimation()
				self.Background:setRGB( 1, 1, 1 )
				self.clipFinished( self.Background, {} )

				self.btnDisplayText:completeAnimation()
				self.btnDisplayText:setRGB( 0, 0, 0 )
				self.clipFinished( self.btnDisplayText, {} )
			end
		}
	}

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.Background:close()
		element.btnDisplayText:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
