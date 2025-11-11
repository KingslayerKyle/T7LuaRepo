CoD.cac_NewTag = InheritFrom( LUI.UIElement )
CoD.cac_NewTag.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.cac_NewTag )
	self.id = "cac_NewTag"
	self.soundSet = "CAC"
	self:setLeftRight( 0, 0, 0, 30 )
	self:setTopBottom( 0, 0, 0, 30 )
	
	local Image0 = LUI.UIImage.new()
	Image0:setLeftRight( 0, 0, 0, 30 )
	Image0:setTopBottom( 0, 0, 0, 30 )
	Image0:setAlpha( 0 )
	Image0:setImage( RegisterImage( "uie_t7_menu_frontend_helptag" ) )
	self:addElement( Image0 )
	self.Image0 = Image0
	
	local TextBox0 = LUI.UIText.new()
	TextBox0:setLeftRight( 0, 0, 2, 28 )
	TextBox0:setTopBottom( 0, 0, 3, 27 )
	TextBox0:setRGB( 0, 0, 0 )
	TextBox0:setAlpha( 0 )
	TextBox0:setText( Engine.Localize( "5" ) )
	TextBox0:setTTF( "fonts/default.ttf" )
	TextBox0:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	TextBox0:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( TextBox0 )
	self.TextBox0 = TextBox0
	
	self.resetProperties = function ()
		TextBox0:completeAnimation()
		Image0:completeAnimation()
		TextBox0:setAlpha( 0 )
		Image0:setAlpha( 0 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 0 )
			end
		},
		Visible = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 2 )
				Image0:completeAnimation()
				self.Image0:setAlpha( 1 )
				self.clipFinished( Image0, {} )
				TextBox0:completeAnimation()
				self.TextBox0:setAlpha( 1 )
				self.clipFinished( TextBox0, {} )
			end,
			GainFocus = function ()
				self.resetProperties()
				self:setupElementClipCounter( 0 )
			end,
			Focus = function ()
				self.resetProperties()
				self:setupElementClipCounter( 0 )
			end,
			LoseFocus = function ()
				self.resetProperties()
				self:setupElementClipCounter( 0 )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "Visible",
			condition = function ( menu, element, event )
				return IsCACItemEquipped( menu, element, controller )
			end
		}
	} )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

