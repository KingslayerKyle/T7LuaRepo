require( "ui.uieditor.widgets.CAC.cac_lock" )
require( "ui.uieditor.widgets.Lobby.Common.FE_ListHeaderGlow" )
require( "ui.uieditor.widgets.Lobby.Common.FE_TitleNumBrdr" )
require( "ui.uieditor.widgets.Prestige.Prestige_MasterTierWidget" )

CoD.Prestige_PrestigeIconProfiler = InheritFrom( LUI.UIElement )
CoD.Prestige_PrestigeIconProfiler.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.Prestige_PrestigeIconProfiler )
	self.id = "Prestige_PrestigeIconProfiler"
	self.soundSet = "ModeSelection"
	self:setLeftRight( 0, 0, 0, 450 )
	self:setTopBottom( 0, 0, 0, 450 )
	self.anyChildUsesUpdateState = true
	
	local BG = LUI.UIImage.new()
	BG:setLeftRight( 0, 1, 0, 0 )
	BG:setTopBottom( 0, 1, 0, -48 )
	BG:setRGB( 0, 0, 0 )
	BG:setAlpha( 0.2 )
	self:addElement( BG )
	self.BG = BG
	
	local TitleBG = LUI.UIImage.new()
	TitleBG:setLeftRight( 0, 1, 0, 0 )
	TitleBG:setTopBottom( 1, 1, -47, 0 )
	TitleBG:setRGB( 0, 0, 0 )
	TitleBG:setAlpha( 0.4 )
	self:addElement( TitleBG )
	self.TitleBG = TitleBG
	
	local IconTitle = LUI.UIText.new()
	IconTitle:setLeftRight( 0, 0, 12, 225 )
	IconTitle:setTopBottom( 1, 1, -45, 0 )
	IconTitle:setText( Engine.Localize( "MPUI_PRESTIGE_N" ) )
	IconTitle:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	IconTitle:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	IconTitle:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( IconTitle )
	self.IconTitle = IconTitle
	
	local GameTitle = LUI.UIText.new()
	GameTitle:setLeftRight( 0.5, 0.5, 0, 213 )
	GameTitle:setTopBottom( 1, 1, -42, -6 )
	GameTitle:setRGB( 0.92, 0.8, 0.31 )
	GameTitle:setText( Engine.Localize( "MPUI_ALLIES_SHORT" ) )
	GameTitle:setTTF( "fonts/escom.ttf" )
	GameTitle:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_RIGHT )
	GameTitle:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( GameTitle )
	self.GameTitle = GameTitle
	
	local Description = LUI.UIText.new()
	Description:setLeftRight( 0, 1, 12, -12 )
	Description:setTopBottom( 1, 1, 5, 33 )
	Description:setText( Engine.Localize( "PERKS_UNLOCKED_AT_LV" ) )
	Description:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	Description:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	Description:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( Description )
	self.Description = Description
	
	local PrestigeMasterBG = CoD.FE_ListHeaderGlow.new( menu, controller )
	PrestigeMasterBG:setLeftRight( 0.5, 0.5, -127, 135 )
	PrestigeMasterBG:setTopBottom( 0, 0, 267, 309 )
	self:addElement( PrestigeMasterBG )
	self.PrestigeMasterBG = PrestigeMasterBG
	
	local PrestigeMasterText = LUI.UIText.new()
	PrestigeMasterText:setLeftRight( 0.5, 0.5, -127, 135 )
	PrestigeMasterText:setTopBottom( 0, 0, 271, 304 )
	PrestigeMasterText:setRGB( 0, 0, 0 )
	PrestigeMasterText:setText( Engine.Localize( "MENU_MASTER" ) )
	PrestigeMasterText:setTTF( "fonts/escom.ttf" )
	PrestigeMasterText:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_font_cached_glow" ) )
	PrestigeMasterText:setShaderVector( 0, 0.06, 0, 0, 0 )
	PrestigeMasterText:setShaderVector( 1, 0.02, 0, 0, 0 )
	PrestigeMasterText:setShaderVector( 2, 1, 0, 0, 0 )
	PrestigeMasterText:setLetterSpacing( 1 )
	PrestigeMasterText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	PrestigeMasterText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	LUI.OverrideFunction_CallOriginalFirst( PrestigeMasterText, "setText", function ( element, text )
		ScaleWidgetToLabel( self, element, 0 )
	end )
	self:addElement( PrestigeMasterText )
	self.PrestigeMasterText = PrestigeMasterText
	
	local RankTextBorder = CoD.FE_TitleNumBrdr.new( menu, controller )
	RankTextBorder:setLeftRight( 0.5, 0.5, -127, 135 )
	RankTextBorder:setTopBottom( 0, 0, 312, 363 )
	self:addElement( RankTextBorder )
	self.RankTextBorder = RankTextBorder
	
	local RankText = LUI.UIText.new()
	RankText:setLeftRight( 0.5, 0.5, -121, 135 )
	RankText:setTopBottom( 0, 0, 312, 363 )
	RankText:setRGB( 0.58, 0.64, 0.65 )
	RankText:setText( Engine.Localize( "LEVEL 1000" ) )
	RankText:setTTF( "fonts/escom.ttf" )
	RankText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	RankText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( RankText )
	self.RankText = RankText
	
	local LockBG = LUI.UIImage.new()
	LockBG:setLeftRight( 0.5, 0.5, -116, 124 )
	LockBG:setTopBottom( 0, 0, 24, 264 )
	LockBG:setRGB( 0, 0, 0 )
	LockBG:setAlpha( 0 )
	self:addElement( LockBG )
	self.LockBG = LockBG
	
	local LockIcon = CoD.cac_lock.new( menu, controller )
	LockIcon:setLeftRight( 0.5, 0.5, -92, 100 )
	LockIcon:setTopBottom( 0, 0, 48, 240 )
	LockIcon:setAlpha( 0 )
	LockIcon.lockedIcon:setAlpha( 0 )
	self:addElement( LockIcon )
	self.LockIcon = LockIcon
	
	local PrestigeIcon = LUI.UIImage.new()
	PrestigeIcon:setLeftRight( 0.5, 0.5, -116, 124 )
	PrestigeIcon:setTopBottom( 0, 0, 24, 264 )
	self:addElement( PrestigeIcon )
	self.PrestigeIcon = PrestigeIcon
	
	local PrestigeMasterTierWidget = CoD.Prestige_MasterTierWidget.new( menu, controller )
	PrestigeMasterTierWidget:mergeStateConditions( {
		{
			stateName = "Visible",
			condition = function ( menu, element, event )
				return IsMaxPrestigeLevel( controller )
			end
		}
	} )
	PrestigeMasterTierWidget:setLeftRight( 0.5, 0.5, -142, 150 )
	PrestigeMasterTierWidget:setTopBottom( 0, 0, 362, 398 )
	PrestigeMasterTierWidget:setScale( 0.9 )
	self:addElement( PrestigeMasterTierWidget )
	self.PrestigeMasterTierWidget = PrestigeMasterTierWidget
	
	self.resetProperties = function ()
		PrestigeIcon:completeAnimation()
		LockBG:completeAnimation()
		LockIcon:completeAnimation()
		PrestigeIcon:setAlpha( 1 )
		LockBG:setAlpha( 0 )
		LockIcon:setAlpha( 0 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 0 )
			end
		},
		Locked = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 3 )
				LockBG:completeAnimation()
				self.LockBG:setAlpha( 1 )
				self.clipFinished( LockBG, {} )
				LockIcon:completeAnimation()
				self.LockIcon:setAlpha( 1 )
				self.clipFinished( LockIcon, {} )
				PrestigeIcon:completeAnimation()
				self.PrestigeIcon:setAlpha( 0 )
				self.clipFinished( PrestigeIcon, {} )
			end
		}
	}
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.PrestigeMasterBG:close()
		self.RankTextBorder:close()
		self.LockIcon:close()
		self.PrestigeMasterTierWidget:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

