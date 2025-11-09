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
	Emblem:setRGB( 1, 1, 1 )
	Emblem:setAlpha( 0 )
	Emblem:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( Emblem )
	self.Emblem = Emblem
	
	local RankNameBackground = LUI.UIImage.new()
	RankNameBackground:setLeftRight( false, false, -98, 102 )
	RankNameBackground:setTopBottom( true, false, 169, 197 )
	RankNameBackground:setRGB( 0.13, 0.13, 0.13 )
	RankNameBackground:setAlpha( 0.5 )
	RankNameBackground:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( RankNameBackground )
	self.RankNameBackground = RankNameBackground
	
	local RankBackground = LUI.UIImage.new()
	RankBackground:setLeftRight( false, false, -98, 102 )
	RankBackground:setTopBottom( true, false, 199, 227 )
	RankBackground:setRGB( 0.82, 0.82, 0.82 )
	RankBackground:setAlpha( 0.5 )
	RankBackground:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( RankBackground )
	self.RankBackground = RankBackground
	
	local RankName = LUI.UIText.new()
	RankName:setLeftRight( false, false, -98, 102 )
	RankName:setTopBottom( true, false, 173, 193 )
	RankName:setRGB( 1, 1, 1 )
	RankName:setAlpha( 0.5 )
	RankName:setText( Engine.Localize( "Vindicator" ) )
	RankName:setTTF( "fonts/UnitedSansSmCdMd.ttf" )
	RankName:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	RankName:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( RankName )
	self.RankName = RankName
	
	local Rank = LUI.UIText.new()
	Rank:setLeftRight( false, false, -98, 102 )
	Rank:setTopBottom( true, false, 199, 227 )
	Rank:setRGB( 0.14, 0.14, 0.14 )
	Rank:setAlpha( 0.5 )
	Rank:setText( Engine.Localize( "LEVEL 18" ) )
	Rank:setTTF( "fonts/escom.ttf" )
	Rank:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	Rank:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( Rank )
	self.Rank = Rank
	
	local Title0 = LUI.UIText.new()
	Title0:setLeftRight( true, false, 11.73, 217.73 )
	Title0:setTopBottom( false, true, -51, -29 )
	Title0:setRGB( 1, 1, 1 )
	Title0:setAlpha( 0.5 )
	Title0:setText( Engine.Localize( "MENU_CAMPAIGN_CAPS" ) )
	Title0:setTTF( "fonts/Entovo.ttf" )
	Title0:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	Title0:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( Title0 )
	self.Title0 = Title0
	
	local StartMenuIdentitySubTitle0 = CoD.StartMenu_Identity_SubTitle.new( menu, controller )
	StartMenuIdentitySubTitle0:setLeftRight( true, false, 5, 93 )
	StartMenuIdentitySubTitle0:setTopBottom( false, true, -32, -6 )
	StartMenuIdentitySubTitle0:setRGB( 1, 1, 1 )
	StartMenuIdentitySubTitle0:setAlpha( 0.5 )
	StartMenuIdentitySubTitle0.SubTitle:setText( Engine.Localize( "Combat Record, Challenges, Leaderboards" ) )
	self:addElement( StartMenuIdentitySubTitle0 )
	self.StartMenuIdentitySubTitle0 = StartMenuIdentitySubTitle0
	
	local TempText = LUI.UIText.new()
	TempText:setLeftRight( true, false, 0, 321 )
	TempText:setTopBottom( true, false, 0, 25 )
	TempText:setRGB( 1, 1, 1 )
	TempText:setText( Engine.Localize( "" ) )
	TempText:setTTF( "fonts/default.ttf" )
	TempText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	TempText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( TempText )
	self.TempText = TempText
	
	local BoxButtonLrgInactiveDiag = CoD.cac_ButtonBoxLrgInactiveDiags.new( menu, controller )
	BoxButtonLrgInactiveDiag:setLeftRight( true, true, 0, 0 )
	BoxButtonLrgInactiveDiag:setTopBottom( true, true, 0, -1 )
	BoxButtonLrgInactiveDiag:setRGB( 1, 1, 1 )
	self:addElement( BoxButtonLrgInactiveDiag )
	self.BoxButtonLrgInactiveDiag = BoxButtonLrgInactiveDiag
	
	local lockedIcon = CoD.cac_lock.new( menu, controller )
	lockedIcon:setLeftRight( false, false, -9, 15 )
	lockedIcon:setTopBottom( false, false, -160.5, -128.5 )
	lockedIcon:setRGB( 1, 1, 1 )
	self:addElement( lockedIcon )
	self.lockedIcon = lockedIcon
	
	local StartMenuframenoBG0 = CoD.StartMenu_frame_noBG.new( menu, controller )
	StartMenuframenoBG0:setLeftRight( true, true, 0, 0 )
	StartMenuframenoBG0:setTopBottom( true, true, 0, -1 )
	StartMenuframenoBG0:setRGB( 1, 1, 1 )
	self:addElement( StartMenuframenoBG0 )
	self.StartMenuframenoBG0 = StartMenuframenoBG0
	
	local FocusBarT = CoD.FE_FocusBarContainer.new( menu, controller )
	FocusBarT:setLeftRight( true, true, 0, 0 )
	FocusBarT:setTopBottom( true, false, -1, 3 )
	FocusBarT:setRGB( 1, 1, 1 )
	FocusBarT:setAlpha( 0 )
	FocusBarT:setZoom( 1 )
	self:addElement( FocusBarT )
	self.FocusBarT = FocusBarT
	
	local FocusBarB = CoD.FE_FocusBarContainer.new( menu, controller )
	FocusBarB:setLeftRight( true, true, 0, 0 )
	FocusBarB:setTopBottom( false, true, -3, 1 )
	FocusBarB:setRGB( 1, 1, 1 )
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
				Title0:completeAnimation()
				self.Title0:setAlpha( 0 )
				self.clipFinished( Title0, {} )
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
	self.close = function ( self )
		self.StartMenuIdentitySubTitle0:close()
		self.BoxButtonLrgInactiveDiag:close()
		self.lockedIcon:close()
		self.StartMenuframenoBG0:close()
		self.FocusBarT:close()
		self.FocusBarB:close()
		CoD.StartMenu_Barracks_Button.super.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

