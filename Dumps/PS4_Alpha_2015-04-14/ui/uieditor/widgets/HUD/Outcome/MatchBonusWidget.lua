require( "ui.uieditor.widgets.HUD.PrematchCountdown.PrematchCountdown_BeginsIn" )
require( "ui.uieditor.widgets.HUD.PrematchCountdown.PrematchCountdown_Title" )

CoD.MatchBonusWidget = InheritFrom( LUI.UIElement )
CoD.MatchBonusWidget.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.MatchBonusWidget )
	self.id = "MatchBonusWidget"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 284 )
	self:setTopBottom( true, false, 0, 129 )
	
	local XpIcon0 = LUI.UIImage.new()
	XpIcon0:setLeftRight( false, false, -31, 31 )
	XpIcon0:setTopBottom( true, false, 0, 62 )
	XpIcon0:setRGB( 0.04, 0.8, 1 )
	XpIcon0:setImage( RegisterImage( "uie_t7_hud_mp_notifications_xp" ) )
	XpIcon0:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( XpIcon0 )
	self.XpIcon0 = XpIcon0
	
	local MatchBonusNew0 = CoD.PrematchCountdown_BeginsIn.new( menu, controller )
	MatchBonusNew0:setLeftRight( false, false, -142, 142 )
	MatchBonusNew0:setTopBottom( true, false, 96.29, 128.5 )
	MatchBonusNew0:setRGB( 1, 1, 1 )
	MatchBonusNew0.FEButtonPanel0:setRGB( 0, 0, 0 )
	MatchBonusNew0.FEButtonPanel0:setAlpha( 0.23 )
	MatchBonusNew0.FEButtonPanel0:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	MatchBonusNew0.Glow:setRGB( 0.04, 0.8, 1 )
	MatchBonusNew0.Glow:setAlpha( 0.12 )
	MatchBonusNew0.MatchText:setRGB( 0.04, 0.8, 1 )
	MatchBonusNew0.MatchText:setTTF( "fonts/Entovo.ttf" )
	MatchBonusNew0:subscribeToGlobalModel( controller, "GameScore", "matchBonus", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			MatchBonusNew0.MatchText:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( MatchBonusNew0 )
	self.MatchBonusNew0 = MatchBonusNew0
	
	local MatchBonusTitleNew0 = CoD.PrematchCountdown_Title.new( menu, controller )
	MatchBonusTitleNew0:setLeftRight( false, false, -116, 116 )
	MatchBonusTitleNew0:setTopBottom( true, false, 63.39, 95.6 )
	MatchBonusTitleNew0:setRGB( 1, 1, 1 )
	MatchBonusTitleNew0.MatchText:setText( Engine.Localize( "MPUI_MATCHBONUS_CAPS" ) )
	self:addElement( MatchBonusTitleNew0 )
	self.MatchBonusTitleNew0 = MatchBonusTitleNew0
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 3 )
				XpIcon0:completeAnimation()
				self.XpIcon0:setAlpha( 0 )
				self.clipFinished( XpIcon0, {} )
				MatchBonusNew0:completeAnimation()
				self.MatchBonusNew0:setAlpha( 0 )
				self.clipFinished( MatchBonusNew0, {} )
				MatchBonusTitleNew0:completeAnimation()
				self.MatchBonusTitleNew0:setAlpha( 0 )
				self.clipFinished( MatchBonusTitleNew0, {} )
			end,
			Show_Two_Team = function ()
				self:setupElementClipCounter( 0 )
			end,
			End_Transition = function ()
				self:setupElementClipCounter( 0 )
			end,
			ShowFFAOutcome = function ()
				self:setupElementClipCounter( 0 )
			end
		},
		Shown = {
			DefaultClip = function ()
				self:setupElementClipCounter( 3 )
				XpIcon0:completeAnimation()
				self.XpIcon0:setAlpha( 1 )
				self.clipFinished( XpIcon0, {} )
				MatchBonusNew0:completeAnimation()
				self.MatchBonusNew0:setAlpha( 1 )
				self.clipFinished( MatchBonusNew0, {} )
				MatchBonusTitleNew0:completeAnimation()
				self.MatchBonusTitleNew0:setAlpha( 1 )
				self.clipFinished( MatchBonusTitleNew0, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "Shown",
			condition = function ( menu, element, event )
				return ShowMatchBonus( element, controller )
			end
		}
	} )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "gameScore.isRoundEnd" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "gameScore.isRoundEnd"
		} )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "gameScore.matchBonus" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "gameScore.matchBonus"
		} )
	end )
	self.close = function ( self )
		self.MatchBonusNew0:close()
		self.MatchBonusTitleNew0:close()
		CoD.MatchBonusWidget.super.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

