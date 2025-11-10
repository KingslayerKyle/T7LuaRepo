require( "ui.uieditor.widgets.HUD.ScoreInfo.Rounds" )
require( "ui.uieditor.widgets.HUD.ScoreInfo.RoundsUnlimited" )
require( "ui.uieditor.widgets.HUD.ScoreInfo.ScoreInfo_RdTriCont" )

CoD.RoundsContainer = InheritFrom( LUI.UIElement )
CoD.RoundsContainer.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.RoundsContainer )
	self.id = "RoundsContainer"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 87 )
	self:setTopBottom( true, false, 0, 60 )
	self.anyChildUsesUpdateState = true
	
	local Rounds = CoD.Rounds.new( menu, controller )
	Rounds:setLeftRight( false, false, -53.5, 53.5 )
	Rounds:setTopBottom( false, false, -7.13, 18.13 )
	Rounds:setAlpha( 0 )
	Rounds:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "uie_aberration_no_blur" ) )
	Rounds:setShaderVector( 0, 0, 1, 0, 0 )
	Rounds:setShaderVector( 1, 0, 0, 0, 0 )
	Rounds:setShaderVector( 2, 0, 0, 0, 0 )
	Rounds:setShaderVector( 3, 0, 0, 0, 0 )
	Rounds:setShaderVector( 4, 0, 0, 0, 0 )
	self:addElement( Rounds )
	self.Rounds = Rounds
	
	local RoundsUnlimited = CoD.RoundsUnlimited.new( menu, controller )
	RoundsUnlimited:setLeftRight( false, false, -53.5, 53.5 )
	RoundsUnlimited:setTopBottom( false, false, -7.13, 18.13 )
	RoundsUnlimited:setAlpha( 0 )
	RoundsUnlimited:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "uie_aberration_no_blur" ) )
	RoundsUnlimited:setShaderVector( 0, 0, 1, 0, 0 )
	RoundsUnlimited:setShaderVector( 1, 0, 0, 0, 0 )
	RoundsUnlimited:setShaderVector( 2, 0, 0, 0, 0 )
	RoundsUnlimited:setShaderVector( 3, 0, 0, 0, 0 )
	RoundsUnlimited:setShaderVector( 4, 0, 0, 0, 0 )
	self:addElement( RoundsUnlimited )
	self.RoundsUnlimited = RoundsUnlimited
	
	local Overtime = LUI.UIText.new()
	Overtime:setLeftRight( false, false, -53.5, 53.5 )
	Overtime:setTopBottom( false, false, -5, 11 )
	Overtime:setAlpha( 0 )
	Overtime:setText( Engine.Localize( "MP_OVERTIME_CAPS" ) )
	Overtime:setTTF( "fonts/escom.ttf" )
	Overtime:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "uie_aberration_no_blur" ) )
	Overtime:setShaderVector( 0, 0, 1, 0, 0 )
	Overtime:setShaderVector( 1, 0, 0, 0, 0 )
	Overtime:setShaderVector( 2, 0, 0, 0, 0 )
	Overtime:setShaderVector( 3, 0, 0, 0, 0 )
	Overtime:setShaderVector( 4, 0, 0, 0, 0 )
	Overtime:setLetterSpacing( 0.6 )
	Overtime:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	Overtime:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( Overtime )
	self.Overtime = Overtime
	
	local TriCont = CoD.ScoreInfo_RdTriCont.new( menu, controller )
	TriCont:setLeftRight( false, false, -42.5, 42.5 )
	TriCont:setTopBottom( false, false, -14, -6 )
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
				self:setupElementClipCounter( 4 )
				Rounds:completeAnimation()
				self.Rounds:setAlpha( 0 )
				self.clipFinished( Rounds, {} )
				RoundsUnlimited:completeAnimation()
				self.RoundsUnlimited:setAlpha( 0 )
				self.clipFinished( RoundsUnlimited, {} )
				Overtime:completeAnimation()
				self.Overtime:setAlpha( 0 )
				self.clipFinished( Overtime, {} )
				TriCont:completeAnimation()
				self.TriCont:setAlpha( 0 )
				self.clipFinished( TriCont, {} )
			end
		},
		Invisible = {
			DefaultClip = function ()
				self:setupElementClipCounter( 4 )
				Rounds:completeAnimation()
				self.Rounds:setAlpha( 0 )
				self.clipFinished( Rounds, {} )
				RoundsUnlimited:completeAnimation()
				self.RoundsUnlimited:setAlpha( 0 )
				self.clipFinished( RoundsUnlimited, {} )
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
				self:setupElementClipCounter( 4 )
				Rounds:completeAnimation()
				self.Rounds:setAlpha( 0 )
				self.clipFinished( Rounds, {} )
				RoundsUnlimited:completeAnimation()
				self.RoundsUnlimited:setAlpha( 0 )
				self.clipFinished( RoundsUnlimited, {} )
				Overtime:completeAnimation()
				self.Overtime:setAlpha( 1 )
				self.clipFinished( Overtime, {} )
				TriCont:completeAnimation()
				self.TriCont:setAlpha( 0 )
				self.clipFinished( TriCont, {} )
			end
		},
		RoundBasedNoLimit = {
			DefaultClip = function ()
				self:setupElementClipCounter( 4 )
				Rounds:completeAnimation()
				self.Rounds:setAlpha( 1 )
				self.clipFinished( Rounds, {} )
				RoundsUnlimited:completeAnimation()
				self.RoundsUnlimited:setAlpha( 0 )
				self.clipFinished( RoundsUnlimited, {} )
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
				self:setupElementClipCounter( 4 )
				Rounds:completeAnimation()
				self.Rounds:setAlpha( 1 )
				self.clipFinished( Rounds, {} )
				RoundsUnlimited:completeAnimation()
				self.RoundsUnlimited:setAlpha( 0 )
				self.clipFinished( RoundsUnlimited, {} )
				Overtime:completeAnimation()
				self.Overtime:setAlpha( 0 )
				self.clipFinished( Overtime, {} )
				TriCont:completeAnimation()
				self.TriCont:setAlpha( 1 )
				self.clipFinished( TriCont, {} )
			end
		}
	}
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.Rounds:close()
		element.RoundsUnlimited:close()
		element.TriCont:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

