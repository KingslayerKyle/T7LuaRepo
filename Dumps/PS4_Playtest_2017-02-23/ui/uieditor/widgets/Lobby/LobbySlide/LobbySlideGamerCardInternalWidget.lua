require( "ui.uieditor.widgets.CallingCards.CallingCards_FrameWidget" )

CoD.LobbySlideGamerCardInternalWidget = InheritFrom( LUI.UIElement )
CoD.LobbySlideGamerCardInternalWidget.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.LobbySlideGamerCardInternalWidget )
	self.id = "LobbySlideGamerCardInternalWidget"
	self.soundSet = "ModeSelection"
	self:setLeftRight( 0, 0, 0, 510 )
	self:setTopBottom( 0, 0, 0, 150 )
	self.anyChildUsesUpdateState = true
	
	local CallingCardsFrameWidget = CoD.CallingCards_FrameWidget.new( menu, controller )
	CallingCardsFrameWidget:setLeftRight( 0.5, 0.5, -6, 0 )
	CallingCardsFrameWidget:setTopBottom( 0.5, 0.5, 0, 0 )
	CallingCardsFrameWidget.CardIconFrame:setScale( 0.67 )
	CallingCardsFrameWidget:linkToElementModel( self, nil, false, function ( model )
		CallingCardsFrameWidget:setModel( model, controller )
	end )
	self:addElement( CallingCardsFrameWidget )
	self.CallingCardsFrameWidget = CallingCardsFrameWidget
	
	self.resetProperties = function ()
		CallingCardsFrameWidget:completeAnimation()
		CallingCardsFrameWidget:setAlpha( 1 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 0 )
			end,
			SlideLeft = function ()
				self.resetProperties()
				self:setupElementClipCounter( 0 )
			end,
			SlideRight = function ()
				self.resetProperties()
				self:setupElementClipCounter( 0 )
			end
		},
		Invisible = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 1 )
				CallingCardsFrameWidget:completeAnimation()
				self.CallingCardsFrameWidget:setAlpha( 0 )
				self.clipFinished( CallingCardsFrameWidget, {} )
			end
		}
	}
	CallingCardsFrameWidget.id = "CallingCardsFrameWidget"
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.CallingCardsFrameWidget:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

