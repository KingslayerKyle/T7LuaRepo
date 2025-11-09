require( "ui.uieditor.widgets.StartMenu.StartMenu_frame_noBG" )
require( "ui.uieditor.widgets.CAC.cac_ButtonBoxLrgInactive" )
require( "ui.uieditor.widgets.CallingCards.CallingCards_FrameWidget" )
require( "ui.uieditor.widgets.CAC.MenuSelectScreen.WeaponNameWidget" )
require( "ui.uieditor.widgets.CAC.cac_lock" )
require( "ui.uieditor.widgets.CAC.cac_ButtonBoxLrgInactiveDiags" )

CoD.Challenges_CallingCardProfiler_DarkOps = InheritFrom( LUI.UIElement )
CoD.Challenges_CallingCardProfiler_DarkOps.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.Challenges_CallingCardProfiler_DarkOps )
	self.id = "Challenges_CallingCardProfiler_DarkOps"
	self.soundSet = "ChooseDecal"
	self:setLeftRight( true, false, 0, 350 )
	self:setTopBottom( true, false, 0, 484 )
	self.anyChildUsesUpdateState = true
	
	local StartMenuframenoBG0 = CoD.StartMenu_frame_noBG.new( menu, controller )
	StartMenuframenoBG0:setLeftRight( true, true, 0, 0 )
	StartMenuframenoBG0:setTopBottom( true, true, 0, 0 )
	self:addElement( StartMenuframenoBG0 )
	self.StartMenuframenoBG0 = StartMenuframenoBG0
	
	local BoxButtonLrgInactive = CoD.cac_ButtonBoxLrgInactive.new( menu, controller )
	BoxButtonLrgInactive:setLeftRight( true, true, 0, 0 )
	BoxButtonLrgInactive:setTopBottom( true, false, 1, 92 )
	self:addElement( BoxButtonLrgInactive )
	self.BoxButtonLrgInactive = BoxButtonLrgInactive
	
	local SelectedCardIcon = LUI.UIImage.new()
	SelectedCardIcon:setLeftRight( true, true, 3, -2 )
	SelectedCardIcon:setTopBottom( true, false, 3, 89 )
	SelectedCardIcon:linkToElementModel( self, "iconId", true, function ( model )
		local iconId = Engine.GetModelValue( model )
		if iconId then
			SelectedCardIcon:setImage( RegisterImage( GetBackgroundByID( iconId ) ) )
		end
	end )
	self:addElement( SelectedCardIcon )
	self.SelectedCardIcon = SelectedCardIcon
	
	local CallingCardsFrameWidget0 = CoD.CallingCards_FrameWidget.new( menu, controller )
	CallingCardsFrameWidget0:setLeftRight( true, true, -65, 65 )
	CallingCardsFrameWidget0:setTopBottom( true, false, -14, 106 )
	CallingCardsFrameWidget0.CardIconFrame:setScale( 0.72 )
	CallingCardsFrameWidget0:linkToElementModel( self, nil, false, function ( model )
		CallingCardsFrameWidget0:setModel( model, controller )
	end )
	self:addElement( CallingCardsFrameWidget0 )
	self.CallingCardsFrameWidget0 = CallingCardsFrameWidget0
	
	local CardDescription = LUI.UIText.new()
	CardDescription:setLeftRight( true, false, 20, 338 )
	CardDescription:setTopBottom( true, false, 141, 161 )
	CardDescription:setTTF( "fonts/default.ttf" )
	CardDescription:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	CardDescription:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	CardDescription:linkToElementModel( self, "description", true, function ( model )
		local description = Engine.GetModelValue( model )
		if description then
			CardDescription:setText( Engine.Localize( description ) )
		end
	end )
	self:addElement( CardDescription )
	self.CardDescription = CardDescription
	
	local DarkOpsIcon = LUI.UIImage.new()
	DarkOpsIcon:setLeftRight( true, false, -4, 170 )
	DarkOpsIcon:setTopBottom( true, false, 187, 361 )
	DarkOpsIcon:setImage( RegisterImage( "uie_t7_icons_challenges_mp_darkops" ) )
	self:addElement( DarkOpsIcon )
	self.DarkOpsIcon = DarkOpsIcon
	
	local DarkOpsTitle = LUI.UIText.new()
	DarkOpsTitle:setLeftRight( true, false, 20, 329 )
	DarkOpsTitle:setTopBottom( false, true, -124, -90 )
	DarkOpsTitle:setText( Engine.Localize( "MENU_CHALLENGE_CATEGORY_DARKOPS" ) )
	DarkOpsTitle:setTTF( "fonts/escom.ttf" )
	DarkOpsTitle:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	DarkOpsTitle:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( DarkOpsTitle )
	self.DarkOpsTitle = DarkOpsTitle
	
	local DarkOpsDescription = LUI.UIText.new()
	DarkOpsDescription:setLeftRight( true, true, 20, -24 )
	DarkOpsDescription:setTopBottom( false, true, -84, -64 )
	DarkOpsDescription:setText( Engine.Localize( "MENU_CHALLENGE_CATEGORY_DARKOPS_HINT" ) )
	DarkOpsDescription:setTTF( "fonts/default.ttf" )
	DarkOpsDescription:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	DarkOpsDescription:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( DarkOpsDescription )
	self.DarkOpsDescription = DarkOpsDescription
	
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
	
	local featlineleft1 = LUI.UIImage.new()
	featlineleft1:setLeftRight( true, false, 175, 179 )
	featlineleft1:setTopBottom( true, false, 8, 367 )
	featlineleft1:setZRot( -90 )
	featlineleft1:setImage( RegisterImage( "uie_t7_menu_frontend_featuredlline" ) )
	featlineleft1:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( featlineleft1 )
	self.featlineleft1 = featlineleft1
	
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
	
	local BoxButtonLrgInactiveDiag = CoD.cac_ButtonBoxLrgInactiveDiags.new( menu, controller )
	BoxButtonLrgInactiveDiag:setLeftRight( true, true, 0, 0 )
	BoxButtonLrgInactiveDiag:setTopBottom( true, false, 1, 93.25 )
	self:addElement( BoxButtonLrgInactiveDiag )
	self.BoxButtonLrgInactiveDiag = BoxButtonLrgInactiveDiag
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 7 )
				SelectedCardIcon:completeAnimation()
				self.SelectedCardIcon:setAlpha( 1 )
				self.clipFinished( SelectedCardIcon, {} )
				CallingCardsFrameWidget0:completeAnimation()
				self.CallingCardsFrameWidget0:setAlpha( 1 )
				self.clipFinished( CallingCardsFrameWidget0, {} )
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
				BoxButtonLrgInactiveDiag:completeAnimation()
				self.BoxButtonLrgInactiveDiag:setAlpha( 0 )
				self.clipFinished( BoxButtonLrgInactiveDiag, {} )
			end
		},
		Locked = {
			DefaultClip = function ()
				self:setupElementClipCounter( 6 )
				SelectedCardIcon:completeAnimation()
				self.SelectedCardIcon:setAlpha( 0 )
				self.clipFinished( SelectedCardIcon, {} )
				CallingCardsFrameWidget0:completeAnimation()
				self.CallingCardsFrameWidget0:setAlpha( 0 )
				self.clipFinished( CallingCardsFrameWidget0, {} )
				TitleBg:completeAnimation()
				self.TitleBg:setAlpha( 0.4 )
				self.clipFinished( TitleBg, {} )
				featlineleft0:completeAnimation()
				self.featlineleft0:setLeftRight( true, false, 175, 179 )
				self.featlineleft0:setTopBottom( true, false, -117, 242 )
				self.clipFinished( featlineleft0, {} )
				LockedIcon:completeAnimation()
				self.LockedIcon:setAlpha( 1 )
				self.clipFinished( LockedIcon, {} )
				BoxButtonLrgInactiveDiag:completeAnimation()
				self.BoxButtonLrgInactiveDiag:setAlpha( 0.5 )
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
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.StartMenuframenoBG0:close()
		element.BoxButtonLrgInactive:close()
		element.CallingCardsFrameWidget0:close()
		element.EmblemName:close()
		element.LockedIcon:close()
		element.BoxButtonLrgInactiveDiag:close()
		element.SelectedCardIcon:close()
		element.CardDescription:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

