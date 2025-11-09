require( "ui.uieditor.widgets.StartMenu.StartMenu_frame_noBG" )
require( "ui.uieditor.widgets.Challenges.Challenges_PercentCompleteWidget_MD" )
require( "ui.uieditor.widgets.CAC.MenuSelectScreen.WeaponNameWidget" )
require( "ui.uieditor.widgets.CAC.cac_ButtonBoxLrgInactive" )
require( "ui.uieditor.widgets.CallingCards.CallingCards_FrameWidget" )
require( "ui.uieditor.widgets.CAC.cac_ButtonBoxLrgInactiveDiags" )
require( "ui.uieditor.widgets.CAC.cac_lock" )

CoD.Challenges_CallingCardProfiler_Master = InheritFrom( LUI.UIElement )
CoD.Challenges_CallingCardProfiler_Master.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.Challenges_CallingCardProfiler_Master )
	self.id = "Challenges_CallingCardProfiler_Master"
	self.soundSet = "ChooseDecal"
	self:setLeftRight( true, false, 0, 350 )
	self:setTopBottom( true, false, 0, 480 )
	self.anyChildUsesUpdateState = true
	
	local StartMenuframenoBG0 = CoD.StartMenu_frame_noBG.new( menu, controller )
	StartMenuframenoBG0:setLeftRight( true, true, 0, 0 )
	StartMenuframenoBG0:setTopBottom( true, true, 0, 0 )
	self:addElement( StartMenuframenoBG0 )
	self.StartMenuframenoBG0 = StartMenuframenoBG0
	
	local featlineleft = LUI.UIImage.new()
	featlineleft:setLeftRight( true, false, 175, 179 )
	featlineleft:setTopBottom( true, false, 171, 530 )
	featlineleft:setZRot( -90 )
	featlineleft:setImage( RegisterImage( "uie_t7_menu_frontend_featuredlline" ) )
	featlineleft:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( featlineleft )
	self.featlineleft = featlineleft
	
	local featlineleft1 = LUI.UIImage.new()
	featlineleft1:setLeftRight( true, false, 175, 179 )
	featlineleft1:setTopBottom( true, false, 54, 413 )
	featlineleft1:setZRot( -90 )
	featlineleft1:setImage( RegisterImage( "uie_t7_menu_frontend_featuredlline" ) )
	featlineleft1:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( featlineleft1 )
	self.featlineleft1 = featlineleft1
	
	local PercentCompleteWidget = CoD.Challenges_PercentCompleteWidget_MD.new( menu, controller )
	PercentCompleteWidget:setLeftRight( true, false, 35, 120 )
	PercentCompleteWidget:setTopBottom( true, false, 248.5, 333.5 )
	PercentCompleteWidget:linkToElementModel( self, "percentComplete", true, function ( model )
		local percentComplete = Engine.GetModelValue( model )
		if percentComplete then
			PercentCompleteWidget.percentCompleteCircle:setAlpha( HideIfNumEqualTo( 0, percentComplete ) )
		end
	end )
	PercentCompleteWidget:linkToElementModel( self, "percentComplete", true, function ( model )
		local percentComplete = Engine.GetModelValue( model )
		if percentComplete then
			PercentCompleteWidget.percentCompleteCircle:setShaderVector( 0, CoD.GetVectorComponentFromString( percentComplete, 1 ), CoD.GetVectorComponentFromString( percentComplete, 2 ), CoD.GetVectorComponentFromString( percentComplete, 3 ), CoD.GetVectorComponentFromString( percentComplete, 4 ) )
		end
	end )
	PercentCompleteWidget:linkToElementModel( self, "percentComplete", true, function ( model )
		local percentComplete = Engine.GetModelValue( model )
		if percentComplete then
			PercentCompleteWidget.percentText:setText( Engine.Localize( NumberAsPercentRounded( percentComplete ) ) )
		end
	end )
	self:addElement( PercentCompleteWidget )
	self.PercentCompleteWidget = PercentCompleteWidget
	
	local GameModeIcon = LUI.UIImage.new()
	GameModeIcon:setLeftRight( true, false, 35, 66 )
	GameModeIcon:setTopBottom( false, true, -82.5, -51.5 )
	GameModeIcon:linkToElementModel( self, "gameModeIcon", true, function ( model )
		local gameModeIcon = Engine.GetModelValue( model )
		if gameModeIcon then
			GameModeIcon:setImage( RegisterImage( gameModeIcon ) )
		end
	end )
	self:addElement( GameModeIcon )
	self.GameModeIcon = GameModeIcon
	
	local GameModeText = LUI.UIText.new()
	GameModeText:setLeftRight( true, false, 73, 325 )
	GameModeText:setTopBottom( false, true, -81.5, -51.5 )
	GameModeText:setTTF( "fonts/escom.ttf" )
	GameModeText:setLetterSpacing( 1 )
	GameModeText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	GameModeText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	GameModeText:linkToElementModel( self, "gameModeName", true, function ( model )
		local gameModeName = Engine.GetModelValue( model )
		if gameModeName then
			GameModeText:setText( Engine.Localize( gameModeName ) )
		end
	end )
	self:addElement( GameModeText )
	self.GameModeText = GameModeText
	
	local EmblemName = CoD.WeaponNameWidget.new( menu, controller )
	EmblemName:setLeftRight( true, false, 19, 337.5 )
	EmblemName:setTopBottom( true, false, 103, 137 )
	EmblemName:linkToElementModel( self, "title", true, function ( model )
		local title = Engine.GetModelValue( model )
		if title then
			EmblemName.weaponNameLabel:setText( Engine.Localize( title ) )
		end
	end )
	self:addElement( EmblemName )
	self.EmblemName = EmblemName
	
	local EmblemSubtitle = LUI.UIText.new()
	EmblemSubtitle:setLeftRight( true, false, 20, 338 )
	EmblemSubtitle:setTopBottom( true, false, 141, 161 )
	EmblemSubtitle:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	EmblemSubtitle:setLetterSpacing( 0.5 )
	EmblemSubtitle:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	EmblemSubtitle:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	EmblemSubtitle:linkToElementModel( self, "description", true, function ( model )
		local description = Engine.GetModelValue( model )
		if description then
			EmblemSubtitle:setText( Engine.Localize( description ) )
		end
	end )
	self:addElement( EmblemSubtitle )
	self.EmblemSubtitle = EmblemSubtitle
	
	local BoxButtonLrgInactive = CoD.cac_ButtonBoxLrgInactive.new( menu, controller )
	BoxButtonLrgInactive:setLeftRight( true, true, 0, 0 )
	BoxButtonLrgInactive:setTopBottom( true, false, 1, 92 )
	self:addElement( BoxButtonLrgInactive )
	self.BoxButtonLrgInactive = BoxButtonLrgInactive
	
	local CallingCardsFrameWidget = CoD.CallingCards_FrameWidget.new( menu, controller )
	CallingCardsFrameWidget:setLeftRight( false, false, 0, 0 )
	CallingCardsFrameWidget:setTopBottom( false, false, -195, -195 )
	CallingCardsFrameWidget.CardIconFrame:setScale( 0.72 )
	CallingCardsFrameWidget:linkToElementModel( self, nil, false, function ( model )
		CallingCardsFrameWidget:setModel( model, controller )
	end )
	self:addElement( CallingCardsFrameWidget )
	self.CallingCardsFrameWidget = CallingCardsFrameWidget
	
	local BoxButtonLrgInactiveDiag = CoD.cac_ButtonBoxLrgInactiveDiags.new( menu, controller )
	BoxButtonLrgInactiveDiag:setLeftRight( true, true, 0, 0 )
	BoxButtonLrgInactiveDiag:setTopBottom( true, false, 1, 93.25 )
	self:addElement( BoxButtonLrgInactiveDiag )
	self.BoxButtonLrgInactiveDiag = BoxButtonLrgInactiveDiag
	
	local TitleBg = LUI.UIImage.new()
	TitleBg:setLeftRight( true, false, 1, 349 )
	TitleBg:setTopBottom( true, false, 32.5, 62.4 )
	TitleBg:setRGB( 0, 0, 0 )
	TitleBg:setAlpha( 0.4 )
	TitleBg:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_edges" ) )
	TitleBg:setShaderVector( 0, 0.02, 0.02, 0.02, 0.02 )
	self:addElement( TitleBg )
	self.TitleBg = TitleBg
	
	local featlineleft0 = LUI.UIImage.new()
	featlineleft0:setLeftRight( true, false, 175, 179 )
	featlineleft0:setTopBottom( true, false, -118, 241 )
	featlineleft0:setZRot( -90 )
	featlineleft0:setImage( RegisterImage( "uie_t7_menu_frontend_featuredlline" ) )
	featlineleft0:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( featlineleft0 )
	self.featlineleft0 = featlineleft0
	
	local LockedIcon = CoD.cac_lock.new( menu, controller )
	LockedIcon:setLeftRight( true, false, 161, 193 )
	LockedIcon:setTopBottom( true, false, 31.95, 63.95 )
	self:addElement( LockedIcon )
	self.LockedIcon = LockedIcon
	
	local featlineleft000 = LUI.UIImage.new()
	featlineleft000:setLeftRight( true, false, 175, 179 )
	featlineleft000:setTopBottom( true, false, -147, 212 )
	featlineleft000:setZRot( -90 )
	featlineleft000:setImage( RegisterImage( "uie_t7_menu_frontend_featuredlline" ) )
	featlineleft000:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( featlineleft000 )
	self.featlineleft000 = featlineleft000
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 5 )
				BoxButtonLrgInactiveDiag:completeAnimation()
				self.BoxButtonLrgInactiveDiag:setAlpha( 0 )
				self.clipFinished( BoxButtonLrgInactiveDiag, {} )
				TitleBg:completeAnimation()
				self.TitleBg:setAlpha( 0 )
				self.clipFinished( TitleBg, {} )
				featlineleft0:completeAnimation()
				self.featlineleft0:setAlpha( 0 )
				self.clipFinished( featlineleft0, {} )
				LockedIcon:completeAnimation()
				self.LockedIcon:setAlpha( 0 )
				self.clipFinished( LockedIcon, {} )
				featlineleft000:completeAnimation()
				self.featlineleft000:setAlpha( 0 )
				self.clipFinished( featlineleft000, {} )
			end
		},
		Locked = {
			DefaultClip = function ()
				self:setupElementClipCounter( 6 )
				CallingCardsFrameWidget:completeAnimation()
				self.CallingCardsFrameWidget:setAlpha( 1 )
				self.clipFinished( CallingCardsFrameWidget, {} )
				BoxButtonLrgInactiveDiag:completeAnimation()
				self.BoxButtonLrgInactiveDiag:setAlpha( 0.3 )
				self.clipFinished( BoxButtonLrgInactiveDiag, {} )
				TitleBg:completeAnimation()
				self.TitleBg:setAlpha( 0.4 )
				self.clipFinished( TitleBg, {} )
				featlineleft0:completeAnimation()
				self.featlineleft0:setAlpha( 1 )
				self.clipFinished( featlineleft0, {} )
				LockedIcon:completeAnimation()
				self.LockedIcon:setAlpha( 1 )
				self.clipFinished( LockedIcon, {} )
				featlineleft000:completeAnimation()
				self.featlineleft000:setAlpha( 1 )
				self.clipFinished( featlineleft000, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "Locked",
			condition = function ( menu, element, event )
				return IsSelfModelValueTrue( element, controller, "isLocked" )
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
		element.StartMenuframenoBG0:close()
		element.PercentCompleteWidget:close()
		element.EmblemName:close()
		element.BoxButtonLrgInactive:close()
		element.CallingCardsFrameWidget:close()
		element.BoxButtonLrgInactiveDiag:close()
		element.LockedIcon:close()
		element.GameModeIcon:close()
		element.GameModeText:close()
		element.EmblemSubtitle:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

