require( "ui.uieditor.widgets.Border" )

CoD.NotificationRewardWidget = InheritFrom( LUI.UIElement )
CoD.NotificationRewardWidget.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.NotificationRewardWidget )
	self.id = "NotificationRewardWidget"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 256 )
	self:setTopBottom( true, false, 0, 64 )
	
	local Background = LUI.UIImage.new()
	Background:setLeftRight( false, true, -48, 0 )
	Background:setTopBottom( false, false, -24, 24 )
	Background:setRGB( 0.48, 0.48, 0.48 )
	Background:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( Background )
	self.Background = Background
	
	local Image = LUI.UIImage.new()
	Image:setLeftRight( false, true, -48, 0 )
	Image:setTopBottom( false, false, -24, 24 )
	Image:setRGB( 1, 1, 1 )
	Image:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( Image )
	self.Image = Image
	
	local Text = LUI.UIText.new()
	Text:setLeftRight( true, true, 0, -55 )
	Text:setTopBottom( false, false, -10, 10 )
	Text:setRGB( 1, 1, 1 )
	Text:setTTF( "fonts/default.ttf" )
	Text:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_RIGHT )
	Text:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( Text )
	self.Text = Text
	
	local Border = CoD.Border.new( menu, controller )
	Border:setLeftRight( false, true, -48, 0 )
	Border:setTopBottom( false, false, -24, 24 )
	self:addElement( Border )
	self.Border = Border
	
	self.Image:linkToElementModel( self, "icon", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			Image:setImage( RegisterImage( modelValue ) )
		end
	end )
	self.Text:linkToElementModel( self, "title", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			Text:setText( modelValue )
		end
	end )
	self.Border:linkToElementModel( self, "color", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			Border:setRGB( modelValue )
		end
	end )
	self.close = function ( self )
		self.Border:close()
		self.Image:close()
		self.Text:close()
		CoD.NotificationRewardWidget.super.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

