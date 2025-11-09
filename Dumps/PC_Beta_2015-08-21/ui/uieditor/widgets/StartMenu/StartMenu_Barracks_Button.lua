require( "ui.uieditor.widgets.StartMenu.StartMenu_Identity_SubTitle" )
require( "ui.uieditor.widgets.CAC.cac_ButtonBoxLrgInactiveDiags" )
require( "ui.uieditor.widgets.CAC.cac_lock" )
require( "ui.uieditor.widgets.StartMenu.StartMenu_frame_noBG" )
require( "ui.uieditor.widgets.Lobby.Common.FE_FocusBarContainer" )

CoD.StartMenu_Barracks_Button = InheritFrom( LUI.UIElement )
CoD.StartMenu_Barracks_Button.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.StartMenu_Barracks_Button )
	self.id = "StartMenu_Barracks_Button"
	self.soundSet = "ChooseDecal"
	self:setLeftRight( true, false, 0, 321 )
	self:setTopBottom( true, false, 0, 339 )
	self:makeFocusable()
	self:setHandleMouse( true )
	self.anyChildUsesUpdateState = true
	
	local Emblem = LUI.UIImage.new()
	Emblem:setLeftRight( false, false, -61, 67 )
	Emblem:setTopBottom( true, false, 20, 148 )
	Emblem:setAlpha( 0 )
	self:addElement( Emblem )
	self.Emblem = Emblem
	
	local RankNameBackground = LUI.UIImage.new()
	RankNameBackground:setLeftRight( false, false, -111, 117 )
	RankNameBackground:setTopBottom( true, false, 169.5, 197.5 )
	RankNameBackground:setRGB( 0.13, 0.13, 0.13 )
	RankNameBackground:setAlpha( 0.5 )
	self:addElement( RankNameBackground )
	self.RankNameBackground = RankNameBackground
	
	local RankBackground = LUI.UIImage.new()
	RankBackground:setLeftRight( false, false, -111, 117 )
	RankBackground:setTopBottom( true, false, 199.5, 227.5 )
	RankBackground:setRGB( 0.82, 0.82, 0.82 )
	RankBackground:setAlpha( 0.5 )
	self:addElement( RankBackground )
	self.RankBackground = RankBackground
	
	local RankName = LUI.UIText.new()
	RankName:setLeftRight( false, false, -111, 117 )
	RankName:setTopBottom( true, false, 173.5, 193.5 )
	RankName:setAlpha( 0.5 )
	RankName:setText( Engine.Localize( "Vindicator" ) )
	RankName:setTTF( "fonts/UnitedSansSmCdMd.ttf" )
	RankName:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	RankName:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( RankName )
	self.RankName = RankName
	
	local Rank = LUI.UIText.new()
	Rank:setLeftRight( false, false, -111, 117 )
	Rank:setTopBottom( true, false, 199.5, 227.5 )
	Rank:setRGB( 0.14, 0.14, 0.14 )
	Rank:setAlpha( 0.5 )
	Rank:setText( Engine.Localize( "LEVEL 18" ) )
	Rank:setTTF( "fonts/escom.ttf" )
	Rank:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	Rank:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( Rank )
	self.Rank = Rank
	
	local SessionName = LUI.UIText.new()
	SessionName:setLeftRight( true, false, 11.73, 217.73 )
	SessionName:setTopBottom( false, true, -51, -29 )
	SessionName:setAlpha( 0.5 )
	SessionName:setText( Engine.Localize( "MENU_CAMPAIGN_CAPS" ) )
	SessionName:setTTF( "fonts/escom.ttf" )
	SessionName:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	SessionName:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( SessionName )
	self.SessionName = SessionName
	
	local StartMenuIdentitySubTitle0 = CoD.StartMenu_Identity_SubTitle.new( menu, controller )
	StartMenuIdentitySubTitle0:setLeftRight( true, false, 5, 93 )
	StartMenuIdentitySubTitle0:setTopBottom( false, true, -32, -6 )
	StartMenuIdentitySubTitle0:setAlpha( 0.5 )
	StartMenuIdentitySubTitle0.SubTitle:setText( Engine.Localize( "Combat Record, Challenges, Leaderboards" ) )
	StartMenuIdentitySubTitle0.SubTitle:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	self:addElement( StartMenuIdentitySubTitle0 )
	self.StartMenuIdentitySubTitle0 = StartMenuIdentitySubTitle0
	
	local BoxButtonLrgInactiveDiag = CoD.cac_ButtonBoxLrgInactiveDiags.new( menu, controller )
	BoxButtonLrgInactiveDiag:setLeftRight( true, true, 0, 0 )
	BoxButtonLrgInactiveDiag:setTopBottom( true, true, 0, -1 )
	self:addElement( BoxButtonLrgInactiveDiag )
	self.BoxButtonLrgInactiveDiag = BoxButtonLrgInactiveDiag
	
	local lockedIcon = CoD.cac_lock.new( menu, controller )
	lockedIcon:setLeftRight( false, false, -9, 15 )
	lockedIcon:setTopBottom( false, false, -160.5, -128.5 )
	self:addElement( lockedIcon )
	self.lockedIcon = lockedIcon
	
	local StartMenuframenoBG0 = CoD.StartMenu_frame_noBG.new( menu, controller )
	StartMenuframenoBG0:setLeftRight( true, true, 0, 0 )
	StartMenuframenoBG0:setTopBottom( true, true, 0, -1 )
	self:addElement( StartMenuframenoBG0 )
	self.StartMenuframenoBG0 = StartMenuframenoBG0
	
	local FocusBarT = CoD.FE_FocusBarContainer.new( menu, controller )
	FocusBarT:setLeftRight( true, true, 0, 0 )
	FocusBarT:setTopBottom( true, false, -1, 3 )
	FocusBarT:setAlpha( 0 )
	FocusBarT:setZoom( 1 )
	self:addElement( FocusBarT )
	self.FocusBarT = FocusBarT
	
	local FocusBarB = CoD.FE_FocusBarContainer.new( menu, controller )
	FocusBarB:setLeftRight( true, true, 0, 0 )
	FocusBarB:setTopBottom( false, true, -3, 1 )
	FocusBarB:setAlpha( 0 )
	FocusBarB:setZoom( 1 )
	self:addElement( FocusBarB )
	self.FocusBarB = FocusBarB
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				FocusBarT:completeAnimation()
				self.FocusBarT:setAlpha( 0 )
				self.clipFinished( FocusBarT, {} )
				FocusBarB:completeAnimation()
				self.FocusBarB:setAlpha( 0 )
				self.clipFinished( FocusBarB, {} )
			end,
			Focus = function ()
				self:setupElementClipCounter( 4 )
				BoxButtonLrgInactiveDiag:completeAnimation()
				self.BoxButtonLrgInactiveDiag:setAlpha( 1 )
				self.clipFinished( BoxButtonLrgInactiveDiag, {} )
				lockedIcon:completeAnimation()
				self.lockedIcon:setAlpha( 1 )
				self.clipFinished( lockedIcon, {} )
				FocusBarT:completeAnimation()
				self.FocusBarT:setAlpha( 1 )
				self.clipFinished( FocusBarT, {} )
				FocusBarB:completeAnimation()
				self.FocusBarB:setAlpha( 1 )
				self.clipFinished( FocusBarB, {} )
			end
		},
		Disable = {
			DefaultClip = function ()
				self:setupElementClipCounter( 4 )
				SessionName:completeAnimation()
				self.SessionName:setAlpha( 0 )
				self.clipFinished( SessionName, {} )
				StartMenuIdentitySubTitle0:completeAnimation()
				self.StartMenuIdentitySubTitle0:setAlpha( 0 )
				self.clipFinished( StartMenuIdentitySubTitle0, {} )
				lockedIcon:completeAnimation()
				self.lockedIcon:setAlpha( 1 )
				self.clipFinished( lockedIcon, {} )
				StartMenuframenoBG0:completeAnimation()
				self.StartMenuframenoBG0:setAlpha( 1 )
				self.clipFinished( StartMenuframenoBG0, {} )
			end,
			focus = function ()
				self:setupElementClipCounter( 0 )
			end
		}
	}
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.StartMenuIdentitySubTitle0:close()
		element.BoxButtonLrgInactiveDiag:close()
		element.lockedIcon:close()
		element.StartMenuframenoBG0:close()
		element.FocusBarT:close()
		element.FocusBarB:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

