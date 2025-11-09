require( "ui.uieditor.widgets.CAC.cac_ButtonBoxLrgInactive" )
require( "ui.uieditor.widgets.CallingCards.CallingCards_FrameWidget" )
require( "ui.uieditor.widgets.CAC.cac_ButtonBoxLrgInactiveDiags" )
require( "ui.uieditor.widgets.CAC.cac_lock" )
require( "ui.uieditor.widgets.Lobby.Common.FE_FocusBarContainer" )

local PostLoadFunc = function ( f1_arg0, f1_arg1 )
	f1_arg0:registerEventHandler( "gain_focus", function ( element, event )
		local f2_local0 = element:getModel()
		local f2_local1 = Engine.GetModel( f2_local0, "maxTier" )
		local f2_local2 = Engine.GetModel( f2_local0, "currentTier" )
		local f2_local3 = Engine.GetModel( f2_local0, "xp" )
		if f2_local1 and f2_local2 and f2_local3 then
			SetGlobalModelValue( "maxTier", Engine.GetModelValue( f2_local1 ) )
			SetGlobalModelValue( "currentTier", Engine.GetModelValue( f2_local2 ) )
			SetGlobalModelValue( "tierXP", Engine.GetModelValue( f2_local3 ) )
			element:dispatchEventToParent( {
				name = "update_tier_list",
				controller = f1_arg1
			} )
		end
	end )
end

