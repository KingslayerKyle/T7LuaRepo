-- 40ee7edf2bf58ad50a5f415bad209efc
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.Lobby.Common.FE_ButtonPanel" )
require( "ui.uieditor.widgets.CAC.cac_ButtonBoxLrgInactiveStroke" )
require( "ui.uieditor.widgets.CodCaster.CodCasterRoundsUnlimited" )
require( "ui.uieditor.widgets.CodCaster.CodCasterRounds" )
require( "ui.uieditor.widgets.HUD.ScoreInfo.ScoreInfo_RdTriCont" )

CoD.codcasterRoundsContainer = InheritFrom( LUI.UIElement )
CoD.codcasterRoundsContainer.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.codcasterRoundsContainer )
	self.id = "codcasterRoundsContainer"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 96 )
	self:setTopBottom( true, false, 0, 48 )
	self.anyChildUsesUpdateState = true
	
	local VSpanel = CoD.FE_ButtonPanel.new( menu, controller )
	VSpanel:setLeftRight( true, false, 5.25, 92.25 )
	VSpanel:setTopBottom( true, false, 11.5, 28.63 )
	VSpanel:setRGB( 0, 0, 0 )
	VSpanel:setAlpha( 0.65 )
	self:addElement( VSpanel )
	self.VSpanel = VSpanel
	
	local HighlightFrame = CoD.cac_ButtonBoxLrgInactiveStroke.new( menu, controller )
	HighlightFrame:setLeftRight( true, false, 4, 93.5 )
	HighlightFrame:setTopBottom( true, false, 7.5, 40.13 )
	HighlightFrame:setAlpha( 0 )
	self:addElement( HighlightFrame )
	self.HighlightFrame = HighlightFrame
	
	local CodCasterRoundsUnlimited = CoD.CodCasterRoundsUnlimited.new( menu, controller )
	CodCasterRoundsUnlimited:setLeftRight( true, false, 10.25, 85.75 )
	CodCasterRoundsUnlimited:setTopBottom( true, false, 11, 34.63 )
	self:addElement( CodCasterRoundsUnlimited )
	self.CodCasterRoundsUnlimited = CodCasterRoundsUnlimited
	
	local CodCasterRounds = CoD.CodCasterRounds.new( menu, controller )
	CodCasterRounds:setLeftRight( true, false, 10.25, 85.75 )
	CodCasterRounds:setTopBottom( true, false, 10, 34.63 )
	CodCasterRounds:setAlpha( 0 )
	self:addElement( CodCasterRounds )
	self.CodCasterRounds = CodCasterRounds
	
	local Overtime = LUI.UIText.new()
	Overtime:setLeftRight( true, false, 9.25, 85.75 )
	Overtime:setTopBottom( true, false, 11.5, 27.5 )
	Overtime:setAlpha( 0 )
	Overtime:setText( Engine.Localize( "MP_OVERTIME_CAPS" ) )
	Overtime:setTTF( "fonts/escom.ttf" )
	Overtime:setLetterSpacing( 0.6 )
	Overtime:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	Overtime:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( Overtime )
	self.Overtime = Overtime
	
	local TriCont = CoD.ScoreInfo_RdTriCont.new( menu, controller )
	TriCont:setLeftRight( true, false, 9.25, 87.5 )
	TriCont:setTopBottom( true, false, 7, 15 )
	TriCont:setAlpha( 0 )
	TriCont:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "uie_aberration_no_blur" ) )
	TriCont:setShaderVector( 0, 0, 1, 0, 0 )
	TriCont:setShaderVector( 1, 0, 0, 0, 0 )
	TriCont:setShaderVector( 2, 0, 0, 0, 0 )
	TriCont:setShaderVector( 3, 0, 0, 0, 0 )
	TriCont:setShaderVector( 4, 0, 0, 0, 0 )
	self:addElement( TriCont )
	self.TriCont = TriCont
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 6 )
				VSpanel:completeAnimation()
				self.VSpanel:setAlpha( 0.65 )
				self.clipFinished( VSpanel, {} )
				HighlightFrame:completeAnimation()
				self.HighlightFrame:setAlpha( 0 )
				self.clipFinished( HighlightFrame, {} )
				CodCasterRoundsUnlimited:completeAnimation()
				self.CodCasterRoundsUnlimited:setAlpha( 0 )
				self.clipFinished( CodCasterRoundsUnlimited, {} )
				CodCasterRounds:completeAnimation()
				self.CodCasterRounds:setAlpha( 0 )
				self.clipFinished( CodCasterRounds, {} )
				Overtime:completeAnimation()
				self.Overtime:setLeftRight( true, false, 7.25, 90.75 )
				self.Overtime:setTopBottom( true, false, 11.5, 27.5 )
				self.Overtime:setAlpha( 0 )
				self.clipFinished( Overtime, {} )
				TriCont:completeAnimation()
				self.TriCont:setAlpha( 0 )
				self.clipFinished( TriCont, {} )
			end
		},
		Invisible = {
			DefaultClip = function ()
				self:setupElementClipCounter( 6 )
				VSpanel:completeAnimation()
				self.VSpanel:setAlpha( 0 )
				self.clipFinished( VSpanel, {} )
				HighlightFrame:completeAnimation()
				self.HighlightFrame:setAlpha( 0 )
				self.clipFinished( HighlightFrame, {} )
				CodCasterRoundsUnlimited:completeAnimation()
				self.CodCasterRoundsUnlimited:setAlpha( 0 )
				self.clipFinished( CodCasterRoundsUnlimited, {} )
				CodCasterRounds:completeAnimation()
				self.CodCasterRounds:setAlpha( 0 )
				self.clipFinished( CodCasterRounds, {} )
				Overtime:completeAnimation()
				self.Overtime:setAlpha( 0 )
				self.clipFinished( Overtime, {} )
				TriCont:completeAnimation()
				self.TriCont:setAlpha( 0 )
				self.clipFinished( TriCont, {} )
			end
		},
		Overtime = {
			DefaultClip = function ()
				self:setupElementClipCounter( 6 )
				VSpanel:completeAnimation()
				self.VSpanel:setAlpha( 0.65 )
				self.clipFinished( VSpanel, {} )
				HighlightFrame:completeAnimation()
				self.HighlightFrame:setAlpha( 0 )
				self.clipFinished( HighlightFrame, {} )
				CodCasterRoundsUnlimited:completeAnimation()
				self.CodCasterRoundsUnlimited:setAlpha( 0 )
				self.clipFinished( CodCasterRoundsUnlimited, {} )
				CodCasterRounds:completeAnimation()
				self.CodCasterRounds:setLeftRight( true, false, 7.25, 90.75 )
				self.CodCasterRounds:setTopBottom( true, false, 10, 34.63 )
				self.CodCasterRounds:setAlpha( 0 )
				self.clipFinished( CodCasterRounds, {} )
				Overtime:completeAnimation()
				self.Overtime:setLeftRight( true, false, 7.25, 90.75 )
				self.Overtime:setTopBottom( true, false, 11.5, 27.5 )
				self.Overtime:setAlpha( 1 )
				self.Overtime:setMaterial( LUI.UIImage.GetCachedMaterial( "sw4_2d_uie_font_cached_glow" ) )
				self.Overtime:setShaderVector( 0, 0.08, 0, 0, 0 )
				self.Overtime:setShaderVector( 1, 0, 0, 0, 0 )
				self.Overtime:setShaderVector( 2, 1, 0, 0, 0 )
				self.Overtime:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
				self.clipFinished( Overtime, {} )
				TriCont:completeAnimation()
				self.TriCont:setAlpha( 0 )
				self.clipFinished( TriCont, {} )
			end
		},
		RoundBasedNoLimit = {
			DefaultClip = function ()
				self:setupElementClipCounter( 6 )
				VSpanel:completeAnimation()
				self.VSpanel:setAlpha( 0.65 )
				self.clipFinished( VSpanel, {} )
				HighlightFrame:completeAnimation()
				self.HighlightFrame:setAlpha( 0 )
				self.clipFinished( HighlightFrame, {} )
				CodCasterRoundsUnlimited:completeAnimation()
				self.CodCasterRoundsUnlimited:setAlpha( 0 )
				self.CodCasterRoundsUnlimited:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
				self.clipFinished( CodCasterRoundsUnlimited, {} )
				CodCasterRounds:completeAnimation()
				self.CodCasterRounds:setLeftRight( true, false, 7.25, 90.75 )
				self.CodCasterRounds:setTopBottom( true, false, 10, 34.63 )
				self.CodCasterRounds:setAlpha( 1 )
				self.clipFinished( CodCasterRounds, {} )
				Overtime:completeAnimation()
				self.Overtime:setAlpha( 0 )
				self.clipFinished( Overtime, {} )
				TriCont:completeAnimation()
				self.TriCont:setAlpha( 0 )
				self.clipFinished( TriCont, {} )
			end
		},
		RoundBasedLimitedRounds = {
			DefaultClip = function ()
				self:setupElementClipCounter( 6 )
				VSpanel:completeAnimation()
				self.VSpanel:setAlpha( 0.65 )
				self.clipFinished( VSpanel, {} )
				HighlightFrame:completeAnimation()
				self.HighlightFrame:setAlpha( 0 )
				self.clipFinished( HighlightFrame, {} )
				CodCasterRoundsUnlimited:completeAnimation()
				self.CodCasterRoundsUnlimited:setLeftRight( true, false, 7.25, 90.25 )
				self.CodCasterRoundsUnlimited:setTopBottom( true, false, 11, 34.63 )
				self.CodCasterRoundsUnlimited:setAlpha( 0 )
				self.CodCasterRoundsUnlimited:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
				self.clipFinished( CodCasterRoundsUnlimited, {} )
				CodCasterRounds:completeAnimation()
				self.CodCasterRounds:setLeftRight( true, false, 3, 89.25 )
				self.CodCasterRounds:setTopBottom( true, false, 10, 34.63 )
				self.CodCasterRounds:setAlpha( 1 )
				self.CodCasterRounds:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
				self.clipFinished( CodCasterRounds, {} )
				Overtime:completeAnimation()
				self.Overtime:setLeftRight( true, false, 9.25, 87.25 )
				self.Overtime:setTopBottom( true, false, 11.5, 24 )
				self.Overtime:setAlpha( 0 )
				self.clipFinished( Overtime, {} )
				TriCont:completeAnimation()
				self.TriCont:setLeftRight( true, false, 7.25, 92.25 )
				self.TriCont:setTopBottom( true, false, 5, 13 )
				self.TriCont:setAlpha( 1 )
				self.TriCont:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
				self.clipFinished( TriCont, {} )
			end
		}
	}
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.VSpanel:close()
		element.HighlightFrame:close()
		element.CodCasterRoundsUnlimited:close()
		element.CodCasterRounds:close()
		element.TriCont:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

