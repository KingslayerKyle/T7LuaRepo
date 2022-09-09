-- d60a2e926a430f3189efcd27143e1510
-- This hash is used for caching, delete to decompile the file again

CoD.PlayerBalanceWidget = InheritFrom( LUI.UIElement )
CoD.PlayerBalanceWidget.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.PlayerBalanceWidget )
	self.id = "PlayerBalanceWidget"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 200 )
	self:setTopBottom( true, false, 0, 100 )
	self:makeFocusable()
	self:setHandleMouse( true )
	
	local BalanceAmount = LUI.UIText.new()
	BalanceAmount:setLeftRight( true, false, 90, 174 )
	BalanceAmount:setTopBottom( true, false, 41, 89 )
	BalanceAmount:setTTF( "fonts/default.ttf" )
	BalanceAmount:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	BalanceAmount:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( BalanceAmount )
	self.BalanceAmount = BalanceAmount
	
	local BalanceId = LUI.UIText.new()
	BalanceId:setLeftRight( true, false, 85, 126 )
	BalanceId:setTopBottom( true, false, 19, 41 )
	BalanceId:setTTF( "fonts/default.ttf" )
	BalanceId:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	BalanceId:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( BalanceId )
	self.BalanceId = BalanceId
	
	local BalanceIdLabel = LUI.UITightText.new()
	BalanceIdLabel:setLeftRight( true, false, 6, 57 )
	BalanceIdLabel:setTopBottom( true, false, 19, 41 )
	BalanceIdLabel:setText( Engine.Localize( "Currency ID:" ) )
	BalanceIdLabel:setTTF( "fonts/default.ttf" )
	self:addElement( BalanceIdLabel )
	self.BalanceIdLabel = BalanceIdLabel
	
	local BalanceAmountLabel = LUI.UITightText.new()
	BalanceAmountLabel:setLeftRight( true, false, 6, 90 )
	BalanceAmountLabel:setTopBottom( true, false, 41, 89 )
	BalanceAmountLabel:setText( Engine.Localize( "Value:" ) )
	BalanceAmountLabel:setTTF( "fonts/default.ttf" )
	self:addElement( BalanceAmountLabel )
	self.BalanceAmountLabel = BalanceAmountLabel
	
	self.BalanceAmount:linkToElementModel( self, "balanceAmount", true, function ( model )
		local balanceAmount = Engine.GetModelValue( model )
		if balanceAmount then
			BalanceAmount:setText( Engine.Localize( ToString( balanceAmount ) ) )
		end
	end )
	self.BalanceId:linkToElementModel( self, "balanceId", true, function ( model )
		local balanceId = Engine.GetModelValue( model )
		if balanceId then
			BalanceId:setText( Engine.Localize( ToString( balanceId ) ) )
		end
	end )

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.BalanceAmount:close()
		element.BalanceId:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
