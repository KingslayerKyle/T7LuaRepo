CoD.BubbleGumBuff = InheritFrom( LUI.UIElement )
CoD.BubbleGumBuff.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.BubbleGumBuff )
	self.id = "BubbleGumBuff"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 64 )
	self:setTopBottom( true, false, 0, 109 )
	
	local BubbleGumBuffImage = LUI.UIImage.new()
	BubbleGumBuffImage:setLeftRight( false, false, -32, 32 )
	BubbleGumBuffImage:setTopBottom( true, false, 0, 64 )
	self:addElement( BubbleGumBuffImage )
	self.BubbleGumBuffImage = BubbleGumBuffImage
	
	local BubbleGumBuffName = LUI.UIText.new()
	BubbleGumBuffName:setLeftRight( false, false, -32, 32 )
	BubbleGumBuffName:setTopBottom( true, false, 70, 89 )
	BubbleGumBuffName:setTTF( "fonts/default.ttf" )
	BubbleGumBuffName:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	BubbleGumBuffName:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
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

