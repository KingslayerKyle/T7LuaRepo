CoD.BubbleGumBuffBig = InheritFrom( LUI.UIElement )
CoD.BubbleGumBuffBig.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.BubbleGumBuffBig )
	self.id = "BubbleGumBuffBig"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 128 )
	self:setTopBottom( true, false, 0, 128 )
	
	local Background = LUI.UIImage.new()
	Background:setLeftRight( true, true, 0, 0 )
	Background:setTopBottom( true, true, 0, 0 )
	Background:setRGB( 0.5, 0.5, 0.5 )
	self:addElement( Background )
	self.Background = Background
	
	local BubbleGumBuffImage = LUI.UIImage.new()
	BubbleGumBuffImage:setLeftRight( false, false, -64, 64 )
	BubbleGumBuffImage:setTopBottom( true, false, 0, 128 )
	self:addElement( BubbleGumBuffImage )
	self.BubbleGumBuffImage = BubbleGumBuffImage
	
	local BubbleGumBuffName = LUI.UIText.new()
	BubbleGumBuffName:setLeftRight( true, true, 8, 0 )
	BubbleGumBuffName:setTopBottom( false, true, -38, -8 )
	BubbleGumBuffName:setTTF( "fonts/default.ttf" )
	BubbleGumBuffName:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	BubbleGumBuffName:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_BOTTOM )
	self:addElement( BubbleGumBuffName )
	self.BubbleGumBuffName = BubbleGumBuffName
	
	self.BubbleGumBuffImage:linkToElementModel( self, "itemIndex", true, function ( model )
		local itemIndex = Engine.GetModelValue( model )
		if itemIndex then
			BubbleGumBuffImage:setImage( RegisterImage( GetItemImageFromIndex( itemIndex ) ) )
		end
	end )
	self.BubbleGumBuffName:linkToElementModel( self, "itemIndex", true, function ( model )
		local itemIndex = Engine.GetModelValue( model )
		if itemIndex then
			BubbleGumBuffName:setText( Engine.Localize( GetItemNameFromIndex( itemIndex ) ) )
		end
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.BubbleGumBuffImage:close()
		element.BubbleGumBuffName:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

