require( "ui.uieditor.widgets.CAC.cac_ItemTitleGlow" )

local PreLoadFunc = function ( self, controller )
	local updateDelay = 10000
	Engine.SetModelValue( Engine.CreateModel( Engine.GetModelForController( controller ), "doubleXPTimeRemaining" ), Engine.GetDoubleXPTimeRemaining( controller ) )
	self:addElement( LUI.UITimer.newElementTimer( updateDelay, true, function ()
		if Engine.IsInGame() then
			Engine.SetModelValue( Engine.CreateModel( Engine.GetModelForController( controller ), "doubleXPTimeRemaining" ), Engine.GetDoubleXPTimeRemaining( controller ) )
		end
	end ) )
	self:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyNav" ), function ( model )
		if IsZombies() then
			Engine.SetModelValue( Engine.CreateModel( Engine.GetModelForController( controller ), "doubleXPTimeRemaining" ), Engine.GetDoubleXPTimeRemaining( controller ) )
		end
	end )
end

CoD.ZM_Promo_DoubleXPWidget = InheritFrom( LUI.UIElement )
CoD.ZM_Promo_DoubleXPWidget.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.ZM_Promo_DoubleXPWidget )
	self.id = "ZM_Promo_DoubleXPWidget"
	self.soundSet = "default"
	self:setLeftRight( 0, 0, 0, 205 )
	self:setTopBottom( 0, 0, 0, 135 )
	
	local TitleGlowBlue = CoD.cac_ItemTitleGlow.new( menu, controller )
	TitleGlowBlue:setLeftRight( 0.5, 0.5, 7, 100 )
	TitleGlowBlue:setTopBottom( 0.5, 0.5, -8, 23 )
	self:addElement( TitleGlowBlue )
	self.TitleGlowBlue = TitleGlowBlue
	
	local TimeMinutes = LUI.UIText.new()
	TimeMinutes:setLeftRight( 0.5, 0.5, 10, 96 )
	TimeMinutes:setTopBottom( 0, 0, 65, 86 )
	TimeMinutes:setRGB( 0, 0, 0 )
	TimeMinutes:setText( Engine.Localize( "MENU_DOUBLE_XP_TIME_REMAINING_CAPS" ) )
	TimeMinutes:setTTF( "fonts/escom.ttf" )
	TimeMinutes:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_font_cached_glow" ) )
	TimeMinutes:setShaderVector( 0, 0.07, 0, 0, 0 )
	TimeMinutes:setShaderVector( 1, 0, 0, 0, 0 )
	TimeMinutes:setShaderVector( 2, 1, 0, 0, 0 )
	TimeMinutes:setLetterSpacing( 1.1 )
	TimeMinutes:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	TimeMinutes:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( TimeMinutes )
	self.TimeMinutes = TimeMinutes
	
	local pixelMiddle = LUI.UIImage.new()
	pixelMiddle:setLeftRight( 0, 0, -20, 28 )
	pixelMiddle:setTopBottom( 0.5, 0.5, -37, 41 )
	pixelMiddle:setZoom( 10 )
	pixelMiddle:setImage( RegisterImage( "uie_t7_menu_frontend_titlebackpixelb" ) )
	pixelMiddle:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( pixelMiddle )
	self.pixelMiddle = pixelMiddle
	
	local TwoLinesBottom = LUI.UIImage.new()
	TwoLinesBottom:setLeftRight( 0, 0, 113, 119 )
	TwoLinesBottom:setTopBottom( 0, 0, 0, 210 )
	TwoLinesBottom:setZRot( -90 )
	TwoLinesBottom:setImage( RegisterImage( "uie_t7_menu_frontend_featuredlline" ) )
	TwoLinesBottom:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( TwoLinesBottom )
	self.TwoLinesBottom = TwoLinesBottom
	
	local TwoLinesTop = LUI.UIImage.new()
	TwoLinesTop:setLeftRight( 0, 0, 113, 119 )
	TwoLinesTop:setTopBottom( 0, 0, -72, 138 )
	TwoLinesTop:setZRot( -90 )
	TwoLinesTop:setImage( RegisterImage( "uie_t7_menu_frontend_featuredlline" ) )
	TwoLinesTop:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( TwoLinesTop )
	self.TwoLinesTop = TwoLinesTop
	
	local pixelUR = LUI.UIImage.new()
	pixelUR:setLeftRight( 0.5, 0.5, 102, 156 )
	pixelUR:setTopBottom( 0.5, 0.5, -37, -32 )
	pixelUR:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	pixelUR:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_blend" ) )
	self:addElement( pixelUR )
	self.pixelUR = pixelUR
	
	local pixelLR = LUI.UIImage.new()
	pixelLR:setLeftRight( 0.5, 0.5, 102, 156 )
	pixelLR:setTopBottom( 0.5, 0.5, 35, 40 )
	pixelLR:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	pixelLR:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_blend" ) )
	self:addElement( pixelLR )
	self.pixelLR = pixelLR
	
	local PromoText = LUI.UIText.new()
	PromoText:setLeftRight( 0.5, 0.5, -3, 107 )
	PromoText:setTopBottom( 0, 0, 42, 63 )
	PromoText:setText( Engine.Localize( "MENU_PROMO_CAPS" ) )
	PromoText:setTTF( "fonts/escom.ttf" )
	PromoText:setLetterSpacing( 1.1 )
	PromoText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	PromoText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( PromoText )
	self.PromoText = PromoText
	
	local DoubleXPframe = LUI.UIImage.new()
	DoubleXPframe:setLeftRight( 0, 0, 18, 91 )
	DoubleXPframe:setTopBottom( 0, 0, 33, 107 )
	DoubleXPframe:setImage( RegisterImage( "uie_t7_menu_frontend_zm_xp_backer" ) )
	self:addElement( DoubleXPframe )
	self.DoubleXPframe = DoubleXPframe
	
	local XP = LUI.UIText.new()
	XP:setLeftRight( 0, 0, 30, 79 )
	XP:setTopBottom( 0, 0, 58, 83 )
	XP:setRGB( 1, 0.87, 0.25 )
	XP:setText( Engine.Localize( "2XP" ) )
	XP:setTTF( "fonts/FoundryGridnik-Bold.ttf" )
	XP:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_font_cached_glow" ) )
	XP:setShaderVector( 0, 0.05, 0, 0, 0 )
	XP:setShaderVector( 1, 0.5, 0, 0, 0 )
	XP:setShaderVector( 2, 1, 0, 0, 0 )
	XP:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	XP:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( XP )
	self.XP = XP
	
	local Image3 = LUI.UIImage.new()
	Image3:setLeftRight( 0, 0, -27, 15 )
	Image3:setTopBottom( 0.5, 0.5, -37, -31 )
	Image3:setImage( RegisterImage( "uie_t7_menu_frontend_pixelframe" ) )
	Image3:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image3 )
	self.Image3 = Image3
	
	local Image1 = LUI.UIImage.new()
	Image1:setLeftRight( 0, 0, -27, 15 )
	Image1:setTopBottom( 0.5, 0.5, 35, 41 )
	Image1:setImage( RegisterImage( "uie_t7_menu_frontend_pixelframe" ) )
	Image1:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image1 )
	self.Image1 = Image1
	
	local TwoLinesTop0 = LUI.UIImage.new()
	TwoLinesTop0:setLeftRight( 0, 0, 113, 119 )
	TwoLinesTop0:setTopBottom( 0, 0, -72, 138 )
	TwoLinesTop0:setZRot( -90 )
	TwoLinesTop0:setImage( RegisterImage( "uie_t7_menu_frontend_featuredlline" ) )
	TwoLinesTop0:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( TwoLinesTop0 )
	self.TwoLinesTop0 = TwoLinesTop0
	
	local TwoLinesBottom0 = LUI.UIImage.new()
	TwoLinesBottom0:setLeftRight( 0, 0, 113, 119 )
	TwoLinesBottom0:setTopBottom( 0, 0, 0, 210 )
	TwoLinesBottom0:setZRot( -90 )
	TwoLinesBottom0:setImage( RegisterImage( "uie_t7_menu_frontend_featuredlline" ) )
	TwoLinesBottom0:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( TwoLinesBottom0 )
	self.TwoLinesBottom0 = TwoLinesBottom0
	
	self.resetProperties = function ()
		XP:completeAnimation()
		DoubleXPframe:completeAnimation()
		TimeMinutes:completeAnimation()
		TitleGlowBlue:completeAnimation()
		PromoText:completeAnimation()
		pixelMiddle:completeAnimation()
		TwoLinesBottom:completeAnimation()
		TwoLinesTop:completeAnimation()
		pixelUR:completeAnimation()
		pixelLR:completeAnimation()
		Image3:completeAnimation()
		Image1:completeAnimation()
		TwoLinesBottom0:completeAnimation()
		TwoLinesTop0:completeAnimation()
		XP:setAlpha( 1 )
		DoubleXPframe:setAlpha( 1 )
		TimeMinutes:setAlpha( 1 )
		TitleGlowBlue:setAlpha( 1 )
		PromoText:setAlpha( 1 )
		pixelMiddle:setAlpha( 1 )
		TwoLinesBottom:setAlpha( 1 )
		TwoLinesTop:setAlpha( 1 )
		pixelUR:setAlpha( 1 )
		pixelLR:setAlpha( 1 )
		Image3:setAlpha( 1 )
		Image1:setAlpha( 1 )
		TwoLinesBottom0:setAlpha( 1 )
		TwoLinesTop0:setAlpha( 1 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 12 )
				TitleGlowBlue:completeAnimation()
				self.TitleGlowBlue:setAlpha( 0 )
				self.clipFinished( TitleGlowBlue, {} )
				TimeMinutes:completeAnimation()
				self.TimeMinutes:setAlpha( 0 )
				self.clipFinished( TimeMinutes, {} )
				pixelMiddle:completeAnimation()
				self.pixelMiddle:setAlpha( 0 )
				self.clipFinished( pixelMiddle, {} )
				TwoLinesBottom:completeAnimation()
				self.TwoLinesBottom:setAlpha( 0 )
				self.clipFinished( TwoLinesBottom, {} )
				TwoLinesTop:completeAnimation()
				self.TwoLinesTop:setAlpha( 0 )
				self.clipFinished( TwoLinesTop, {} )
				pixelUR:completeAnimation()
				self.pixelUR:setAlpha( 0 )
				self.clipFinished( pixelUR, {} )
				pixelLR:completeAnimation()
				self.pixelLR:setAlpha( 0 )
				self.clipFinished( pixelLR, {} )
				PromoText:completeAnimation()
				self.PromoText:setAlpha( 0 )
				self.clipFinished( PromoText, {} )
				DoubleXPframe:completeAnimation()
				self.DoubleXPframe:setAlpha( 0 )
				self.clipFinished( DoubleXPframe, {} )
				XP:completeAnimation()
				self.XP:setAlpha( 0 )
				self.clipFinished( XP, {} )
				Image3:completeAnimation()
				self.Image3:setAlpha( 0 )
				self.clipFinished( Image3, {} )
				Image1:completeAnimation()
				self.Image1:setAlpha( 0 )
				self.clipFinished( Image1, {} )
			end
		},
		VisibleNoLines = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 9 )
				pixelMiddle:completeAnimation()
				self.pixelMiddle:setAlpha( 0 )
				self.clipFinished( pixelMiddle, {} )
				TwoLinesBottom:completeAnimation()
				self.TwoLinesBottom:setAlpha( 0 )
				self.clipFinished( TwoLinesBottom, {} )
				TwoLinesTop:completeAnimation()
				self.TwoLinesTop:setAlpha( 0 )
				self.clipFinished( TwoLinesTop, {} )
				pixelUR:completeAnimation()
				self.pixelUR:setAlpha( 0 )
				self.clipFinished( pixelUR, {} )
				pixelLR:completeAnimation()
				self.pixelLR:setAlpha( 0 )
				self.clipFinished( pixelLR, {} )
				Image3:completeAnimation()
				self.Image3:setAlpha( 0 )
				self.clipFinished( Image3, {} )
				Image1:completeAnimation()
				self.Image1:setAlpha( 0 )
				self.clipFinished( Image1, {} )
				TwoLinesTop0:completeAnimation()
				self.TwoLinesTop0:setAlpha( 0 )
				self.clipFinished( TwoLinesTop0, {} )
				TwoLinesBottom0:completeAnimation()
				self.TwoLinesBottom0:setAlpha( 0 )
				self.clipFinished( TwoLinesBottom0, {} )
			end
		},
		Visible = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 0 )
			end
		},
		GreyedOut = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 12 )
				TitleGlowBlue:completeAnimation()
				self.TitleGlowBlue:setAlpha( 0.11 )
				self.clipFinished( TitleGlowBlue, {} )
				TimeMinutes:completeAnimation()
				self.TimeMinutes:setAlpha( 0.11 )
				self.clipFinished( TimeMinutes, {} )
				pixelMiddle:completeAnimation()
				self.pixelMiddle:setAlpha( 0.11 )
				self.clipFinished( pixelMiddle, {} )
				TwoLinesBottom:completeAnimation()
				self.TwoLinesBottom:setAlpha( 0.11 )
				self.clipFinished( TwoLinesBottom, {} )
				TwoLinesTop:completeAnimation()
				self.TwoLinesTop:setAlpha( 0.11 )
				self.clipFinished( TwoLinesTop, {} )
				pixelUR:completeAnimation()
				self.pixelUR:setAlpha( 0.11 )
				self.clipFinished( pixelUR, {} )
				pixelLR:completeAnimation()
				self.pixelLR:setAlpha( 0.11 )
				self.clipFinished( pixelLR, {} )
				PromoText:completeAnimation()
				self.PromoText:setAlpha( 0.11 )
				self.clipFinished( PromoText, {} )
				DoubleXPframe:completeAnimation()
				self.DoubleXPframe:setAlpha( 0.11 )
				self.clipFinished( DoubleXPframe, {} )
				XP:completeAnimation()
				self.XP:setAlpha( 0.11 )
				self.clipFinished( XP, {} )
				Image3:completeAnimation()
				self.Image3:setAlpha( 0.11 )
				self.clipFinished( Image3, {} )
				Image1:completeAnimation()
				self.Image1:setAlpha( 0.11 )
				self.clipFinished( Image1, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "VisibleNoLines",
			condition = function ( menu, element, event )
				return ZMDoubleXPWidgetVisible( controller )
			end
		},
		{
			stateName = "Visible",
			condition = function ( menu, element, event )
				return ZMDoubleXPWidgetVisible( controller )
			end
		},
		{
			stateName = "GreyedOut",
			condition = function ( menu, element, event )
				return ZMDoubleXPWidgetVisible( controller )
			end
		}
	} )
	self:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyNav" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "lobbyRoot.lobbyNav"
		} )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "PartyPrivacy.maxPlayers" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "PartyPrivacy.maxPlayers"
		} )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot.gameClient.update" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "lobbyRoot.gameClient.update"
		} )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot.privateClient.update" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "lobbyRoot.privateClient.update"
		} )
	end )
	if self.m_eventHandlers.controller_inserted then
		local currentEv = self.m_eventHandlers.controller_inserted
		self:registerEventHandler( "controller_inserted", function ( self, event )
			event.menu = event.menu or menu
			self:updateState( event )
			return currentEv( self, event )
		end )
	else
		self:registerEventHandler( "controller_inserted", LUI.UIElement.updateState )
	end
	if self.m_eventHandlers.controller_removed then
		local currentEv = self.m_eventHandlers.controller_removed
		self:registerEventHandler( "controller_removed", function ( self, event )
			event.menu = event.menu or menu
			self:updateState( event )
			return currentEv( self, event )
		end )
	else
		self:registerEventHandler( "controller_removed", LUI.UIElement.updateState )
	end
	if self.m_eventHandlers.controller_used_start then
		local currentEv = self.m_eventHandlers.controller_used_start
		self:registerEventHandler( "controller_used_start", function ( self, event )
			event.menu = event.menu or menu
			self:updateState( event )
			return currentEv( self, event )
		end )
	else
		self:registerEventHandler( "controller_used_start", LUI.UIElement.updateState )
	end
	if self.m_eventHandlers.controller_used_stop then
		local currentEv = self.m_eventHandlers.controller_used_stop
		self:registerEventHandler( "controller_used_stop", function ( self, event )
			event.menu = event.menu or menu
			self:updateState( event )
			return currentEv( self, event )
		end )
	else
		self:registerEventHandler( "controller_used_stop", LUI.UIElement.updateState )
	end
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.TitleGlowBlue:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

