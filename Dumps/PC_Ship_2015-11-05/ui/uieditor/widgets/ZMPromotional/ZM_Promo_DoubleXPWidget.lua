require( "ui.uieditor.widgets.CAC.cac_ItemTitleGlow" )

local PreLoadFunc = function ( self, controller )
	local f1_local0 = 10000
	Engine.SetModelValue( Engine.CreateModel( Engine.GetModelForController( controller ), "doubleXPTimeRemaining" ), Engine.GetDoubleXPTimeRemaining( controller ) )
	self:addElement( LUI.UITimer.newElementTimer( f1_local0, true, function ()
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
	self:setLeftRight( true, false, 0, 137 )
	self:setTopBottom( true, false, 0, 90 )
	
	local TitleGlowBlue = CoD.cac_ItemTitleGlow.new( menu, controller )
	TitleGlowBlue:setLeftRight( false, false, 4.6, 66.5 )
	TitleGlowBlue:setTopBottom( false, false, -5, 15.5 )
	self:addElement( TitleGlowBlue )
	self.TitleGlowBlue = TitleGlowBlue
	
	local TimeMinutes = LUI.UIText.new()
	TimeMinutes:setLeftRight( false, false, 6.6, 64 )
	TimeMinutes:setTopBottom( true, false, 43.1, 57.1 )
	TimeMinutes:setRGB( 0, 0, 0 )
	TimeMinutes:setText( Engine.Localize( "MENU_DOUBLE_XP_TIME_REMAINING_CAPS" ) )
	TimeMinutes:setTTF( "fonts/escom.ttf" )
	TimeMinutes:setMaterial( LUI.UIImage.GetCachedMaterial( "sw4_2d_uie_font_cached_glow" ) )
	TimeMinutes:setShaderVector( 0, 0.07, 0, 0, 0 )
	TimeMinutes:setShaderVector( 1, 0, 0, 0, 0 )
	TimeMinutes:setShaderVector( 2, 1, 0, 0, 0 )
	TimeMinutes:setLetterSpacing( 1.1 )
	TimeMinutes:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	TimeMinutes:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( TimeMinutes )
	self.TimeMinutes = TimeMinutes
	
	local pixelMiddle = LUI.UIImage.new()
	pixelMiddle:setLeftRight( true, false, -13, 19 )
	pixelMiddle:setTopBottom( false, false, -25, 27 )
	pixelMiddle:setZoom( 10 )
	pixelMiddle:setImage( RegisterImage( "uie_t7_menu_frontend_titlebackpixelb" ) )
	pixelMiddle:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( pixelMiddle )
	self.pixelMiddle = pixelMiddle
	
	local TwoLinesBottom = LUI.UIImage.new()
	TwoLinesBottom:setLeftRight( true, false, 75.1, 79.1 )
	TwoLinesBottom:setTopBottom( true, false, 0, 140 )
	TwoLinesBottom:setZRot( -90 )
	TwoLinesBottom:setImage( RegisterImage( "uie_t7_menu_frontend_featuredlline" ) )
	TwoLinesBottom:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( TwoLinesBottom )
	self.TwoLinesBottom = TwoLinesBottom
	
	local TwoLinesTop = LUI.UIImage.new()
	TwoLinesTop:setLeftRight( true, false, 75.1, 79.1 )
	TwoLinesTop:setTopBottom( true, false, -48, 92 )
	TwoLinesTop:setZRot( -90 )
	TwoLinesTop:setImage( RegisterImage( "uie_t7_menu_frontend_featuredlline" ) )
	TwoLinesTop:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( TwoLinesTop )
	self.TwoLinesTop = TwoLinesTop
	
	local pixelUR = LUI.UIImage.new()
	pixelUR:setLeftRight( false, false, 68, 104 )
	pixelUR:setTopBottom( false, false, -25, -21.5 )
	pixelUR:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	pixelUR:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_add" ) )
	self:addElement( pixelUR )
	self.pixelUR = pixelUR
	
	local pixelLR = LUI.UIImage.new()
	pixelLR:setLeftRight( false, false, 68, 104 )
	pixelLR:setTopBottom( false, false, 23, 26.5 )
	pixelLR:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	pixelLR:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_add" ) )
	self:addElement( pixelLR )
	self.pixelLR = pixelLR
	
	local PromoText = LUI.UIText.new()
	PromoText:setLeftRight( false, false, -1.5, 71.5 )
	PromoText:setTopBottom( true, false, 28, 42 )
	PromoText:setText( Engine.Localize( "MENU_PROMO_CAPS" ) )
	PromoText:setTTF( "fonts/escom.ttf" )
	PromoText:setLetterSpacing( 1.1 )
	PromoText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	PromoText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( PromoText )
	self.PromoText = PromoText
	
	local DoubleXPframe = LUI.UIImage.new()
	DoubleXPframe:setLeftRight( true, false, 12.05, 61.05 )
	DoubleXPframe:setTopBottom( true, false, 22, 71 )
	DoubleXPframe:setImage( RegisterImage( "uie_t7_menu_frontend_zm_xp_backer" ) )
	self:addElement( DoubleXPframe )
	self.DoubleXPframe = DoubleXPframe
	
	local XP = LUI.UIText.new()
	XP:setLeftRight( true, false, 20.16, 52.96 )
	XP:setTopBottom( true, false, 39, 55.55 )
	XP:setRGB( 1, 0.87, 0.25 )
	XP:setText( Engine.Localize( "2XP" ) )
	XP:setTTF( "fonts/FoundryGridnik-Bold.ttf" )
	XP:setMaterial( LUI.UIImage.GetCachedMaterial( "sw4_2d_uie_font_cached_glow" ) )
	XP:setShaderVector( 0, 0.05, 0, 0, 0 )
	XP:setShaderVector( 1, 0.5, 0, 0, 0 )
	XP:setShaderVector( 2, 1, 0, 0, 0 )
	XP:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	XP:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( XP )
	self.XP = XP
	
	local Image3 = LUI.UIImage.new()
	Image3:setLeftRight( true, false, -17.9, 10.1 )
	Image3:setTopBottom( false, false, -25, -21 )
	Image3:setImage( RegisterImage( "uie_t7_menu_frontend_pixelframe" ) )
	Image3:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image3 )
	self.Image3 = Image3
	
	local Image1 = LUI.UIImage.new()
	Image1:setLeftRight( true, false, -17.9, 10.1 )
	Image1:setTopBottom( false, false, 23.5, 27.5 )
	Image1:setImage( RegisterImage( "uie_t7_menu_frontend_pixelframe" ) )
	Image1:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image1 )
	self.Image1 = Image1
	
	local TwoLinesTop0 = LUI.UIImage.new()
	TwoLinesTop0:setLeftRight( true, false, 75.1, 79.1 )
	TwoLinesTop0:setTopBottom( true, false, -48, 92 )
	TwoLinesTop0:setZRot( -90 )
	TwoLinesTop0:setImage( RegisterImage( "uie_t7_menu_frontend_featuredlline" ) )
	TwoLinesTop0:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( TwoLinesTop0 )
	self.TwoLinesTop0 = TwoLinesTop0
	
	local TwoLinesBottom0 = LUI.UIImage.new()
	TwoLinesBottom0:setLeftRight( true, false, 75.1, 79.1 )
	TwoLinesBottom0:setTopBottom( true, false, 0, 140 )
	TwoLinesBottom0:setZRot( -90 )
	TwoLinesBottom0:setImage( RegisterImage( "uie_t7_menu_frontend_featuredlline" ) )
	TwoLinesBottom0:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( TwoLinesBottom0 )
	self.TwoLinesBottom0 = TwoLinesBottom0
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
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
		Visible = {
			DefaultClip = function ()
				self:setupElementClipCounter( 12 )
				TitleGlowBlue:completeAnimation()
				self.TitleGlowBlue:setAlpha( 1 )
				self.clipFinished( TitleGlowBlue, {} )
				TimeMinutes:completeAnimation()
				self.TimeMinutes:setAlpha( 1 )
				self.clipFinished( TimeMinutes, {} )
				pixelMiddle:completeAnimation()
				self.pixelMiddle:setAlpha( 1 )
				self.clipFinished( pixelMiddle, {} )
				TwoLinesBottom:completeAnimation()
				self.TwoLinesBottom:setAlpha( 1 )
				self.clipFinished( TwoLinesBottom, {} )
				TwoLinesTop:completeAnimation()
				self.TwoLinesTop:setAlpha( 1 )
				self.clipFinished( TwoLinesTop, {} )
				pixelUR:completeAnimation()
				self.pixelUR:setAlpha( 1 )
				self.clipFinished( pixelUR, {} )
				pixelLR:completeAnimation()
				self.pixelLR:setAlpha( 1 )
				self.clipFinished( pixelLR, {} )
				PromoText:completeAnimation()
				self.PromoText:setAlpha( 1 )
				self.clipFinished( PromoText, {} )
				DoubleXPframe:completeAnimation()
				self.DoubleXPframe:setAlpha( 1 )
				self.clipFinished( DoubleXPframe, {} )
				XP:completeAnimation()
				self.XP:setAlpha( 1 )
				self.clipFinished( XP, {} )
				Image3:completeAnimation()
				self.Image3:setAlpha( 1 )
				self.clipFinished( Image3, {} )
				Image1:completeAnimation()
				self.Image1:setAlpha( 1 )
				self.clipFinished( Image1, {} )
			end
		},
		GreyedOut = {
			DefaultClip = function ()
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
		local f4_local15 = self.m_eventHandlers.controller_inserted
		self:registerEventHandler( "controller_inserted", function ( self, event )
			event.menu = event.menu or menu
			self:updateState( event )
			return f4_local15( self, event )
		end )
	else
		self:registerEventHandler( "controller_inserted", LUI.UIElement.updateState )
	end
	if self.m_eventHandlers.controller_removed then
		local f4_local15 = self.m_eventHandlers.controller_removed
		self:registerEventHandler( "controller_removed", function ( self, event )
			event.menu = event.menu or menu
			self:updateState( event )
			return f4_local15( self, event )
		end )
	else
		self:registerEventHandler( "controller_removed", LUI.UIElement.updateState )
	end
	if self.m_eventHandlers.controller_used_start then
		local f4_local15 = self.m_eventHandlers.controller_used_start
		self:registerEventHandler( "controller_used_start", function ( self, event )
			event.menu = event.menu or menu
			self:updateState( event )
			return f4_local15( self, event )
		end )
	else
		self:registerEventHandler( "controller_used_start", LUI.UIElement.updateState )
	end
	if self.m_eventHandlers.controller_used_stop then
		local f4_local15 = self.m_eventHandlers.controller_used_stop
		self:registerEventHandler( "controller_used_stop", function ( self, event )
			event.menu = event.menu or menu
			self:updateState( event )
			return f4_local15( self, event )
		end )
	else
		self:registerEventHandler( "controller_used_stop", LUI.UIElement.updateState )
	end
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.TitleGlowBlue:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

