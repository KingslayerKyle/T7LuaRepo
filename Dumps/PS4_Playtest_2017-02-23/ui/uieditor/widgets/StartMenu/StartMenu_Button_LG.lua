require( "ui.uieditor.widgets.CAC.cac_ButtonBoxLrgInactive" )
require( "ui.uieditor.widgets.CAC.cac_ButtonBoxLrgInactiveDiags" )
require( "ui.uieditor.widgets.CAC.cac_lock" )
require( "ui.uieditor.widgets.Lobby.Common.FE_FocusBarContainer" )
require( "ui.uieditor.widgets.StartMenu.StartMenu_Identity_SubTitle" )
require( "ui.uieditor.widgets.StartMenu.StartMenu_ImageContainer" )
require( "ui.uieditor.widgets.StartMenu.StartMenu_OnlineOnly" )

CoD.StartMenu_Button_LG = InheritFrom( LUI.UIElement )
CoD.StartMenu_Button_LG.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.StartMenu_Button_LG )
	self.id = "StartMenu_Button_LG"
	self.soundSet = "ChooseDecal"
	self:setLeftRight( 0, 0, 0, 543 )
	self:setTopBottom( 0, 0, 0, 210 )
	self:makeFocusable()
	self:setHandleMouse( true )
	self.anyChildUsesUpdateState = true
	
	local BoxButtonLrgInactive = CoD.cac_ButtonBoxLrgInactive.new( menu, controller )
	BoxButtonLrgInactive:setLeftRight( 0, 1, -3, 3 )
	BoxButtonLrgInactive:setTopBottom( 0, 1, -3, 3 )
	BoxButtonLrgInactive:setRGB( 0.87, 0.97, 1 )
	BoxButtonLrgInactive:setAlpha( 0.4 )
	self:addElement( BoxButtonLrgInactive )
	self.BoxButtonLrgInactive = BoxButtonLrgInactive
	
	local ImageContainer = CoD.StartMenu_ImageContainer.new( menu, controller )
	ImageContainer:setLeftRight( 0, 1, 3, -1 )
	ImageContainer:setTopBottom( 0, 1, 2, -4 )
	self:addElement( ImageContainer )
	self.ImageContainer = ImageContainer
	
	local Title = LUI.UIText.new()
	Title:setLeftRight( 0, 0, 18, 327 )
	Title:setTopBottom( 1, 1, -77, -44 )
	Title:setText( Engine.Localize( "MENU_MULTIPLAYER_CAPS" ) )
	Title:setTTF( "fonts/escom.ttf" )
	Title:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	Title:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( Title )
	self.Title = Title
	
	local LockBackground = LUI.UIImage.new()
	LockBackground:setLeftRight( 0, 1, 3, -3 )
	LockBackground:setTopBottom( 0, 1, 1, -5 )
	LockBackground:setRGB( 0, 0, 0 )
	LockBackground:setAlpha( 0 )
	self:addElement( LockBackground )
	self.LockBackground = LockBackground
	
	local LOCKBlackCircle0 = LUI.UIImage.new()
	LOCKBlackCircle0:setLeftRight( 0.5, 0.5, -34, 33 )
	LOCKBlackCircle0:setTopBottom( 0.5, 0.5, -36, 31 )
	LOCKBlackCircle0:setRGB( 0, 0, 0 )
	LOCKBlackCircle0:setAlpha( 0.3 )
	LOCKBlackCircle0:setScale( 0.9 )
	LOCKBlackCircle0:setImage( RegisterImage( "uie_t7_core_hud_ammowidget_panelcircle" ) )
	self:addElement( LOCKBlackCircle0 )
	self.LOCKBlackCircle0 = LOCKBlackCircle0
	
	local TitleBg = LUI.UIImage.new()
	TitleBg:setLeftRight( 0.5, 0.5, -267, 269 )
	TitleBg:setTopBottom( 0.5, 0.5, -28, 21 )
	TitleBg:setRGB( 0, 0, 0 )
	TitleBg:setAlpha( 0 )
	TitleBg:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_edges" ) )
	TitleBg:setShaderVector( 0, 0.02, 0.02, 0.02, 0.02 )
	self:addElement( TitleBg )
	self.TitleBg = TitleBg
	
	local lockedIcon = CoD.cac_lock.new( menu, controller )
	lockedIcon:setLeftRight( 0.5, 0.5, -24, 24 )
	lockedIcon:setTopBottom( 0.5, 0.5, -27, 21 )
	self:addElement( lockedIcon )
	self.lockedIcon = lockedIcon
	
	local StartMenuIdentitySubTitle0 = CoD.StartMenu_Identity_SubTitle.new( menu, controller )
	StartMenuIdentitySubTitle0:setLeftRight( 0, 0, 8, 539 )
	StartMenuIdentitySubTitle0:setTopBottom( 1, 1, -48, -9 )
	StartMenuIdentitySubTitle0.SubTitle:setText( Engine.Localize( "Customize your campaign character" ) )
	StartMenuIdentitySubTitle0.SubTitle:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	self:addElement( StartMenuIdentitySubTitle0 )
	self.StartMenuIdentitySubTitle0 = StartMenuIdentitySubTitle0
	
	local ImageText = LUI.UIText.new()
	ImageText:setLeftRight( 0, 1, 0, 0 )
	ImageText:setTopBottom( 0, 0, 59, 161 )
	ImageText:setText( Engine.Localize( "" ) )
	ImageText:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	ImageText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	ImageText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( ImageText )
	self.ImageText = ImageText
	
	local BoxButtonLrgInactiveDiag = CoD.cac_ButtonBoxLrgInactiveDiags.new( menu, controller )
	BoxButtonLrgInactiveDiag:setLeftRight( 0, 1, 0, -2 )
	BoxButtonLrgInactiveDiag:setTopBottom( 0, 1, 0, -2 )
	BoxButtonLrgInactiveDiag:setAlpha( 0 )
	self:addElement( BoxButtonLrgInactiveDiag )
	self.BoxButtonLrgInactiveDiag = BoxButtonLrgInactiveDiag
	
	local StartMenuOnlineOnly = CoD.StartMenu_OnlineOnly.new( menu, controller )
	StartMenuOnlineOnly:setLeftRight( 0.5, 0.5, -72, 70 )
	StartMenuOnlineOnly:setTopBottom( 0.5, 0.5, -25, 17 )
	StartMenuOnlineOnly:setScale( 0.9 )
	StartMenuOnlineOnly.TextBox0:setText( LocalizeToUpperString( "MENU_ONLINE_ONLY" ) )
	self:addElement( StartMenuOnlineOnly )
	self.StartMenuOnlineOnly = StartMenuOnlineOnly
	
	local FocusBarT = CoD.FE_FocusBarContainer.new( menu, controller )
	FocusBarT:setLeftRight( 0, 1, 0, 0 )
	FocusBarT:setTopBottom( 0, 0, -1, 5 )
	FocusBarT:setAlpha( 0 )
	FocusBarT:setZoom( 1 )
	self:addElement( FocusBarT )
	self.FocusBarT = FocusBarT
	
	local FocusBarB = CoD.FE_FocusBarContainer.new( menu, controller )
	FocusBarB:setLeftRight( 0, 1, 0, 0 )
	FocusBarB:setTopBottom( 1, 1, -5, 1 )
	FocusBarB:setAlpha( 0 )
	FocusBarB:setZoom( 1 )
	self:addElement( FocusBarB )
	self.FocusBarB = FocusBarB
	
	self.resetProperties = function ()
		lockedIcon:completeAnimation()
		ImageContainer:completeAnimation()
		StartMenuOnlineOnly:completeAnimation()
		LockBackground:completeAnimation()
		LOCKBlackCircle0:completeAnimation()
		FocusBarB:completeAnimation()
		FocusBarT:completeAnimation()
		BoxButtonLrgInactive:completeAnimation()
		BoxButtonLrgInactiveDiag:completeAnimation()
		TitleBg:completeAnimation()
		lockedIcon:setAlpha( 1 )
		ImageContainer.ImageContainer:setAlpha( 1 )
		StartMenuOnlineOnly:setAlpha( 1 )
		StartMenuOnlineOnly.TextBox0:setText( LocalizeToUpperString( "MENU_ONLINE_ONLY" ) )
		LockBackground:setAlpha( 0 )
		LOCKBlackCircle0:setAlpha( 0.3 )
		FocusBarB:setAlpha( 0 )
		FocusBarT:setAlpha( 0 )
		BoxButtonLrgInactive:setAlpha( 0.4 )
		BoxButtonLrgInactiveDiag:setAlpha( 0 )
		TitleBg:setAlpha( 0 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 5 )
				ImageContainer:completeAnimation()
				ImageContainer.ImageContainer:completeAnimation()
				self.ImageContainer.ImageContainer:setAlpha( 0.79 )
				self.clipFinished( ImageContainer, {} )
				LockBackground:completeAnimation()
				self.LockBackground:setAlpha( 0.05 )
				self.clipFinished( LockBackground, {} )
				LOCKBlackCircle0:completeAnimation()
				self.LOCKBlackCircle0:setAlpha( 0 )
				self.clipFinished( LOCKBlackCircle0, {} )
				lockedIcon:completeAnimation()
				self.lockedIcon:setAlpha( 0 )
				self.clipFinished( lockedIcon, {} )
				StartMenuOnlineOnly:completeAnimation()
				self.StartMenuOnlineOnly:setAlpha( 0 )
				self.clipFinished( StartMenuOnlineOnly, {} )
			end,
			Focus = function ()
				self.resetProperties()
				self:setupElementClipCounter( 6 )
				BoxButtonLrgInactive:completeAnimation()
				self.BoxButtonLrgInactive:setAlpha( 0.7 )
				self.clipFinished( BoxButtonLrgInactive, {} )
				LOCKBlackCircle0:completeAnimation()
				self.LOCKBlackCircle0:setAlpha( 0 )
				self.clipFinished( LOCKBlackCircle0, {} )
				lockedIcon:completeAnimation()
				self.lockedIcon:setAlpha( 0 )
				self.clipFinished( lockedIcon, {} )
				StartMenuOnlineOnly:completeAnimation()
				self.StartMenuOnlineOnly:setAlpha( 0 )
				self.clipFinished( StartMenuOnlineOnly, {} )
				FocusBarT:completeAnimation()
				self.FocusBarT:setAlpha( 1 )
				self.clipFinished( FocusBarT, {} )
				FocusBarB:completeAnimation()
				self.FocusBarB:setAlpha( 1 )
				self.clipFinished( FocusBarB, {} )
			end
		},
		Disabled = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 6 )
				ImageContainer:completeAnimation()
				ImageContainer.ImageContainer:completeAnimation()
				self.ImageContainer.ImageContainer:setAlpha( 0.79 )
				self.clipFinished( ImageContainer, {} )
				LockBackground:completeAnimation()
				self.LockBackground:setAlpha( 0.1 )
				self.clipFinished( LockBackground, {} )
				LOCKBlackCircle0:completeAnimation()
				self.LOCKBlackCircle0:setAlpha( 0 )
				self.clipFinished( LOCKBlackCircle0, {} )
				TitleBg:completeAnimation()
				self.TitleBg:setAlpha( 0.4 )
				self.clipFinished( TitleBg, {} )
				BoxButtonLrgInactiveDiag:completeAnimation()
				self.BoxButtonLrgInactiveDiag:setAlpha( 0.5 )
				self.clipFinished( BoxButtonLrgInactiveDiag, {} )
				StartMenuOnlineOnly:completeAnimation()
				self.StartMenuOnlineOnly:setAlpha( 0 )
				self.clipFinished( StartMenuOnlineOnly, {} )
			end,
			Focus = function ()
				self.resetProperties()
				self:setupElementClipCounter( 8 )
				BoxButtonLrgInactive:completeAnimation()
				self.BoxButtonLrgInactive:setAlpha( 0.7 )
				self.clipFinished( BoxButtonLrgInactive, {} )
				LOCKBlackCircle0:completeAnimation()
				self.LOCKBlackCircle0:setAlpha( 0 )
				self.clipFinished( LOCKBlackCircle0, {} )
				TitleBg:completeAnimation()
				self.TitleBg:setAlpha( 0.4 )
				self.clipFinished( TitleBg, {} )
				lockedIcon:completeAnimation()
				self.lockedIcon:setAlpha( 0.8 )
				self.clipFinished( lockedIcon, {} )
				BoxButtonLrgInactiveDiag:completeAnimation()
				self.BoxButtonLrgInactiveDiag:setAlpha( 0.5 )
				self.clipFinished( BoxButtonLrgInactiveDiag, {} )
				StartMenuOnlineOnly:completeAnimation()
				self.StartMenuOnlineOnly:setAlpha( 0 )
				self.clipFinished( StartMenuOnlineOnly, {} )
				FocusBarT:completeAnimation()
				self.FocusBarT:setAlpha( 1 )
				self.clipFinished( FocusBarT, {} )
				FocusBarB:completeAnimation()
				self.FocusBarB:setAlpha( 1 )
				self.clipFinished( FocusBarB, {} )
			end
		},
		OnlineOnly = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 4 )
				ImageContainer:completeAnimation()
				ImageContainer.ImageContainer:completeAnimation()
				self.ImageContainer.ImageContainer:setAlpha( 0.79 )
				self.clipFinished( ImageContainer, {} )
				LockBackground:completeAnimation()
				self.LockBackground:setAlpha( 0.1 )
				self.clipFinished( LockBackground, {} )
				LOCKBlackCircle0:completeAnimation()
				self.LOCKBlackCircle0:setAlpha( 0 )
				self.clipFinished( LOCKBlackCircle0, {} )
				lockedIcon:completeAnimation()
				self.lockedIcon:setAlpha( 0 )
				self.clipFinished( lockedIcon, {} )
			end,
			Focus = function ()
				self.resetProperties()
				self:setupElementClipCounter( 5 )
				BoxButtonLrgInactive:completeAnimation()
				self.BoxButtonLrgInactive:setAlpha( 0.7 )
				self.clipFinished( BoxButtonLrgInactive, {} )
				LOCKBlackCircle0:completeAnimation()
				self.LOCKBlackCircle0:setAlpha( 0 )
				self.clipFinished( LOCKBlackCircle0, {} )
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
		},
		ComingSoon = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 5 )
				ImageContainer:completeAnimation()
				ImageContainer.ImageContainer:completeAnimation()
				self.ImageContainer.ImageContainer:setAlpha( 0.79 )
				self.clipFinished( ImageContainer, {} )
				LockBackground:completeAnimation()
				self.LockBackground:setAlpha( 0.1 )
				self.clipFinished( LockBackground, {} )
				LOCKBlackCircle0:completeAnimation()
				self.LOCKBlackCircle0:setAlpha( 0 )
				self.clipFinished( LOCKBlackCircle0, {} )
				lockedIcon:completeAnimation()
				self.lockedIcon:setAlpha( 0 )
				self.clipFinished( lockedIcon, {} )
				StartMenuOnlineOnly:completeAnimation()
				StartMenuOnlineOnly.TextBox0:completeAnimation()
				self.StartMenuOnlineOnly.TextBox0:setText( LocalizeToUpperString( "MENU_COMING_SOON" ) )
				self.clipFinished( StartMenuOnlineOnly, {} )
			end,
			Focus = function ()
				self.resetProperties()
				self:setupElementClipCounter( 5 )
				BoxButtonLrgInactive:completeAnimation()
				self.BoxButtonLrgInactive:setAlpha( 0.7 )
				self.clipFinished( BoxButtonLrgInactive, {} )
				LOCKBlackCircle0:completeAnimation()
				self.LOCKBlackCircle0:setAlpha( 0 )
				self.clipFinished( LOCKBlackCircle0, {} )
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
			stateName = "Disabled",
			condition = function ( menu, element, event )
				return AlwaysFalse()
			end
		},
		{
			stateName = "OnlineOnly",
			condition = function ( menu, element, event )
				return AlwaysFalse()
			end
		},
		{
			stateName = "ComingSoon",
			condition = function ( menu, element, event )
				return AlwaysFalse()
			end
		}
	} )
	StartMenuOnlineOnly.id = "StartMenuOnlineOnly"
	self:registerEventHandler( "gain_focus", function ( self, event )
		if self.m_focusable and self.StartMenuOnlineOnly:processEvent( event ) then
			return true
		else
			return LUI.UIElement.gainFocus( self, event )
		end
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.BoxButtonLrgInactive:close()
		self.ImageContainer:close()
		self.lockedIcon:close()
		self.StartMenuIdentitySubTitle0:close()
		self.BoxButtonLrgInactiveDiag:close()
		self.StartMenuOnlineOnly:close()
		self.FocusBarT:close()
		self.FocusBarB:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

