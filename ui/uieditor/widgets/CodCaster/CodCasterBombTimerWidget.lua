-- 4fa59036c378ac3748143968e9c25635
-- This hash is used for caching, delete to decompile the file again

local PostLoadFunc = function ( f1_arg0, f1_arg1 )
	f1_arg0.BombTimer:setAlignment( LUI.Alignment.Left )
end

CoD.CodCasterBombTimerWidget = InheritFrom( LUI.UIElement )
CoD.CodCasterBombTimerWidget.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.CodCasterBombTimerWidget )
	self.id = "CodCasterBombTimerWidget"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 46 )
	self:setTopBottom( true, false, 0, 30 )
	
	local BombTimerBackground = LUI.UIImage.new()
	BombTimerBackground:setLeftRight( false, false, -5.5, 23 )
	BombTimerBackground:setTopBottom( true, false, 7, 23 )
	BombTimerBackground:setRGB( 0, 0, 0 )
	BombTimerBackground:setAlpha( 0 )
	BombTimerBackground:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_blend" ) )
	self:addElement( BombTimerBackground )
	self.BombTimerBackground = BombTimerBackground
	
	local backgroundEnemy = LUI.UIImage.new()
	backgroundEnemy:setLeftRight( false, false, -22.5, -5.5 )
	backgroundEnemy:setTopBottom( true, false, 7, 23 )
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
	
	local backgroundFriendly = LUI.UIImage.new()
	backgroundFriendly:setLeftRight( false, false, -22.5, -5.5 )
	backgroundFriendly:setTopBottom( true, false, 7, 23 )
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
	
	local BombTimer = LUI.UITightText.new()
	BombTimer:setLeftRight( false, false, -3.5, 23 )
	BombTimer:setTopBottom( true, false, 7, 23 )
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
	AOrBText:setLeftRight( false, false, -22.5, -4 )
	AOrBText:setTopBottom( true, false, 9, 21 )
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
				self:setupElementClipCounter( 5 )

				BombTimerBackground:completeAnimation()
				self.BombTimerBackground:setAlpha( 0 )
				self.clipFinished( BombTimerBackground, {} )

				backgroundEnemy:completeAnimation()
				self.backgroundEnemy:setAlpha( 0 )
				self.clipFinished( backgroundEnemy, {} )

				backgroundFriendly:completeAnimation()
				self.backgroundFriendly:setAlpha( 0 )
				self.clipFinished( backgroundFriendly, {} )

				BombTimer:completeAnimation()
				self.BombTimer:setAlpha( 0 )
				self.clipFinished( BombTimer, {} )

				AOrBText:completeAnimation()
				self.AOrBText:setAlpha( 0 )
				self.clipFinished( AOrBText, {} )
			end
		},
		VisibleFriendly = {
			DefaultClip = function ()
				self:setupElementClipCounter( 5 )

				BombTimerBackground:completeAnimation()
				self.BombTimerBackground:setAlpha( 0 )
				self.clipFinished( BombTimerBackground, {} )

				backgroundEnemy:completeAnimation()
				self.backgroundEnemy:setAlpha( 0 )
				self.clipFinished( backgroundEnemy, {} )

				backgroundFriendly:completeAnimation()
				self.backgroundFriendly:setAlpha( 1 )
				self.clipFinished( backgroundFriendly, {} )

				BombTimer:completeAnimation()
				self.BombTimer:setAlpha( 1 )
				self.clipFinished( BombTimer, {} )

				AOrBText:completeAnimation()
				self.AOrBText:setAlpha( 1 )
				self.clipFinished( AOrBText, {} )
			end
		},
		VisibleEnemy = {
			DefaultClip = function ()
				self:setupElementClipCounter( 5 )

				BombTimerBackground:completeAnimation()
				self.BombTimerBackground:setAlpha( 0 )
				self.clipFinished( BombTimerBackground, {} )

				backgroundEnemy:completeAnimation()
				self.backgroundEnemy:setAlpha( 1 )
				self.clipFinished( backgroundEnemy, {} )

				backgroundFriendly:completeAnimation()
				self.backgroundFriendly:setAlpha( 0 )
				self.clipFinished( backgroundFriendly, {} )

				BombTimer:completeAnimation()
				self.BombTimer:setAlpha( 1 )
				self.clipFinished( BombTimer, {} )

				AOrBText:completeAnimation()
				self.AOrBText:setAlpha( 1 )
				self.clipFinished( AOrBText, {} )
			end
		}
	}

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.backgroundEnemy:close()
		element.backgroundFriendly:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

