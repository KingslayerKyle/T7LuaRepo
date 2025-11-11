CoD.cac_restriction_warning = InheritFrom( LUI.UIElement )
CoD.cac_restriction_warning.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.cac_restriction_warning )
	self.id = "cac_restriction_warning"
	self.soundSet = "default"
	self:setLeftRight( 0, 0, 0, 312 )
	self:setTopBottom( 0, 0, 0, 45 )
	
	local textRightAlign = LUI.UIText.new()
	textRightAlign:setLeftRight( 0, 1, 12, -52 )
	textRightAlign:setTopBottom( 0.5, 0.5, -12, 12 )
	textRightAlign:setText( Engine.Localize( "MENU_ITEMS_BANNED_OR_RESTRICTED" ) )
	textRightAlign:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	textRightAlign:setLetterSpacing( 0.5 )
	textRightAlign:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_RIGHT )
	textRightAlign:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( textRightAlign )
	self.textRightAlign = textRightAlign
	
	local RestrictedWarning = LUI.UIImage.new()
	RestrictedWarning:setLeftRight( 0, 0, 256, 312 )
	RestrictedWarning:setTopBottom( 0, 0, 0, 45 )
	RestrictedWarning:setScale( 0.9 )
	RestrictedWarning:setImage( RegisterImage( "uie_t7_icon_pregame_warning" ) )
	self:addElement( RestrictedWarning )
	self.RestrictedWarning = RestrictedWarning
	
	self.resetProperties = function ()
		RestrictedWarning:completeAnimation()
		textRightAlign:completeAnimation()
		RestrictedWarning:setAlpha( 1 )
		textRightAlign:setAlpha( 1 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 2 )
				textRightAlign:completeAnimation()
				self.textRightAlign:setAlpha( 0 )
				self.clipFinished( textRightAlign, {} )
				RestrictedWarning:completeAnimation()
				self.RestrictedWarning:setAlpha( 0 )
				self.clipFinished( RestrictedWarning, {} )
			end
		},
		Visible = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 0 )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "Visible",
			condition = function ( menu, element, event )
				return ItemIsBanned( menu, element, controller )
			end
		}
	} )
	self:linkToElementModel( self, nil, true, function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = nil
		} )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot.Pregame.Update" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "lobbyRoot.Pregame.Update"
		} )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

