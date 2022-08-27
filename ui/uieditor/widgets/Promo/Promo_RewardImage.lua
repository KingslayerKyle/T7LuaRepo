-- fca7ee8a34ddd947dddc7672f2a6454d
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.CallingCards.CallingCards_FrameWidget" )

CoD.Promo_RewardImage = InheritFrom( LUI.UIElement )
CoD.Promo_RewardImage.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.Promo_RewardImage )
	self.id = "Promo_RewardImage"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 252 )
	self:setTopBottom( true, false, 0, 63 )
	self.anyChildUsesUpdateState = true
	
	local Image = LUI.UIImage.new()
	Image:setLeftRight( true, false, 0, 252 )
	Image:setTopBottom( true, false, 0, 63 )
	Image:setAlpha( 0.9 )
	self:addElement( Image )
	self.Image = Image
	
	local CallingCardsFrameWidget = CoD.CallingCards_FrameWidget.new( menu, controller )
	CallingCardsFrameWidget:setLeftRight( true, false, -114, 366 )
	CallingCardsFrameWidget:setTopBottom( true, false, -28.5, 91.5 )
	CallingCardsFrameWidget.CardIconFrame:setScale( 0.53 )
	self:addElement( CallingCardsFrameWidget )
	self.CallingCardsFrameWidget = CallingCardsFrameWidget
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				Image:completeAnimation()
				self.Image:setAlpha( 1 )
				self.clipFinished( Image, {} )
				CallingCardsFrameWidget:completeAnimation()
				self.CallingCardsFrameWidget:setAlpha( 0 )
				self.clipFinished( CallingCardsFrameWidget, {} )
			end
		},
		CallingCard = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				Image:completeAnimation()
				self.Image:setAlpha( 0 )
				self.clipFinished( Image, {} )
				CallingCardsFrameWidget:completeAnimation()
				self.CallingCardsFrameWidget:setAlpha( 1 )
				self.clipFinished( CallingCardsFrameWidget, {} )
			end
		}
	}
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.CallingCardsFrameWidget:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

