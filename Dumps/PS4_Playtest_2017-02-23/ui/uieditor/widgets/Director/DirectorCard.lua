CoD.DirectorCard = InheritFrom( LUI.UIElement )
CoD.DirectorCard.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.DirectorCard )
	self.id = "DirectorCard"
	self.soundSet = "default"
	self:setLeftRight( 0, 0, 0, 230 )
	self:setTopBottom( 0, 0, 0, 330 )
	self:makeFocusable()
	self:setHandleMouse( true )
	
	local Image2 = LUI.UIImage.new()
	Image2:setLeftRight( 0, 1, 0, 0 )
	Image2:setTopBottom( 0, 1, 0, 0 )
	Image2:setRGB( 0.19, 0.43, 0.26 )
	self:addElement( Image2 )
	self.Image2 = Image2
	
	local TextBox = LUI.UIText.new()
	TextBox:setLeftRight( 0.05, 0.95, 0, 0 )
	TextBox:setTopBottom( 0, 0, 12, 49 )
	TextBox:setTTF( "fonts/default.ttf" )
	TextBox:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	TextBox:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	TextBox:linkToElementModel( self, "name", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			TextBox:setText( modelValue )
		end
	end )
	self:addElement( TextBox )
	self.TextBox = TextBox
	
	local icon = LUI.UIImage.new()
	icon:setLeftRight( 0, 0, 51, 179 )
	icon:setTopBottom( 0, 0, 101, 229 )
	icon:linkToElementModel( self, "icon", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			icon:setImage( RegisterImage( modelValue ) )
		end
	end )
	self:addElement( icon )
	self.icon = icon
	
	self.resetProperties = function ()
		Image2:completeAnimation()
		Image2:setRGB( 0.19, 0.43, 0.26 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 0 )
			end,
			Focus = function ()
				self.resetProperties()
				self:setupElementClipCounter( 1 )
				Image2:completeAnimation()
				self.Image2:setRGB( 0.14, 0.7, 0.29 )
				self.clipFinished( Image2, {} )
			end
		},
		Multiplayer = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 0 )
			end,
			Focus = function ()
				self.resetProperties()
				self:setupElementClipCounter( 1 )
				Image2:completeAnimation()
				self.Image2:setRGB( 0.14, 0.7, 0.29 )
				self.clipFinished( Image2, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "Multiplayer",
			condition = function ( menu, element, event )
				return AlwaysTrue()
			end
		}
	} )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.TextBox:close()
		self.icon:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

