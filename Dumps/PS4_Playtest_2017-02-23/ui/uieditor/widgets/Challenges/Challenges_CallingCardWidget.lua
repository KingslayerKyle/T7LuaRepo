require( "ui.uieditor.widgets.CAC.cac_ButtonBoxLrgInactive" )
require( "ui.uieditor.widgets.CAC.cac_ButtonBoxLrgInactiveDiags" )
require( "ui.uieditor.widgets.CAC.cac_lock" )
require( "ui.uieditor.widgets.Lobby.Common.FE_FocusBarContainer" )

local PostLoadFunc = function ( self, controller )
	self:registerEventHandler( "gain_focus", function ( self, event )
		local model = self:getModel()
		local maxTierModel = Engine.GetModel( model, "maxTier" )
		local currentTierModel = Engine.GetModel( model, "currentTier" )
		local tierXPModel = Engine.GetModel( model, "xp" )
		if maxTierModel and currentTierModel and tierXPModel then
			SetGlobalModelValue( "maxTier", Engine.GetModelValue( maxTierModel ) )
			SetGlobalModelValue( "currentTier", Engine.GetModelValue( currentTierModel ) )
			SetGlobalModelValue( "tierXP", Engine.GetModelValue( tierXPModel ) )
			self:dispatchEventToParent( {
				name = "update_tier_list",
				controller = controller
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
	self:setLeftRight( 0, 0, 0, 360 )
	self:setTopBottom( 0, 0, 0, 126 )
	self:makeFocusable()
	self:setHandleMouse( true )
	self.anyChildUsesUpdateState = true
	
	local bg = LUI.UIImage.new()
	bg:setLeftRight( 0, 0, 0, 360 )
	bg:setTopBottom( 0, 0, 90, 128 )
	bg:setAlpha( 0.02 )
	self:addElement( bg )
	self.bg = bg
	
	local BoxButtonLrgInactive = CoD.cac_ButtonBoxLrgInactive.new( menu, controller )
	BoxButtonLrgInactive:setLeftRight( 0, 1, -3, 3 )
	BoxButtonLrgInactive:setTopBottom( 0, 1, -3, -33 )
	self:addElement( BoxButtonLrgInactive )
	self.BoxButtonLrgInactive = BoxButtonLrgInactive
	
	local DarkOpsClassifiedIcon = LUI.UIImage.new()
	DarkOpsClassifiedIcon:setLeftRight( 0, 1, 0, 0 )
	DarkOpsClassifiedIcon:setTopBottom( 0, 0, 0, 90 )
	DarkOpsClassifiedIcon:setAlpha( 0 )
	DarkOpsClassifiedIcon:setImage( RegisterImage( "uie_t7_icons_challenges_classified_placeholder" ) )
	self:addElement( DarkOpsClassifiedIcon )
	self.DarkOpsClassifiedIcon = DarkOpsClassifiedIcon
	
	local CardIcon = LUI.UIImage.new()
	CardIcon:setLeftRight( 0, 1, 0, 0 )
	CardIcon:setTopBottom( 0, 0, 0, 90 )
	CardIcon:linkToElementModel( self, "iconId", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			CardIcon:setImage( RegisterImage( GetBackgroundByID( modelValue ) ) )
		end
	end )
	self:addElement( CardIcon )
	self.CardIcon = CardIcon
	
	local BoxButtonLrgInactiveDiag0 = CoD.cac_ButtonBoxLrgInactiveDiags.new( menu, controller )
	BoxButtonLrgInactiveDiag0:setLeftRight( 0, 1, -3, 3 )
	BoxButtonLrgInactiveDiag0:setTopBottom( 0, 0, -3, 93 )
	BoxButtonLrgInactiveDiag0:setAlpha( 0 )
	self:addElement( BoxButtonLrgInactiveDiag0 )
	self.BoxButtonLrgInactiveDiag0 = BoxButtonLrgInactiveDiag0
	
	local text = LUI.UIText.new()
	text:setLeftRight( 0, 0, 6, 354 )
	text:setTopBottom( 0, 0, 95, 123 )
	text:setAlpha( 0.85 )
	text:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	text:setLetterSpacing( 0.5 )
	text:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	text:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	text:linkToElementModel( self, "title", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			text:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( text )
	self.text = text
	
	local featlineleft0000 = LUI.UIImage.new()
	featlineleft0000:setLeftRight( 0, 0, 180, 186 )
	featlineleft0000:setTopBottom( 0, 0, -60, 314 )
	featlineleft0000:setZRot( -90 )
	featlineleft0000:setImage( RegisterImage( "uie_t7_menu_frontend_featuredlline" ) )
	featlineleft0000:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( featlineleft0000 )
	self.featlineleft0000 = featlineleft0000
	
	local lockedIcon = CoD.cac_lock.new( menu, controller )
	lockedIcon:setLeftRight( 0, 0, 162, 210 )
	lockedIcon:setTopBottom( 0, 0, 18, 66 )
	self:addElement( lockedIcon )
	self.lockedIcon = lockedIcon
	
	local FocusBarT = CoD.FE_FocusBarContainer.new( menu, controller )
	FocusBarT:setLeftRight( 0, 1, -3, 3 )
	FocusBarT:setTopBottom( 0, 0, -3, 3 )
	FocusBarT:setAlpha( 0 )
	FocusBarT:setZoom( 1 )
	self:addElement( FocusBarT )
	self.FocusBarT = FocusBarT
	
	local FocusBarB = CoD.FE_FocusBarContainer.new( menu, controller )
	FocusBarB:setLeftRight( 0, 1, -3, 3 )
	FocusBarB:setTopBottom( 1, 1, -3, 1 )
	FocusBarB:setAlpha( 0 )
	FocusBarB:setZoom( 1 )
	self:addElement( FocusBarB )
	self.FocusBarB = FocusBarB
	
	self.resetProperties = function ()
		lockedIcon:completeAnimation()
		bg:completeAnimation()
		FocusBarB:completeAnimation()
		FocusBarT:completeAnimation()
		CardIcon:completeAnimation()
		BoxButtonLrgInactiveDiag0:completeAnimation()
		DarkOpsClassifiedIcon:completeAnimation()
		lockedIcon:setAlpha( 1 )
		bg:setAlpha( 0.02 )
		FocusBarB:setAlpha( 0 )
		FocusBarT:setAlpha( 0 )
		CardIcon:setAlpha( 1 )
		BoxButtonLrgInactiveDiag0:setAlpha( 0 )
		DarkOpsClassifiedIcon:setAlpha( 0 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 2 )
				bg:completeAnimation()
				self.bg:setAlpha( 0.2 )
				self.clipFinished( bg, {} )
				lockedIcon:completeAnimation()
				self.lockedIcon:setAlpha( 0 )
				self.clipFinished( lockedIcon, {} )
			end,
			Focus = function ()
				self.resetProperties()
				self:setupElementClipCounter( 2 )
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
				self.resetProperties()
				self:setupElementClipCounter( 2 )
				CardIcon:completeAnimation()
				self.CardIcon:setAlpha( 0 )
				self.clipFinished( CardIcon, {} )
				BoxButtonLrgInactiveDiag0:completeAnimation()
				self.BoxButtonLrgInactiveDiag0:setAlpha( 0.25 )
				self.clipFinished( BoxButtonLrgInactiveDiag0, {} )
			end,
			Focus = function ()
				self.resetProperties()
				self:setupElementClipCounter( 5 )
				CardIcon:completeAnimation()
				self.CardIcon:setAlpha( 0 )
				self.clipFinished( CardIcon, {} )
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
				self.resetProperties()
				self:setupElementClipCounter( 3 )
				DarkOpsClassifiedIcon:completeAnimation()
				self.DarkOpsClassifiedIcon:setAlpha( 1 )
				self.clipFinished( DarkOpsClassifiedIcon, {} )
				CardIcon:completeAnimation()
				self.CardIcon:setAlpha( 0 )
				self.clipFinished( CardIcon, {} )
				lockedIcon:completeAnimation()
				self.lockedIcon:setAlpha( 0 )
				self.clipFinished( lockedIcon, {} )
			end,
			Focus = function ()
				self.resetProperties()
				self:setupElementClipCounter( 5 )
				DarkOpsClassifiedIcon:completeAnimation()
				self.DarkOpsClassifiedIcon:setAlpha( 1 )
				self.clipFinished( DarkOpsClassifiedIcon, {} )
				CardIcon:completeAnimation()
				self.CardIcon:setAlpha( 0 )
				self.clipFinished( CardIcon, {} )
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
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.BoxButtonLrgInactive:close()
		self.BoxButtonLrgInactiveDiag0:close()
		self.lockedIcon:close()
		self.FocusBarT:close()
		self.FocusBarB:close()
		self.CardIcon:close()
		self.text:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

