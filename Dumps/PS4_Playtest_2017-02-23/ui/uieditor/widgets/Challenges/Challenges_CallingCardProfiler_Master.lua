require( "ui.uieditor.widgets.CAC.cac_ButtonBoxLrgInactive" )
require( "ui.uieditor.widgets.CAC.cac_ButtonBoxLrgInactiveDiags" )
require( "ui.uieditor.widgets.CAC.cac_lock" )
require( "ui.uieditor.widgets.CAC.MenuSelectScreen.WeaponNameWidget" )
require( "ui.uieditor.widgets.CallingCards.CallingCards_FrameWidget" )
require( "ui.uieditor.widgets.Challenges.Challenges_PercentCompleteWidget_MD" )
require( "ui.uieditor.widgets.StartMenu.StartMenu_frame_noBG" )

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
	self:setLeftRight( 0, 0, 0, 525 )
	self:setTopBottom( 0, 0, 0, 720 )
	self.anyChildUsesUpdateState = true
	
	local StartMenuframenoBG0 = CoD.StartMenu_frame_noBG.new( menu, controller )
	StartMenuframenoBG0:setLeftRight( 0, 1, 0, 0 )
	StartMenuframenoBG0:setTopBottom( 0, 1, 0, 0 )
	self:addElement( StartMenuframenoBG0 )
	self.StartMenuframenoBG0 = StartMenuframenoBG0
	
	local featlineleft = LUI.UIImage.new()
	featlineleft:setLeftRight( 0, 0, 263, 269 )
	featlineleft:setTopBottom( 0, 0, 257, 795 )
	featlineleft:setZRot( -90 )
	featlineleft:setImage( RegisterImage( "uie_t7_menu_frontend_featuredlline" ) )
	featlineleft:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( featlineleft )
	self.featlineleft = featlineleft
	
	local featlineleft1 = LUI.UIImage.new()
	featlineleft1:setLeftRight( 0, 0, 263, 269 )
	featlineleft1:setTopBottom( 0, 0, 81, 619 )
	featlineleft1:setZRot( -90 )
	featlineleft1:setImage( RegisterImage( "uie_t7_menu_frontend_featuredlline" ) )
	featlineleft1:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( featlineleft1 )
	self.featlineleft1 = featlineleft1
	
	local PercentCompleteWidget = CoD.Challenges_PercentCompleteWidget_MD.new( menu, controller )
	PercentCompleteWidget:setLeftRight( 0, 0, 52, 180 )
	PercentCompleteWidget:setTopBottom( 0, 0, 372, 500 )
	PercentCompleteWidget:linkToElementModel( self, "percentComplete", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			PercentCompleteWidget.percentCompleteCircle:setAlpha( HideIfNumEqualTo( 0, modelValue ) )
		end
	end )
	PercentCompleteWidget:linkToElementModel( self, "percentComplete", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			PercentCompleteWidget.percentCompleteCircle:setShaderVector( 0, CoD.GetVectorComponentFromString( modelValue, 1 ), CoD.GetVectorComponentFromString( modelValue, 2 ), CoD.GetVectorComponentFromString( modelValue, 3 ), CoD.GetVectorComponentFromString( modelValue, 4 ) )
		end
	end )
	PercentCompleteWidget:linkToElementModel( self, "percentComplete", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			PercentCompleteWidget.percentText:setText( NumberAsPercentRounded( modelValue ) )
		end
	end )
	self:addElement( PercentCompleteWidget )
	self.PercentCompleteWidget = PercentCompleteWidget
	
	local GameModeIcon = LUI.UIImage.new()
	GameModeIcon:setLeftRight( 0, 0, 53, 99 )
	GameModeIcon:setTopBottom( 1, 1, -123, -77 )
	GameModeIcon:linkToElementModel( self, "gameModeIcon", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			GameModeIcon:setImage( RegisterImage( modelValue ) )
		end
	end )
	self:addElement( GameModeIcon )
	self.GameModeIcon = GameModeIcon
	
	local GameModeText = LUI.UIText.new()
	GameModeText:setLeftRight( 0, 0, 109, 487 )
	GameModeText:setTopBottom( 1, 1, -122, -77 )
	GameModeText:setTTF( "fonts/escom.ttf" )
	GameModeText:setLetterSpacing( 1 )
	GameModeText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	GameModeText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	GameModeText:linkToElementModel( self, "gameModeName", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			GameModeText:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( GameModeText )
	self.GameModeText = GameModeText
	
	local EmblemName = CoD.WeaponNameWidget.new( menu, controller )
	EmblemName:setLeftRight( 0, 0, 28, 506 )
	EmblemName:setTopBottom( 0, 0, 154.5, 205.5 )
	EmblemName:linkToElementModel( self, "title", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			EmblemName.weaponNameLabel:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( EmblemName )
	self.EmblemName = EmblemName
	
	local EmblemSubtitle = LUI.UIText.new()
	EmblemSubtitle:setLeftRight( 0, 0, 30, 507 )
	EmblemSubtitle:setTopBottom( 0, 0, 211, 241 )
	EmblemSubtitle:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	EmblemSubtitle:setLetterSpacing( 0.5 )
	EmblemSubtitle:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	EmblemSubtitle:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	EmblemSubtitle:linkToElementModel( self, "description", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			EmblemSubtitle:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( EmblemSubtitle )
	self.EmblemSubtitle = EmblemSubtitle
	
	local BoxButtonLrgInactive = CoD.cac_ButtonBoxLrgInactive.new( menu, controller )
	BoxButtonLrgInactive:setLeftRight( 0, 1, 0, 0 )
	BoxButtonLrgInactive:setTopBottom( 0, 0, 2, 138 )
	self:addElement( BoxButtonLrgInactive )
	self.BoxButtonLrgInactive = BoxButtonLrgInactive
	
	local CallingCardsFrameWidget = CoD.CallingCards_FrameWidget.new( menu, controller )
	CallingCardsFrameWidget:setLeftRight( 0.5, 0.5, 0, 0 )
	CallingCardsFrameWidget:setTopBottom( 0.5, 0.5, -292, -292 )
	CallingCardsFrameWidget.CardIconFrame:setScale( 0.72 )
	CallingCardsFrameWidget:linkToElementModel( self, nil, false, function ( model )
		CallingCardsFrameWidget:setModel( model, controller )
	end )
	self:addElement( CallingCardsFrameWidget )
	self.CallingCardsFrameWidget = CallingCardsFrameWidget
	
	local BoxButtonLrgInactiveDiag = CoD.cac_ButtonBoxLrgInactiveDiags.new( menu, controller )
	BoxButtonLrgInactiveDiag:setLeftRight( 0, 1, 0, 0 )
	BoxButtonLrgInactiveDiag:setTopBottom( 0, 0, 2, 140 )
	self:addElement( BoxButtonLrgInactiveDiag )
	self.BoxButtonLrgInactiveDiag = BoxButtonLrgInactiveDiag
	
	local TitleBg = LUI.UIImage.new()
	TitleBg:setLeftRight( 0, 0, 1, 523 )
	TitleBg:setTopBottom( 0, 0, 49, 94 )
	TitleBg:setRGB( 0, 0, 0 )
	TitleBg:setAlpha( 0.4 )
	TitleBg:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_edges" ) )
	TitleBg:setShaderVector( 0, 0.02, 0.02, 0.02, 0.02 )
	self:addElement( TitleBg )
	self.TitleBg = TitleBg
	
	local featlineleft0 = LUI.UIImage.new()
	featlineleft0:setLeftRight( 0, 0, 263, 269 )
	featlineleft0:setTopBottom( 0, 0, -177, 361 )
	featlineleft0:setZRot( -90 )
	featlineleft0:setImage( RegisterImage( "uie_t7_menu_frontend_featuredlline" ) )
	featlineleft0:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( featlineleft0 )
	self.featlineleft0 = featlineleft0
	
	local LockedIcon = CoD.cac_lock.new( menu, controller )
	LockedIcon:setLeftRight( 0, 0, 242, 290 )
	LockedIcon:setTopBottom( 0, 0, 48, 96 )
	self:addElement( LockedIcon )
	self.LockedIcon = LockedIcon
	
	local featlineleft000 = LUI.UIImage.new()
	featlineleft000:setLeftRight( 0, 0, 263, 269 )
	featlineleft000:setTopBottom( 0, 0, -220, 318 )
	featlineleft000:setZRot( -90 )
	featlineleft000:setImage( RegisterImage( "uie_t7_menu_frontend_featuredlline" ) )
	featlineleft000:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( featlineleft000 )
	self.featlineleft000 = featlineleft000
	
	self.resetProperties = function ()
		LockedIcon:completeAnimation()
		featlineleft000:completeAnimation()
		featlineleft0:completeAnimation()
		TitleBg:completeAnimation()
		BoxButtonLrgInactiveDiag:completeAnimation()
		LockedIcon:setAlpha( 1 )
		featlineleft000:setAlpha( 1 )
		featlineleft0:setAlpha( 1 )
		TitleBg:setAlpha( 0.4 )
		BoxButtonLrgInactiveDiag:setAlpha( 1 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
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
				self.resetProperties()
				self:setupElementClipCounter( 1 )
				BoxButtonLrgInactiveDiag:completeAnimation()
				self.BoxButtonLrgInactiveDiag:setAlpha( 0.3 )
				self.clipFinished( BoxButtonLrgInactiveDiag, {} )
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
	CallingCardsFrameWidget.id = "CallingCardsFrameWidget"
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.StartMenuframenoBG0:close()
		self.PercentCompleteWidget:close()
		self.EmblemName:close()
		self.BoxButtonLrgInactive:close()
		self.CallingCardsFrameWidget:close()
		self.BoxButtonLrgInactiveDiag:close()
		self.LockedIcon:close()
		self.GameModeIcon:close()
		self.GameModeText:close()
		self.EmblemSubtitle:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

