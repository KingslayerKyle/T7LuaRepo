require( "ui.uieditor.widgets.CAC.cac_ButtonBoxLrgInactive" )
require( "ui.uieditor.widgets.CallingCards.CallingCards_FrameWidget" )
require( "ui.uieditor.widgets.CAC.cac_ButtonBoxLrgInactiveDiags" )
require( "ui.uieditor.widgets.CAC.cac_lock" )

CoD.BM_Contracts_CC_AAR_Widget = InheritFrom( LUI.UIElement )
CoD.BM_Contracts_CC_AAR_Widget.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.BM_Contracts_CC_AAR_Widget )
	self.id = "BM_Contracts_CC_AAR_Widget"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 350 )
	self:setTopBottom( true, false, 0, 176 )
	self.anyChildUsesUpdateState = true
	
	local CardcompletedDescription = LUI.UIText.new()
	CardcompletedDescription:setLeftRight( true, false, 30, 307.25 )
	CardcompletedDescription:setTopBottom( true, false, 97.23, 115.23 )
	CardcompletedDescription:setRGB( 0.75, 0.75, 0.75 )
	CardcompletedDescription:setText( Engine.Localize( "BLACKJACK_CHALLENGE_SIDE_BET_DESC" ) )
	CardcompletedDescription:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	CardcompletedDescription:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	CardcompletedDescription:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( CardcompletedDescription )
	self.CardcompletedDescription = CardcompletedDescription
	
	local BoxButtonLrgInactive = CoD.cac_ButtonBoxLrgInactive.new( menu, controller )
	BoxButtonLrgInactive:setLeftRight( false, true, -322, -28 )
	BoxButtonLrgInactive:setTopBottom( true, false, 12, 89 )
	self:addElement( BoxButtonLrgInactive )
	self.BoxButtonLrgInactive = BoxButtonLrgInactive
	
	local CallingCardsFrameWidget = CoD.CallingCards_FrameWidget.new( menu, controller )
	CallingCardsFrameWidget:setLeftRight( false, false, 0, 0 )
	CallingCardsFrameWidget:setTopBottom( false, false, -38, -38 )
	CallingCardsFrameWidget:setAlpha( 0.4 )
	CallingCardsFrameWidget.CardIconFrame:setScale( 0.6 )
	CallingCardsFrameWidget:linkToElementModel( self, nil, false, function ( model )
		CallingCardsFrameWidget:setModel( model, controller )
	end )
	self:addElement( CallingCardsFrameWidget )
	self.CallingCardsFrameWidget = CallingCardsFrameWidget
	
	local BoxButtonLrgInactiveDiag = CoD.cac_ButtonBoxLrgInactiveDiags.new( menu, controller )
	BoxButtonLrgInactiveDiag:setLeftRight( false, true, -322, -28 )
	BoxButtonLrgInactiveDiag:setTopBottom( true, false, 11, 88 )
	BoxButtonLrgInactiveDiag:setAlpha( 0.53 )
	self:addElement( BoxButtonLrgInactiveDiag )
	self.BoxButtonLrgInactiveDiag = BoxButtonLrgInactiveDiag
	
	local TitleBg = LUI.UIImage.new()
	TitleBg:setLeftRight( false, true, -316, -36.75 )
	TitleBg:setTopBottom( true, false, 35.55, 65.45 )
	TitleBg:setRGB( 0, 0, 0 )
	TitleBg:setAlpha( 0.4 )
	TitleBg:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_edges" ) )
	TitleBg:setShaderVector( 0, 0.02, 0.02, 0.02, 0.02 )
	self:addElement( TitleBg )
	self.TitleBg = TitleBg
	
	local LockedIcon = CoD.cac_lock.new( menu, controller )
	LockedIcon:setLeftRight( false, true, -187.23, -156.78 )
	LockedIcon:setTopBottom( true, false, 36.01, 66.46 )
	self:addElement( LockedIcon )
	self.LockedIcon = LockedIcon
	
	local featlineleft000 = LUI.UIImage.new()
	featlineleft000:setLeftRight( false, true, -175.1, -171.1 )
	featlineleft000:setTopBottom( true, false, -133, 204 )
	featlineleft000:setAlpha( 0.5 )
	featlineleft000:setZRot( -90 )
	featlineleft000:setScale( 0.85 )
	featlineleft000:setImage( RegisterImage( "uie_t7_menu_frontend_featuredlline" ) )
	featlineleft000:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( featlineleft000 )
	self.featlineleft000 = featlineleft000
	
	local featlineleft0000 = LUI.UIImage.new()
	featlineleft0000:setLeftRight( false, true, -174, -171 )
	featlineleft0000:setTopBottom( true, false, -103.95, 235.05 )
	featlineleft0000:setAlpha( 0.5 )
	featlineleft0000:setZRot( -90 )
	featlineleft0000:setScale( 0.85 )
	featlineleft0000:setImage( RegisterImage( "uie_t7_menu_frontend_featuredlline" ) )
	featlineleft0000:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( featlineleft0000 )
	self.featlineleft0000 = featlineleft0000
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 8 )
				CardcompletedDescription:completeAnimation()
				self.CardcompletedDescription:setText( Engine.Localize( "BLACKJACK_CHALLENGE_SIDE_BET_DESC" ) )
				self.clipFinished( CardcompletedDescription, {} )
				BoxButtonLrgInactive:completeAnimation()
				self.BoxButtonLrgInactive:setAlpha( 1 )
				self.clipFinished( BoxButtonLrgInactive, {} )
				CallingCardsFrameWidget:completeAnimation()
				self.CallingCardsFrameWidget:setAlpha( 1 )
				self.clipFinished( CallingCardsFrameWidget, {} )
				BoxButtonLrgInactiveDiag:completeAnimation()
				self.BoxButtonLrgInactiveDiag:setLeftRight( false, true, -315, -36.75 )
				self.BoxButtonLrgInactiveDiag:setTopBottom( true, false, 14.48, 87.98 )
				self.BoxButtonLrgInactiveDiag:setAlpha( 0 )
				self.clipFinished( BoxButtonLrgInactiveDiag, {} )
				TitleBg:completeAnimation()
				self.TitleBg:setLeftRight( false, true, -319, -31.75 )
				self.TitleBg:setTopBottom( true, false, 35.55, 65.45 )
				self.TitleBg:setAlpha( 0 )
				self.clipFinished( TitleBg, {} )
				LockedIcon:completeAnimation()
				self.LockedIcon:setAlpha( 0 )
				self.clipFinished( LockedIcon, {} )
				featlineleft000:completeAnimation()
				self.featlineleft000:setLeftRight( false, true, -175.1, -171.1 )
				self.featlineleft000:setTopBottom( true, false, -142, 212 )
				self.featlineleft000:setAlpha( 0 )
				self.clipFinished( featlineleft000, {} )
				featlineleft0000:completeAnimation()
				self.featlineleft0000:setLeftRight( false, true, -174, -171 )
				self.featlineleft0000:setTopBottom( true, false, -110.95, 242.05 )
				self.featlineleft0000:setAlpha( 0 )
				self.clipFinished( featlineleft0000, {} )
			end
		},
		Locked = {
			DefaultClip = function ()
				self:setupElementClipCounter( 8 )
				CardcompletedDescription:completeAnimation()
				self.CardcompletedDescription:setText( Engine.Localize( "BLACKJACK_CHALLENGE_SIDE_BET_DESC" ) )
				self.clipFinished( CardcompletedDescription, {} )
				BoxButtonLrgInactive:completeAnimation()
				self.BoxButtonLrgInactive:setAlpha( 1 )
				self.clipFinished( BoxButtonLrgInactive, {} )
				CallingCardsFrameWidget:completeAnimation()
				self.CallingCardsFrameWidget:setAlpha( 0.4 )
				self.clipFinished( CallingCardsFrameWidget, {} )
				BoxButtonLrgInactiveDiag:completeAnimation()
				self.BoxButtonLrgInactiveDiag:setAlpha( 0.5 )
				self.clipFinished( BoxButtonLrgInactiveDiag, {} )
				TitleBg:completeAnimation()
				self.TitleBg:setLeftRight( false, true, -319, -31.75 )
				self.TitleBg:setTopBottom( true, false, 35.55, 65.45 )
				self.TitleBg:setAlpha( 0.4 )
				self.clipFinished( TitleBg, {} )
				LockedIcon:completeAnimation()
				self.LockedIcon:setAlpha( 1 )
				self.clipFinished( LockedIcon, {} )
				featlineleft000:completeAnimation()
				self.featlineleft000:setLeftRight( false, true, -175.1, -171.1 )
				self.featlineleft000:setTopBottom( true, false, -142, 212 )
				self.featlineleft000:setAlpha( 0.5 )
				self.clipFinished( featlineleft000, {} )
				featlineleft0000:completeAnimation()
				self.featlineleft0000:setLeftRight( false, true, -174, -171 )
				self.featlineleft0000:setTopBottom( true, false, -110.95, 242.05 )
				self.featlineleft0000:setAlpha( 0.5 )
				self.clipFinished( featlineleft0000, {} )
			end
		},
		CompletedCard = {
			DefaultClip = function ()
				self:setupElementClipCounter( 8 )
				CardcompletedDescription:completeAnimation()
				self.CardcompletedDescription:setText( Engine.Localize( "BLACKJACK_CARD_COMPLETED" ) )
				self.clipFinished( CardcompletedDescription, {} )
				BoxButtonLrgInactive:completeAnimation()
				self.BoxButtonLrgInactive:setAlpha( 1 )
				self.clipFinished( BoxButtonLrgInactive, {} )
				CallingCardsFrameWidget:completeAnimation()
				self.CallingCardsFrameWidget:setAlpha( 1 )
				self.clipFinished( CallingCardsFrameWidget, {} )
				BoxButtonLrgInactiveDiag:completeAnimation()
				self.BoxButtonLrgInactiveDiag:setLeftRight( false, true, -315, -36.75 )
				self.BoxButtonLrgInactiveDiag:setTopBottom( true, false, 14.48, 87.98 )
				self.BoxButtonLrgInactiveDiag:setAlpha( 0 )
				self.clipFinished( BoxButtonLrgInactiveDiag, {} )
				TitleBg:completeAnimation()
				self.TitleBg:setLeftRight( false, true, -319, -31.75 )
				self.TitleBg:setTopBottom( true, false, 35.55, 65.45 )
				self.TitleBg:setAlpha( 0 )
				self.clipFinished( TitleBg, {} )
				LockedIcon:completeAnimation()
				self.LockedIcon:setAlpha( 0 )
				self.clipFinished( LockedIcon, {} )
				featlineleft000:completeAnimation()
				self.featlineleft000:setLeftRight( false, true, -175.1, -171.1 )
				self.featlineleft000:setTopBottom( true, false, -142, 212 )
				self.featlineleft000:setAlpha( 0 )
				self.clipFinished( featlineleft000, {} )
				featlineleft0000:completeAnimation()
				self.featlineleft0000:setLeftRight( false, true, -174, -171 )
				self.featlineleft0000:setTopBottom( true, false, -110.95, 242.05 )
				self.featlineleft0000:setAlpha( 0 )
				self.clipFinished( featlineleft0000, {} )
			end
		},
		CompletedCardSet = {
			DefaultClip = function ()
				self:setupElementClipCounter( 8 )
				CardcompletedDescription:completeAnimation()
				self.CardcompletedDescription:setText( Engine.Localize( "BLACKJACK_CARD_SET_COMPLETED" ) )
				self.clipFinished( CardcompletedDescription, {} )
				BoxButtonLrgInactive:completeAnimation()
				self.BoxButtonLrgInactive:setAlpha( 1 )
				self.clipFinished( BoxButtonLrgInactive, {} )
				CallingCardsFrameWidget:completeAnimation()
				self.CallingCardsFrameWidget:setAlpha( 1 )
				self.clipFinished( CallingCardsFrameWidget, {} )
				BoxButtonLrgInactiveDiag:completeAnimation()
				self.BoxButtonLrgInactiveDiag:setLeftRight( false, true, -315, -36.75 )
				self.BoxButtonLrgInactiveDiag:setTopBottom( true, false, 14.48, 87.98 )
				self.BoxButtonLrgInactiveDiag:setAlpha( 0 )
				self.clipFinished( BoxButtonLrgInactiveDiag, {} )
				TitleBg:completeAnimation()
				self.TitleBg:setLeftRight( false, true, -319, -31.75 )
				self.TitleBg:setTopBottom( true, false, 35.55, 65.45 )
				self.TitleBg:setAlpha( 0 )
				self.clipFinished( TitleBg, {} )
				LockedIcon:completeAnimation()
				self.LockedIcon:setAlpha( 0 )
				self.clipFinished( LockedIcon, {} )
				featlineleft000:completeAnimation()
				self.featlineleft000:setLeftRight( false, true, -175.1, -171.1 )
				self.featlineleft000:setTopBottom( true, false, -142, 212 )
				self.featlineleft000:setAlpha( 0 )
				self.clipFinished( featlineleft000, {} )
				featlineleft0000:completeAnimation()
				self.featlineleft0000:setLeftRight( false, true, -174, -171 )
				self.featlineleft0000:setTopBottom( true, false, -110.95, 242.05 )
				self.featlineleft0000:setAlpha( 0 )
				self.clipFinished( featlineleft0000, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "Locked",
			condition = function ( menu, element, event )
				return IsSelfModelValueTrue( element, controller, "isLocked" )
			end
		},
		{
			stateName = "CompletedCard",
			condition = function ( menu, element, event )
				return not IsSelfModelValueTrue( element, controller, "isMastery" )
			end
		},
		{
			stateName = "CompletedCardSet",
			condition = function ( menu, element, event )
				return IsSelfModelValueTrue( element, controller, "isMastery" )
			end
		}
	} )
	self:linkToElementModel( self, "isLocked", true, function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "isLocked"
		} )
	end )
	self:linkToElementModel( self, "isMastery", true, function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "isMastery"
		} )
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.BoxButtonLrgInactive:close()
		element.CallingCardsFrameWidget:close()
		element.BoxButtonLrgInactiveDiag:close()
		element.LockedIcon:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

