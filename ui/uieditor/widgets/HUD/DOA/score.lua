-- 6a7add7ae89c7342d25494384c818517
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.HUD.GenericUpdateBarWithLink" )

CoD.score = InheritFrom( LUI.UIElement )
CoD.score.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.score )
	self.id = "score"
	self.soundSet = "HUD"
	self:setLeftRight( true, false, 0, 316 )
	self:setTopBottom( true, false, 0, 31 )
	
	local score = LUI.UIImage.new()
	score:setLeftRight( true, false, -5, 337 )
	score:setTopBottom( true, false, 0, 64 )
	score:setRGB( 0.18, 0.75, 0.11 )
	score:setImage( RegisterImage( "uie_scorebar_zom_1" ) )
	self:addElement( score )
	self.score = score
	
	local lives = LUI.UIText.new()
	lives:setLeftRight( true, false, -3.75, 22.25 )
	lives:setTopBottom( true, false, 16.5, 52.5 )
	lives:setTTF( "fonts/escom.ttf" )
	lives:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_RIGHT )
	lives:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	lives:linkToElementModel( self, "lives", true, function ( model )
		local _lives = Engine.GetModelValue( model )
		if _lives then
			lives:setText( _lives )
		end
	end )
	self:addElement( lives )
	self.lives = lives
	
	local Image0 = LUI.UIImage.new()
	Image0:setLeftRight( true, false, 7.75, 71.75 )
	Image0:setTopBottom( true, false, 0, 64 )
	Image0:setImage( RegisterImage( "uie_stance_stand" ) )
	self:addElement( Image0 )
	self.Image0 = Image0
	
	local bombs = LUI.UIText.new()
	bombs:setLeftRight( true, false, 109.25, 134.25 )
	bombs:setTopBottom( true, false, 16.5, 52.5 )
	bombs:setTTF( "fonts/escom.ttf" )
	bombs:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_RIGHT )
	bombs:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	bombs:linkToElementModel( self, "bombs", true, function ( model )
		local _bombs = Engine.GetModelValue( model )
		if _bombs then
			bombs:setText( _bombs )
		end
	end )
	self:addElement( bombs )
	self.bombs = bombs
	
	local Image1 = LUI.UIImage.new()
	Image1:setLeftRight( true, false, 125.13, 169.63 )
	Image1:setTopBottom( true, false, 9.5, 54.5 )
	Image1:setImage( RegisterImage( "uie_hud_zombie_bomb" ) )
	self:addElement( Image1 )
	self.Image1 = Image1
	
	local boost = LUI.UIText.new()
	boost:setLeftRight( true, false, 61.75, 89.5 )
	boost:setTopBottom( true, false, 16.5, 52.5 )
	boost:setTTF( "fonts/escom.ttf" )
	boost:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_RIGHT )
	boost:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	boost:linkToElementModel( self, "boosts", true, function ( model )
		local boosts = Engine.GetModelValue( model )
		if boosts then
			boost:setText( boosts )
		end
	end )
	self:addElement( boost )
	self.boost = boost
	
	local Image2 = LUI.UIImage.new()
	Image2:setLeftRight( true, false, 80.13, 122.13 )
	Image2:setTopBottom( true, false, 7.5, 54.5 )
	Image2:setImage( RegisterImage( "uie_hud_lightning_bolt" ) )
	self:addElement( Image2 )
	self.Image2 = Image2
	
	local points = LUI.UIText.new()
	points:setLeftRight( true, false, 158, 326.25 )
	points:setTopBottom( true, false, 7.5, 57 )
	points:setTTF( "fonts/default.ttf" )
	points:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_RIGHT )
	points:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	points:linkToElementModel( self, "score", true, function ( model )
		local score = Engine.GetModelValue( model )
		if score then
			points:setText( NumberToStringNoExponent( score ) )
		end
	end )
	self:addElement( points )
	self.points = points
	
	local multiplier = LUI.UIText.new()
	multiplier:setLeftRight( true, false, 318.61, 340.61 )
	multiplier:setTopBottom( true, false, 49.47, 69.47 )
	multiplier:setTTF( "fonts/escom.ttf" )
	multiplier:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	multiplier:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	multiplier:linkToElementModel( self, "multiplier", true, function ( model )
		local _multiplier = Engine.GetModelValue( model )
		if _multiplier then
			multiplier:setText( _multiplier )
		end
	end )
	self:addElement( multiplier )
	self.multiplier = multiplier
	
	local Label0 = LUI.UITightText.new()
	Label0:setLeftRight( true, false, 309.25, 319.25 )
	Label0:setTopBottom( true, false, 49, 69.72 )
	Label0:setText( Engine.Localize( "x" ) )
	Label0:setTTF( "fonts/default.ttf" )
	self:addElement( Label0 )
	self.Label0 = Label0
	
	local PlayerName = LUI.UIText.new()
	PlayerName:setLeftRight( true, false, 5.75, 284.25 )
	PlayerName:setTopBottom( true, false, 78.22, 108.22 )
	PlayerName:setTTF( "fonts/default.ttf" )
	PlayerName:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	PlayerName:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	PlayerName:linkToElementModel( self, "name", true, function ( model )
		local name = Engine.GetModelValue( model )
		if name then
			PlayerName:setText( LocalizeIfStringEqualTo( "DOA_RESPAWNING", name ) )
		end
	end )
	self:addElement( PlayerName )
	self.PlayerName = PlayerName
	
	local xbar1 = CoD.GenericUpdateBarWithLink.new( menu, controller )
	xbar1:setLeftRight( true, false, 5.75, 306.25 )
	xbar1:setTopBottom( true, false, 59.47, 66.75 )
	xbar1:setRGB( 0.87, 0.96, 0.71 )
	xbar1:linkToElementModel( self, "xbar", true, function ( model )
		local xbar = Engine.GetModelValue( model )
		if xbar then
			xbar1.barImage:setShaderVector( 0, CoD.GetVectorComponentFromString( xbar, 1 ), CoD.GetVectorComponentFromString( xbar, 2 ), CoD.GetVectorComponentFromString( xbar, 3 ), CoD.GetVectorComponentFromString( xbar, 4 ) )
		end
	end )
	self:addElement( xbar1 )
	self.xbar1 = xbar1
	
	local bulletbar1 = CoD.GenericUpdateBarWithLink.new( menu, controller )
	bulletbar1:setLeftRight( true, false, 5.75, 284.25 )
	bulletbar1:setTopBottom( true, false, 69, 84 )
	bulletbar1.barImage:setImage( RegisterImage( "uie_emblem_bg_bullets02" ) )
	bulletbar1:linkToElementModel( self, "bulletbar_rgb", true, function ( model )
		local bulletbarRgb = Engine.GetModelValue( model )
		if bulletbarRgb then
			bulletbar1:setRGB( bulletbarRgb )
		end
	end )
	bulletbar1:linkToElementModel( self, "bulletbar", true, function ( model )
		local bulletbar = Engine.GetModelValue( model )
		if bulletbar then
			bulletbar1.barImage:setShaderVector( 0, CoD.GetVectorComponentFromString( bulletbar, 1 ), CoD.GetVectorComponentFromString( bulletbar, 2 ), CoD.GetVectorComponentFromString( bulletbar, 3 ), CoD.GetVectorComponentFromString( bulletbar, 4 ) )
		end
	end )
	self:addElement( bulletbar1 )
	self.bulletbar1 = bulletbar1
	
	local skull1 = LUI.UIImage.new()
	skull1:setLeftRight( true, false, 276.29, 316 )
	skull1:setTopBottom( true, false, 63.25, 97.22 )
	skull1:setRGB( 1, 0.13, 0.19 )
	skull1:setImage( RegisterImage( "uie_t7_icon_redinsrally_zombie" ) )
	skull1:linkToElementModel( self, "weaplevel1", true, function ( model )
		local weaplevel1 = Engine.GetModelValue( model )
		if weaplevel1 then
			skull1:setAlpha( weaplevel1 )
		end
	end )
	self:addElement( skull1 )
	self.skull1 = skull1
	
	local skull2 = LUI.UIImage.new()
	skull2:setLeftRight( true, false, 300.25, 338.96 )
	skull2:setTopBottom( true, false, 63, 97.22 )
	skull2:setRGB( 0.53, 0, 0.76 )
	skull2:setImage( RegisterImage( "uie_t7_icon_redinsrally_zombie" ) )
	skull2:linkToElementModel( self, "weaplevel2", true, function ( model )
		local weaplevel2 = Engine.GetModelValue( model )
		if weaplevel2 then
			skull2:setAlpha( weaplevel2 )
		end
	end )
	self:addElement( skull2 )
	self.skull2 = skull2
	
	local respawn = LUI.UIText.new()
	respawn:setLeftRight( true, false, 280.89, 325.61 )
	respawn:setTopBottom( true, false, 64.22, 111.22 )
	respawn:setTTF( "fonts/escom.ttf" )
	respawn:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	respawn:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	respawn:linkToElementModel( self, "respawn", true, function ( model )
		local _respawn = Engine.GetModelValue( model )
		if _respawn then
			respawn:setText( _respawn )
		end
	end )
	self:addElement( respawn )
	self.respawn = respawn
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 16 )
				score:completeAnimation()
				self.score:setAlpha( 1 )
				self.clipFinished( score, {} )
				lives:completeAnimation()
				self.lives:setAlpha( 1 )
				self.clipFinished( lives, {} )
				Image0:completeAnimation()
				self.Image0:setAlpha( 1 )
				self.clipFinished( Image0, {} )
				bombs:completeAnimation()
				self.bombs:setAlpha( 1 )
				self.clipFinished( bombs, {} )
				Image1:completeAnimation()
				self.Image1:setAlpha( 1 )
				self.clipFinished( Image1, {} )
				boost:completeAnimation()
				self.boost:setAlpha( 1 )
				self.clipFinished( boost, {} )
				Image2:completeAnimation()
				self.Image2:setAlpha( 1 )
				self.clipFinished( Image2, {} )
				points:completeAnimation()
				self.points:setAlpha( 1 )
				self.clipFinished( points, {} )
				multiplier:completeAnimation()
				self.multiplier:setAlpha( 1 )
				self.clipFinished( multiplier, {} )
				Label0:completeAnimation()
				self.Label0:setAlpha( 1 )
				self.clipFinished( Label0, {} )
				PlayerName:completeAnimation()
				self.PlayerName:setAlpha( 1 )
				self.clipFinished( PlayerName, {} )
				xbar1:completeAnimation()
				self.xbar1:setAlpha( 1 )
				self.clipFinished( xbar1, {} )
				bulletbar1:completeAnimation()
				self.bulletbar1:setAlpha( 1 )
				self.clipFinished( bulletbar1, {} )
				skull1:completeAnimation()
				self.clipFinished( skull1, {} )
				skull2:completeAnimation()
				self.clipFinished( skull2, {} )
				respawn:completeAnimation()
				self.respawn:setAlpha( 1 )
				self.clipFinished( respawn, {} )
			end
		},
		Invisible = {
			DefaultClip = function ()
				self:setupElementClipCounter( 16 )
				score:completeAnimation()
				self.score:setAlpha( 0 )
				self.clipFinished( score, {} )
				lives:completeAnimation()
				self.lives:setAlpha( 0 )
				self.clipFinished( lives, {} )
				Image0:completeAnimation()
				self.Image0:setAlpha( 0 )
				self.clipFinished( Image0, {} )
				bombs:completeAnimation()
				self.bombs:setAlpha( 0 )
				self.clipFinished( bombs, {} )
				Image1:completeAnimation()
				self.Image1:setAlpha( 0 )
				self.clipFinished( Image1, {} )
				boost:completeAnimation()
				self.boost:setAlpha( 0 )
				self.clipFinished( boost, {} )
				Image2:completeAnimation()
				self.Image2:setAlpha( 0 )
				self.clipFinished( Image2, {} )
				points:completeAnimation()
				self.points:setAlpha( 0 )
				self.clipFinished( points, {} )
				multiplier:completeAnimation()
				self.multiplier:setAlpha( 0 )
				self.clipFinished( multiplier, {} )
				Label0:completeAnimation()
				self.Label0:setAlpha( 0 )
				self.clipFinished( Label0, {} )
				PlayerName:completeAnimation()
				self.PlayerName:setAlpha( 0 )
				self.clipFinished( PlayerName, {} )
				xbar1:completeAnimation()
				self.xbar1:setAlpha( 0 )
				self.clipFinished( xbar1, {} )
				bulletbar1:completeAnimation()
				self.bulletbar1:setAlpha( 0 )
				self.clipFinished( bulletbar1, {} )
				skull1:completeAnimation()
				self.clipFinished( skull1, {} )
				skull2:completeAnimation()
				self.clipFinished( skull2, {} )
				respawn:completeAnimation()
				self.respawn:setAlpha( 0 )
				self.clipFinished( respawn, {} )
			end
		}
	}
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.xbar1:close()
		element.bulletbar1:close()
		element.lives:close()
		element.bombs:close()
		element.boost:close()
		element.points:close()
		element.multiplier:close()
		element.PlayerName:close()
		element.skull1:close()
		element.skull2:close()
		element.respawn:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

