require( "ui.uieditor.widgets.Lobby.Common.FE_ButtonPanelShaderContainer" )

CoD.LobbyMemberBubbleGumBuffs = InheritFrom( LUI.UIElement )
CoD.LobbyMemberBubbleGumBuffs.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.LobbyMemberBubbleGumBuffs )
	self.id = "LobbyMemberBubbleGumBuffs"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 348 )
	self:setTopBottom( true, false, 0, 64 )
	self.anyChildUsesUpdateState = true
	
	local FEButtonPanelShaderContainer0 = CoD.FE_ButtonPanelShaderContainer.new( menu, controller )
	FEButtonPanelShaderContainer0:setLeftRight( true, true, 0, 0 )
	FEButtonPanelShaderContainer0:setTopBottom( true, true, 0, 0 )
	self:addElement( FEButtonPanelShaderContainer0 )
	self.FEButtonPanelShaderContainer0 = FEButtonPanelShaderContainer0
	
	local BackgroundImage = LUI.UIImage.new()
	BackgroundImage:setLeftRight( true, true, 0, 0 )
	BackgroundImage:setTopBottom( true, true, 0, 0 )
	BackgroundImage:setRGB( 0.37, 0.37, 0.37 )
	BackgroundImage:setAlpha( 0.25 )
	self:addElement( BackgroundImage )
	self.BackgroundImage = BackgroundImage
	
	local BubbleGumBuff1 = LUI.UIImage.new()
	BubbleGumBuff1:setLeftRight( false, false, -160, -96 )
	BubbleGumBuff1:setTopBottom( false, false, -32, 32 )
	BubbleGumBuff1:linkToElementModel( self, "bgb1ItemIndex", true, function ( model )
		local bgb1ItemIndex = Engine.GetModelValue( model )
		if bgb1ItemIndex then
			BubbleGumBuff1:setImage( RegisterImage( GetItemImageFromIndex( bgb1ItemIndex ) ) )
		end
	end )
	self:addElement( BubbleGumBuff1 )
	self.BubbleGumBuff1 = BubbleGumBuff1
	
	local BubbleGumBuff2 = LUI.UIImage.new()
	BubbleGumBuff2:setLeftRight( false, false, -96, -32 )
	BubbleGumBuff2:setTopBottom( false, false, -32, 32 )
	BubbleGumBuff2:linkToElementModel( self, "bgb2ItemIndex", true, function ( model )
		local bgb2ItemIndex = Engine.GetModelValue( model )
		if bgb2ItemIndex then
			BubbleGumBuff2:setImage( RegisterImage( GetItemImageFromIndex( bgb2ItemIndex ) ) )
		end
	end )
	self:addElement( BubbleGumBuff2 )
	self.BubbleGumBuff2 = BubbleGumBuff2
	
	local BubbleGumBuff3 = LUI.UIImage.new()
	BubbleGumBuff3:setLeftRight( false, false, -32, 32 )
	BubbleGumBuff3:setTopBottom( false, false, -32, 32 )
	BubbleGumBuff3:linkToElementModel( self, "bgb3ItemIndex", true, function ( model )
		local bgb3ItemIndex = Engine.GetModelValue( model )
		if bgb3ItemIndex then
			BubbleGumBuff3:setImage( RegisterImage( GetItemImageFromIndex( bgb3ItemIndex ) ) )
		end
	end )
	self:addElement( BubbleGumBuff3 )
	self.BubbleGumBuff3 = BubbleGumBuff3
	
	local BubbleGumBuff4 = LUI.UIImage.new()
	BubbleGumBuff4:setLeftRight( false, false, 32, 96 )
	BubbleGumBuff4:setTopBottom( false, false, -32, 32 )
	BubbleGumBuff4:linkToElementModel( self, "bgb4ItemIndex", true, function ( model )
		local bgb4ItemIndex = Engine.GetModelValue( model )
		if bgb4ItemIndex then
			BubbleGumBuff4:setImage( RegisterImage( GetItemImageFromIndex( bgb4ItemIndex ) ) )
		end
	end )
	self:addElement( BubbleGumBuff4 )
	self.BubbleGumBuff4 = BubbleGumBuff4
	
	local BubbleGumBuff5 = LUI.UIImage.new()
	BubbleGumBuff5:setLeftRight( false, false, 96, 160 )
	BubbleGumBuff5:setTopBottom( false, false, -32, 32 )
	BubbleGumBuff5:linkToElementModel( self, "bgb5ItemIndex", true, function ( model )
		local bgb5ItemIndex = Engine.GetModelValue( model )
		if bgb5ItemIndex then
			BubbleGumBuff5:setImage( RegisterImage( GetItemImageFromIndex( bgb5ItemIndex ) ) )
		end
	end )
	self:addElement( BubbleGumBuff5 )
	self.BubbleGumBuff5 = BubbleGumBuff5
	
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.FEButtonPanelShaderContainer0:close()
		element.BubbleGumBuff1:close()
		element.BubbleGumBuff2:close()
		element.BubbleGumBuff3:close()
		element.BubbleGumBuff4:close()
		element.BubbleGumBuff5:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

