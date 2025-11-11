require( "ui.uieditor.widgets.CallingCards.CallingCards_GoldFrame" )

CoD.CallingCards_LegendaryImage = InheritFrom( LUI.UIElement )
CoD.CallingCards_LegendaryImage.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.CallingCards_LegendaryImage )
	self.id = "CallingCards_LegendaryImage"
	self.soundSet = "default"
	self:setLeftRight( 0, 0, 0, 720 )
	self:setTopBottom( 0, 0, 0, 180 )
	self.anyChildUsesUpdateState = true
	
	local CardIcon = LUI.UIImage.new()
	CardIcon:setLeftRight( 0, 1, 0, 0 )
	CardIcon:setTopBottom( 0, 1, 0, 0 )
	CardIcon:setImage( RegisterImage( "uie_t7_icon_callingcard_temp2_lrg" ) )
	CardIcon:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_blend" ) )
	self:addElement( CardIcon )
	self.CardIcon = CardIcon
	
	local CallingCardsGoldFrame = CoD.CallingCards_GoldFrame.new( menu, controller )
	CallingCardsGoldFrame:setLeftRight( 0, 1, 0, 0 )
	CallingCardsGoldFrame:setTopBottom( 0, 1, 0, 0 )
	self:addElement( CallingCardsGoldFrame )
	self.CallingCardsGoldFrame = CallingCardsGoldFrame
	
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.CallingCardsGoldFrame:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

