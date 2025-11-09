require( "ui.uieditor.widgets.CallingCards.CallingCards_FrameWidget" )

CoD.BM_Contracts_SideBetCallingCard = InheritFrom( LUI.UIElement )
CoD.BM_Contracts_SideBetCallingCard.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.BM_Contracts_SideBetCallingCard )
	self.id = "BM_Contracts_SideBetCallingCard"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 350 )
	self:setTopBottom( true, false, 0, 92 )
	self.anyChildUsesUpdateState = true
	
	local CallingCardsFrameWidget = CoD.CallingCards_FrameWidget.new( menu, controller )
	CallingCardsFrameWidget:setLeftRight( false, false, 0, 0 )
	CallingCardsFrameWidget:setTopBottom( false, false, -2, -2 )
	CallingCardsFrameWidget:linkToElementModel( self, nil, false, function ( model )
		CallingCardsFrameWidget:setModel( model, controller )
	end )
	self:addElement( CallingCardsFrameWidget )
	self.CallingCardsFrameWidget = CallingCardsFrameWidget
	
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.CallingCardsFrameWidget:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

