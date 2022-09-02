-- 633bba9dab2bad0eceab28bcd21b3edb
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.Lobby.Common.FE_ListHeaderGlow" )
require( "ui.uieditor.widgets.Lobby.Common.FE_TitleNumBrdr" )
require( "ui.uieditor.widgets.CAC.cac_lock" )
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
	self:setLeftRight( true, false, 0, 300 )
	self:setTopBottom( true, false, 0, 300 )
	self.anyChildUsesUpdateState = true
	
	local BG = LUI.UIImage.new()
	BG:setLeftRight( true, true, 0, 0 )
	BG:setTopBottom( true, true, 0, -31.5 )
	BG:setRGB( 0, 0, 0 )
	BG:setAlpha( 0.2 )
	self:addElement( BG )
	self.BG = BG
	
	local TitleBG = LUI.UIImage.new()
	TitleBG:setLeftRight( true, true, 0, 0 )
	TitleBG:setTopBottom( false, true, -31.5, 0 )
	TitleBG:setRGB( 0, 0, 0 )
	TitleBG:setAlpha( 0.4 )
	self:addElement( TitleBG )
	self.TitleBG = TitleBG
	
	local IconTitle = LUI.UIText.new()
	IconTitle:setLeftRight( true, false, 8, 150 )
	IconTitle:setTopBottom( false, true, -30, 0 )
	IconTitle:setText( Engine.Localize( "MPUI_PRESTIGE_N" ) )
	IconTitle:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	IconTitle:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	IconTitle:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( IconTitle )
	self.IconTitle = IconTitle
	
	local GameTitle = LUI.UIText.new()
	GameTitle:setLeftRight( false, false, 0, 142 )
	GameTitle:setTopBottom( false, true, -27.75, -3.75 )
	GameTitle:setRGB( 0.92, 0.8, 0.31 )
	GameTitle:setText( Engine.Localize( "MPUI_ALLIES_SHORT" ) )
	GameTitle:setTTF( "fonts/escom.ttf" )
	GameTitle:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_RIGHT )
	GameTitle:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( GameTitle )
	self.GameTitle = GameTitle
	
	local Description = LUI.UIText.new()
	Description:setLeftRight( true, true, 8, -8 )
	Description:setTopBottom( false, true, 3, 22 )
	Description:setText( Engine.Localize( "PERKS_UNLOCKED_AT_LV" ) )
	Description:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	Description:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	Description:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( Description )
	self.Description = Description
	
	local PrestigeMasterBG = CoD.FE_ListHeaderGlow.new( menu, controller )
	PrestigeMasterBG:setLeftRight( false, false, -85, 90 )
	PrestigeMasterBG:setTopBottom( true, false, 178, 206 )
	self:addElement( PrestigeMasterBG )
	self.PrestigeMasterBG = PrestigeMasterBG
	
	local PrestigeMasterText = LUI.UIText.new()
	PrestigeMasterText:setLeftRight( false, false, -85, 90 )
	PrestigeMasterText:setTopBottom( true, false, 181, 203 )
	PrestigeMasterText:setRGB( 0, 0, 0 )
	PrestigeMasterText:setText( Engine.Localize( "MENU_MASTER" ) )
	PrestigeMasterText:setTTF( "fonts/escom.ttf" )
	PrestigeMasterText:setMaterial( LUI.UIImage.GetCachedMaterial( "sw4_2d_uie_font_cached_glow" ) )
	PrestigeMasterText:setShaderVector( 0, 0.06, 0, 0, 0 )
	PrestigeMasterText:setShaderVector( 1, 0.02, 0, 0, 0 )
	PrestigeMasterText:setShaderVector( 2, 1, 0, 0, 0 )
	PrestigeMasterText:setLetterSpacing( 1 )
	PrestigeMasterText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	PrestigeMasterText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )

	LUI.OverrideFunction_CallOriginalFirst( PrestigeMasterText, "setText", function ( element, controller )
		ScaleWidgetToLabel( self, element, 0 )
	end )
	self:addElement( PrestigeMasterText )
	self.PrestigeMasterText = PrestigeMasterText
	
	local RankTextBorder = CoD.FE_TitleNumBrdr.new( menu, controller )
	RankTextBorder:setLeftRight( false, false, -85, 90 )
	RankTextBorder:setTopBottom( true, false, 208, 242 )
	self:addElement( RankTextBorder )
	self.RankTextBorder = RankTextBorder
	
	local RankText = LUI.UIText.new()
	RankText:setLeftRight( false, false, -81, 90 )
	RankText:setTopBottom( true, false, 208, 242 )
	RankText:setRGB( 0.58, 0.64, 0.65 )
	RankText:setText( Engine.Localize( "LEVEL 1000" ) )
	RankText:setTTF( "fonts/escom.ttf" )
	RankText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	RankText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( RankText )
	self.RankText = RankText
	
	local LockBG = LUI.UIImage.new()
	LockBG:setLeftRight( false, false, -77, 83 )
	LockBG:setTopBottom( true, false, 16, 176 )
	LockBG:setRGB( 0, 0, 0 )
	LockBG:setAlpha( 0 )
	self:addElement( LockBG )
	self.LockBG = LockBG
	
	local LockIcon = CoD.cac_lock.new( menu, controller )
	LockIcon:setLeftRight( false, false, -61, 67 )
	LockIcon:setTopBottom( true, false, 32, 160 )
	LockIcon:setAlpha( 0 )
	LockIcon.lockedIcon:setAlpha( 0 )
	self:addElement( LockIcon )
	self.LockIcon = LockIcon
	
	local PrestigeIcon = LUI.UIImage.new()
	PrestigeIcon:setLeftRight( false, false, -77, 83 )
	PrestigeIcon:setTopBottom( true, false, 16, 176 )
	self:addElement( PrestigeIcon )
	self.PrestigeIcon = PrestigeIcon
	
	local PrestigeMasterTierWidget = CoD.Prestige_MasterTierWidget.new( menu, controller )
	PrestigeMasterTierWidget:setLeftRight( false, false, -95, 100 )
	PrestigeMasterTierWidget:setTopBottom( true, false, 241, 265 )
	PrestigeMasterTierWidget:setScale( 0.9 )
	PrestigeMasterTierWidget:mergeStateConditions( {
		{
			stateName = "Visible",
			condition = function ( menu, element, event )
				return IsMaxPrestigeLevel( controller )
			end
		}
	} )
	self:addElement( PrestigeMasterTierWidget )
	self.PrestigeMasterTierWidget = PrestigeMasterTierWidget
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 3 )

				LockBG:completeAnimation()
				self.LockBG:setAlpha( 0 )
				self.clipFinished( LockBG, {} )

				LockIcon:completeAnimation()
				self.LockIcon:setAlpha( 0 )
				self.clipFinished( LockIcon, {} )

				PrestigeIcon:completeAnimation()
				self.PrestigeIcon:setAlpha( 1 )
				self.clipFinished( PrestigeIcon, {} )
			end
		},
		Locked = {
			DefaultClip = function ()
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

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.PrestigeMasterBG:close()
		element.RankTextBorder:close()
		element.LockIcon:close()
		element.PrestigeMasterTierWidget:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

