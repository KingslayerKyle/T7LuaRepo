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
	self:setLeftRight( 0, 0, 0, 300 )
	self:setTopBottom( 0, 0, 0, 150 )
	self:makeFocusable()
	self:setHandleMouse( true )
	
	local BalanceAmount = LUI.UIText.new()
	BalanceAmount:setLeftRight( 0, 0, 135, 261 )
	BalanceAmount:setTopBottom( 0, 0, 62, 134 )
	BalanceAmount:setTTF( "fonts/default.ttf" )
	BalanceAmount:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	BalanceAmount:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( BalanceAmount )
	self.BalanceAmount = BalanceAmount
	
	local BalanceId = LUI.UIText.new()
	BalanceId:setLeftRight( 0, 0, 127, 189 )
	BalanceId:setTopBottom( 0, 0, 29, 62 )
	BalanceId:setTTF( "fonts/default.ttf" )
	BalanceId:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	BalanceId:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( BalanceId )
	self.BalanceId = BalanceId
	
	local BalanceIdLabel = LUI.UITightText.new()
	BalanceIdLabel:setLeftRight( 0, 0, 9, 85 )
	BalanceIdLabel:setTopBottom( 0, 0, 29, 62 )
	BalanceIdLabel:setText( Engine.Localize( "Currency ID:" ) )
	BalanceIdLabel:setTTF( "fonts/default.ttf" )
	self:addElement( BalanceIdLabel )
	self.BalanceIdLabel = BalanceIdLabel
	
	local BalanceAmountLabel = LUI.UITightText.new()
	BalanceAmountLabel:setLeftRight( 0, 0, 9, 135 )
	BalanceAmountLabel:setTopBottom( 0, 0, 62, 134 )
	BalanceAmountLabel:setText( Engine.Localize( "Value:" ) )
	BalanceAmountLabel:setTTF( "fonts/default.ttf" )
	self:addElement( BalanceAmountLabel )
	self.BalanceAmountLabel = BalanceAmountLabel
	
	self.BalanceAmount:linkToElementModel( self, "balanceAmount", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			BalanceAmount:setText( ToString( modelValue ) )
		end
	end )
	self.BalanceId:linkToElementModel( self, "balanceId", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			BalanceId:setText( ToString( modelValue ) )
		end
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.BalanceAmount:close()
		self.BalanceId:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