CoD.Challenges_CallingCardWidget = InheritFrom( LUI.UIElement )
CoD.Challenges_CallingCardWidget.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.Challenges_CallingCardWidget )
	self.id = "Challenges_CallingCardWidget"
	self.soundSet = "ChooseDecal"
	self:setLeftRight( true, false, 0, 240 )
	self:setTopBottom( true, false, 0, 84 )
	self:makeFocusable()
	self:setHandleMouse( true )
	self.anyChildUsesUpdateState = true
	
	local bg = LUI.UIImage.new()
	bg:setLeftRight( true, false, 0, 240 )
	bg:setTopBottom( true, false, 60, 85 )
	bg:setAlpha( 0.02 )
	self:addElement( bg )
	self.bg = bg
	
	local BoxButtonLrgInactive = CoD.cac_ButtonBoxLrgInactive.new( menu, controller )
	BoxButtonLrgInactive:setLeftRight( true, true, -2, 2 )
	BoxButtonLrgInactive:setTopBottom( true, true, -2, -22 )
	self:addElement( BoxButtonLrgInactive )
	self.BoxButtonLrgInactive = BoxButtonLrgInactive
	
	local CallingCardsFrameWidget0 = CoD.CallingCards_FrameWidget.new( menu, controller )
	CallingCardsFrameWidget0:setLeftRight( true, true, -120, 120 )
	CallingCardsFrameWidget0:setTopBottom( true, true, -30, 6 )
	CallingCardsFrameWidget0.CardIconFrame:setScale( 0.5 )
	CallingCardsFrameWidget0:linkToElementModel( self, nil, false, function ( model )
		CallingCardsFrameWidget0:setModel( model, controller )
	end )
	self:addElement( CallingCardsFrameWidget0 )
	self.CallingCardsFrameWidget0 = CallingCardsFrameWidget0
	
	local DarkOpsClassifiedIcon = LUI.UIImage.new()
	DarkOpsClassifiedIcon:setLeftRight( true, true, 0, 0 )
	DarkOpsClassifiedIcon:setTopBottom( true, false, 0, 60 )
	DarkOpsClassifiedIcon:setAlpha( 0 )
	DarkOpsClassifiedIcon:setImage( RegisterImage( "uie_t7_icons_challenges_classified_placeholder" ) )
	self:addElement( DarkOpsClassifiedIcon )
	self.DarkOpsClassifiedIcon = DarkOpsClassifiedIcon
	
	local BoxButtonLrgInactiveDiag0 = CoD.cac_ButtonBoxLrgInactiveDiags.new( menu, controller )
	BoxButtonLrgInactiveDiag0:setLeftRight( true, true, -2, 2 )
	BoxButtonLrgInactiveDiag0:setTopBottom( true, false, -2, 62 )
	BoxButtonLrgInactiveDiag0:setAlpha( 0 )
	self:addElement( BoxButtonLrgInactiveDiag0 )
	self.BoxButtonLrgInactiveDiag0 = BoxButtonLrgInactiveDiag0
	
	local text = LUI.UIText.new()
	text:setLeftRight( true, false, 4, 236 )
	text:setTopBottom( true, false, 63, 82 )
	text:setAlpha( 0.85 )
	text:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	text:setLetterSpacing( 0.5 )
	text:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	text:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	text:linkToElementModel( self, "title", true, function ( model )
		local title = Engine.GetModelValue( model )
		if title then
			text:setText( Engine.Localize( title ) )
		end
	end )
	self:addElement( text )
	self.text = text
	
	local featlineleft0000 = LUI.UIImage.new()
	featlineleft0000:setLeftRight( true, false, 120, 124 )
	featlineleft0000:setTopBottom( true, false, -40, 209 )
	featlineleft0000:setZRot( -90 )
	featlineleft0000:setImage( RegisterImage( "uie_t7_menu_frontend_featuredlline" ) )
	featlineleft0000:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( featlineleft0000 )
	self.featlineleft0000 = featlineleft0000
	
	local lockedIcon = CoD.cac_lock.new( menu, controller )
	lockedIcon:setLeftRight( true, false, 108, 140 )
	lockedIcon:setTopBottom( true, false, 12, 44 )
	self:addElement( lockedIcon )
	self.lockedIcon = lockedIcon
	
	local FocusBarT = CoD.FE_FocusBarContainer.new( menu, controller )
	FocusBarT:setLeftRight( true, true, -2, 2 )
	FocusBarT:setTopBottom( true, false, -2, 2 )
	FocusBarT:setAlpha( 0 )
	FocusBarT:setZoom( 1 )
	self:addElement( FocusBarT )
	self.FocusBarT = FocusBarT
	
	local FocusBarB = CoD.FE_FocusBarContainer.new( menu, controller )
	FocusBarB:setLeftRight( true, true, -2, 2 )
	FocusBarB:setTopBottom( false, true, -2, 1 )
	FocusBarB:setAlpha( 0 )
	FocusBarB:setZoom( 1 )
	self:addElement( FocusBarB )
	self.FocusBarB = FocusBarB
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 7 )
				bg:completeAnimation()
				self.bg:setAlpha( 0.2 )
				self.clipFinished( bg, {} )
				CallingCardsFrameWidget0:completeAnimation()
				self.CallingCardsFrameWidget0:setAlpha( 1 )
				self.clipFinished( CallingCardsFrameWidget0, {} )
				DarkOpsClassifiedIcon:completeAnimation()
				self.DarkOpsClassifiedIcon:setAlpha( 0 )
				self.clipFinished( DarkOpsClassifiedIcon, {} )
				BoxButtonLrgInactiveDiag0:completeAnimation()
				self.BoxButtonLrgInactiveDiag0:setAlpha( 0 )
				self.clipFinished( BoxButtonLrgInactiveDiag0, {} )
				lockedIcon:completeAnimation()
				self.lockedIcon:setAlpha( 0 )
				self.clipFinished( lockedIcon, {} )
				FocusBarT:completeAnimation()
				self.FocusBarT:setAlpha( 0 )
				self.clipFinished( FocusBarT, {} )
				FocusBarB:completeAnimation()
				self.FocusBarB:setAlpha( 0 )
				self.clipFinished( FocusBarB, {} )
			end,
			Focus = function ()
				self:setupElementClipCounter( 3 )
				DarkOpsClassifiedIcon:completeAnimation()
				self.DarkOpsClassifiedIcon:setAlpha( 0 )
				self.clipFinished( DarkOpsClassifiedIcon, {} )
				FocusBarT:completeAnimation()
				self.FocusBarT:setAlpha( 1 )
				self.clipFinished( FocusBarT, {} )
				FocusBarB:completeAnimation()
				self.FocusBarB:setAlpha( 1 )
				self.clipFinished( FocusBarB, {} )
			end
		},
		Locked = {
			DefaultClip = function ()
				self:setupElementClipCounter( 7 )
				BoxButtonLrgInactive:completeAnimation()
				self.BoxButtonLrgInactive:setAlpha( 1 )
				self.clipFinished( BoxButtonLrgInactive, {} )
				CallingCardsFrameWidget0:completeAnimation()
				self.CallingCardsFrameWidget0:setAlpha( 0 )
				self.clipFinished( CallingCardsFrameWidget0, {} )
				DarkOpsClassifiedIcon:completeAnimation()
				self.DarkOpsClassifiedIcon:setAlpha( 0 )
				self.clipFinished( DarkOpsClassifiedIcon, {} )
				BoxButtonLrgInactiveDiag0:completeAnimation()
				self.BoxButtonLrgInactiveDiag0:setAlpha( 0.25 )
				self.clipFinished( BoxButtonLrgInactiveDiag0, {} )
				lockedIcon:completeAnimation()
				self.lockedIcon:setAlpha( 1 )
				self.clipFinished( lockedIcon, {} )
				FocusBarT:completeAnimation()
				self.FocusBarT:setAlpha( 0 )
				self.clipFinished( FocusBarT, {} )
				FocusBarB:completeAnimation()
				self.FocusBarB:setAlpha( 0 )
				self.clipFinished( FocusBarB, {} )
			end,
			Focus = function ()
				self:setupElementClipCounter( 6 )
				BoxButtonLrgInactive:completeAnimation()
				self.BoxButtonLrgInactive:setAlpha( 1 )
				self.clipFinished( BoxButtonLrgInactive, {} )
				DarkOpsClassifiedIcon:completeAnimation()
				self.DarkOpsClassifiedIcon:setAlpha( 0 )
				self.clipFinished( DarkOpsClassifiedIcon, {} )
				BoxButtonLrgInactiveDiag0:completeAnimation()
				self.BoxButtonLrgInactiveDiag0:setAlpha( 0.25 )
				self.clipFinished( BoxButtonLrgInactiveDiag0, {} )
				lockedIcon:completeAnimation()
				self.lockedIcon:setAlpha( 0.8 )
				self.clipFinished( lockedIcon, {} )
				FocusBarT:completeAnimation()
				self.FocusBarT:setAlpha( 1 )
				self.clipFinished( FocusBarT, {} )
				FocusBarB:completeAnimation()
				self.FocusBarB:setAlpha( 1 )
				self.clipFinished( FocusBarB, {} )
			end
		},
		Classified = {
			DefaultClip = function ()
				self:setupElementClipCounter( 7 )
				BoxButtonLrgInactive:completeAnimation()
				self.BoxButtonLrgInactive:setAlpha( 1 )
				self.clipFinished( BoxButtonLrgInactive, {} )
				CallingCardsFrameWidget0:completeAnimation()
				self.CallingCardsFrameWidget0:setLeftRight( true, true, -120, 120 )
				self.CallingCardsFrameWidget0:setTopBottom( true, true, -30, 6 )
				self.clipFinished( CallingCardsFrameWidget0, {} )
				DarkOpsClassifiedIcon:completeAnimation()
				self.DarkOpsClassifiedIcon:setAlpha( 1 )
				self.clipFinished( DarkOpsClassifiedIcon, {} )
				BoxButtonLrgInactiveDiag0:completeAnimation()
				self.BoxButtonLrgInactiveDiag0:setAlpha( 0 )
				self.clipFinished( BoxButtonLrgInactiveDiag0, {} )
				lockedIcon:completeAnimation()
				self.lockedIcon:setAlpha( 0 )
				self.clipFinished( lockedIcon, {} )
				FocusBarT:completeAnimation()
				self.FocusBarT:setAlpha( 0 )
				self.FocusBarT:setZoom( 1 )
				self.clipFinished( FocusBarT, {} )
				FocusBarB:completeAnimation()
				self.FocusBarB:setAlpha( 0 )
				self.clipFinished( FocusBarB, {} )
			end,
			Focus = function ()
				self:setupElementClipCounter( 5 )
				BoxButtonLrgInactive:completeAnimation()
				self.BoxButtonLrgInactive:setAlpha( 1 )
				self.clipFinished( BoxButtonLrgInactive, {} )
				DarkOpsClassifiedIcon:completeAnimation()
				self.DarkOpsClassifiedIcon:setAlpha( 1 )
				self.clipFinished( DarkOpsClassifiedIcon, {} )
				lockedIcon:completeAnimation()
				self.lockedIcon:setAlpha( 0 )
				self.clipFinished( lockedIcon, {} )
				FocusBarT:completeAnimation()
				self.FocusBarT:setAlpha( 1 )
				self.clipFinished( FocusBarT, {} )
				FocusBarB:completeAnimation()
				self.FocusBarB:setAlpha( 1 )
				self.clipFinished( FocusBarB, {} )
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
			stateName = "Classified",
			condition = function ( menu, element, event )
				return AlwaysFalse()
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
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.BoxButtonLrgInactive:close()
		element.CallingCardsFrameWidget0:close()
		element.BoxButtonLrgInactiveDiag0:close()
		element.lockedIcon:close()
		element.FocusBarT:close()
		element.FocusBarB:close()
		element.text:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

