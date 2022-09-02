-- cdd412ed1a6630ce426758a1d8737dbb
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.HUD.ScoreInfo.ScoreInfo_PanelScale" )

CoD.BombTimerWidgetInternal = InheritFrom( LUI.UIElement )
CoD.BombTimerWidgetInternal.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.BombTimerWidgetInternal )
	self.id = "BombTimerWidgetInternal"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 73 )
	self:setTopBottom( true, false, 0, 24 )
	self.anyChildUsesUpdateState = true
	
	local Panel = CoD.ScoreInfo_PanelScale.new( menu, controller )
	Panel:setLeftRight( false, false, -38.5, 38.5 )
	Panel:setTopBottom( false, false, -14, 14 )
	Panel:setRGB( 0.64, 0.67, 0.7 )
	self:addElement( Panel )
	self.Panel = Panel
	
	local BombTimerBackground = LUI.UIImage.new()
	BombTimerBackground:setLeftRight( true, false, 27, 73 )
	BombTimerBackground:setTopBottom( true, false, 0, 24 )
	BombTimerBackground:setRGB( 0, 0, 0 )
	BombTimerBackground:setAlpha( 0 )
	BombTimerBackground:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_blend" ) )
	self:addElement( BombTimerBackground )
	self.BombTimerBackground = BombTimerBackground
	
	local backgroundFriendly = LUI.UIImage.new()
	backgroundFriendly:setLeftRight( true, false, 0, 25.5 )
	backgroundFriendly:setTopBottom( true, false, 0, 24 )
	backgroundFriendly:setImage( RegisterImage( "uie_t7_hud_waypoints_snd_empty" ) )
	backgroundFriendly:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_blend" ) )
	backgroundFriendly:subscribeToGlobalModel( controller, "HUDItems", "colorBlindSensitiveFriendlyColor", function ( model )
		local colorBlindSensitiveFriendlyColor = Engine.GetModelValue( model )
		if colorBlindSensitiveFriendlyColor then
			backgroundFriendly:setRGB( colorBlindSensitiveFriendlyColor )
		end
	end )
	self:addElement( backgroundFriendly )
	self.backgroundFriendly = backgroundFriendly
	
	local backgroundEnemy = LUI.UIImage.new()
	backgroundEnemy:setLeftRight( true, false, 0, 25.5 )
	backgroundEnemy:setTopBottom( true, false, 0, 24 )
	backgroundEnemy:setAlpha( 0 )
	backgroundEnemy:setImage( RegisterImage( "uie_t7_hud_waypoints_snd_empty" ) )
	backgroundEnemy:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_blend" ) )
	backgroundEnemy:subscribeToGlobalModel( controller, "HUDItems", "colorBlindSensitiveEnemyColor", function ( model )
		local colorBlindSensitiveEnemyColor = Engine.GetModelValue( model )
		if colorBlindSensitiveEnemyColor then
			backgroundEnemy:setRGB( colorBlindSensitiveEnemyColor )
		end
	end )
	self:addElement( backgroundEnemy )
	self.backgroundEnemy = backgroundEnemy
	
	local BombTimer = LUI.UITightText.new()
	BombTimer:setLeftRight( true, false, 33, 73 )
	BombTimer:setTopBottom( true, false, 2.5, 22.5 )
	BombTimer:setTTF( "fonts/escom.ttf" )
	BombTimer:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "uie_aberration_no_blur" ) )
	BombTimer:setShaderVector( 0, 0, 1, 0, 0 )
	BombTimer:setShaderVector( 1, 0, 0, 0, 0 )
	BombTimer:setShaderVector( 2, 0.05, 0, 0, 0 )
	BombTimer:setShaderVector( 3, 0, 0, 0, 0 )
	BombTimer:setShaderVector( 4, 0, 0, 0, 0 )
	BombTimer:setupBombTimer( 0, true )
	self:addElement( BombTimer )
	self.BombTimer = BombTimer
	
	local AOrBText = LUI.UIText.new()
	AOrBText:setLeftRight( true, false, -0.75, 26.25 )
	AOrBText:setTopBottom( true, false, 2.5, 22.5 )
	AOrBText:setRGB( 0, 0, 0 )
	AOrBText:setText( Engine.Localize( "C" ) )
	AOrBText:setTTF( "fonts/escom.ttf" )
	AOrBText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	AOrBText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( AOrBText )
	self.AOrBText = AOrBText
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )

			end
		},
		Attacking = {
			DefaultClip = function ()
				self:setupElementClipCounter( 5 )

				BombTimerBackground:completeAnimation()
				self.BombTimerBackground:setLeftRight( true, false, 27, 73 )
				self.BombTimerBackground:setTopBottom( true, false, 0, 24 )
				self.clipFinished( BombTimerBackground, {} )

				backgroundFriendly:completeAnimation()
				self.backgroundFriendly:setLeftRight( true, false, 0, 27 )
				self.backgroundFriendly:setTopBottom( true, false, 0, 24 )
				self.backgroundFriendly:setAlpha( 1 )
				self.clipFinished( backgroundFriendly, {} )

				backgroundEnemy:completeAnimation()
				self.backgroundEnemy:setAlpha( 0 )
				self.clipFinished( backgroundEnemy, {} )

				BombTimer:completeAnimation()
				self.BombTimer:setLeftRight( true, false, 33, 73 )
				self.BombTimer:setTopBottom( true, false, 0, 24 )
				self.clipFinished( BombTimer, {} )

				AOrBText:completeAnimation()
				self.AOrBText:setLeftRight( true, false, 0, 27 )
				self.AOrBText:setTopBottom( true, false, 0, 24 )
				self.clipFinished( AOrBText, {} )
			end
		},
		Defending = {
			DefaultClip = function ()
				self:setupElementClipCounter( 5 )

				BombTimerBackground:completeAnimation()
				self.BombTimerBackground:setLeftRight( true, false, 27, 73 )
				self.BombTimerBackground:setTopBottom( true, false, 0, 24 )
				self.clipFinished( BombTimerBackground, {} )

				backgroundFriendly:completeAnimation()
				self.backgroundFriendly:setLeftRight( true, false, 0, 27 )
				self.backgroundFriendly:setTopBottom( true, false, 0, 24 )
				self.backgroundFriendly:setAlpha( 0 )
				self.clipFinished( backgroundFriendly, {} )

				backgroundEnemy:completeAnimation()
				self.backgroundEnemy:setAlpha( 1 )
				self.clipFinished( backgroundEnemy, {} )

				BombTimer:completeAnimation()
				self.BombTimer:setLeftRight( true, false, 33, 73 )
				self.BombTimer:setTopBottom( true, false, 0, 24 )
				self.clipFinished( BombTimer, {} )

				AOrBText:completeAnimation()
				self.AOrBText:setLeftRight( true, false, 0, 27 )
				self.AOrBText:setTopBottom( true, false, 0, 24 )
				self.clipFinished( AOrBText, {} )
			end
		}
	}

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.Panel:close()
		element.backgroundFriendly:close()
		element.backgroundEnemy:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

