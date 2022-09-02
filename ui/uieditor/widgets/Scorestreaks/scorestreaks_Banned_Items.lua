-- 294e1e25965efcd989eeb272d5f310f0
-- This hash is used for caching, delete to decompile the file again

CoD.scorestreaks_Banned_Items = InheritFrom( LUI.UIElement )
CoD.scorestreaks_Banned_Items.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.scorestreaks_Banned_Items )
	self.id = "scorestreaks_Banned_Items"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 208 )
	self:setTopBottom( true, false, 0, 30 )
	
	local textRightAlign = LUI.UIText.new()
	textRightAlign:setLeftRight( true, true, 8, -35 )
	textRightAlign:setTopBottom( false, false, -8, 8 )
	textRightAlign:setText( Engine.Localize( "MENU_ITEMS_BANNED_OR_RESTRICTED" ) )
	textRightAlign:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	textRightAlign:setLetterSpacing( 0.5 )
	textRightAlign:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_RIGHT )
	textRightAlign:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( textRightAlign )
	self.textRightAlign = textRightAlign
	
	local RestrictedWarning = LUI.UIImage.new()
	RestrictedWarning:setLeftRight( true, false, 170.5, 208 )
	RestrictedWarning:setTopBottom( true, false, 0, 30 )
	RestrictedWarning:setScale( 0.9 )
	RestrictedWarning:setImage( RegisterImage( "uie_t7_icon_pregame_warning" ) )
	self:addElement( RestrictedWarning )
	self.RestrictedWarning = RestrictedWarning
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
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
				self:setupElementClipCounter( 2 )

				textRightAlign:completeAnimation()
				self.textRightAlign:setAlpha( 1 )
				self.clipFinished( textRightAlign, {} )

				RestrictedWarning:completeAnimation()
				self.RestrictedWarning:setAlpha( 1 )
				self.clipFinished( RestrictedWarning, {} )
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

