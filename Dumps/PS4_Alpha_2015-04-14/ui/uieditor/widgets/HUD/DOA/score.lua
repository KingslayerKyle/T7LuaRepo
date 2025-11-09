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
	score:setLeftRight( true, false, -5, 400 )
	score:setTopBottom( true, false, 0, 64 )
	score:setRGB( 0.18, 0.75, 0.11 )
	score:setImage( RegisterImage( "uie_scorebar_zom_1" ) )
	score:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( score )
	self.score = score
	
	local lives = LUI.UIText.new()
	lives:setLeftRight( true, false, -3.75, 22.25 )
	lives:setTopBottom( true, false, 16.5, 52.5 )
	lives:setRGB( 1, 1, 1 )
	lives:setTTF( "fonts/escom.ttf" )
	lives:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_RIGHT )
	lives:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	lives:linkToElementModel( self, "lives", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			lives:setText( modelValue )
		end
	end )
	self:addElement( lives )
	self.lives = lives
	
	local Image0 = LUI.UIImage.new()
	Image0:setLeftRight( true, false, 7.75, 71.75 )
	Image0:setTopBottom( true, false, 0, 64 )
	Image0:setRGB( 1, 1, 1 )
	Image0:setImage( RegisterImage( "uie_stance_stand" ) )
	Image0:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( Image0 )
	self.Image0 = Image0
	
	local bombs = LUI.UIText.new()
	bombs:setLeftRight( true, false, 109.25, 134.25 )
	bombs:setTopBottom( true, false, 16.5, 52.5 )
	bombs:setRGB( 1, 1, 1 )
	bombs:setTTF( "fonts/escom.ttf" )
	bombs:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_RIGHT )
	bombs:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	bombs:linkToElementModel( self, "bombs", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			bombs:setText( modelValue )
		end
	end )
	self:addElement( bombs )
	self.bombs = bombs
	
	local Image1 = LUI.UIImage.new()
	Image1:setLeftRight( true, false, 125.13, 169.63 )
	Image1:setTopBottom( true, false, 9.5, 54.5 )
	Image1:setRGB( 1, 1, 1 )
	Image1:setImage( RegisterImage( "uie_hud_zombie_bomb" ) )
	Image1:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( Image1 )
	self.Image1 = Image1
	
	local boost = LUI.UIText.new()
	boost:setLeftRight( true, false, 61.75, 89.5 )
	boost:setTopBottom( true, false, 16.5, 52.5 )
	boost:setRGB( 1, 1, 1 )
	boost:setTTF( "fonts/escom.ttf" )
	boost:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_RIGHT )
	boost:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	boost:linkToElementModel( self, "boosts", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			boost:setText( modelValue )
		end
	end )
	self:addElement( boost )
	self.boost = boost
	
	local Image2 = LUI.UIImage.new()
	Image2:setLeftRight( true, false, 80.13, 122.13 )
	Image2:setTopBottom( true, false, 7.5, 54.5 )
	Image2:setRGB( 1, 1, 1 )
	Image2:setImage( RegisterImage( "uie_hud_lightning_bolt" ) )
	Image2:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( Image2 )
	self.Image2 = Image2
	
	local points = LUI.UIText.new()
	points:setLeftRight( true, false, 154.75, 375.25 )
	points:setTopBottom( true, false, 3.5, 58 )
	points:setRGB( 1, 1, 1 )
	points:setTTF( "fonts/default.ttf" )
	points:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_RIGHT )
	points:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	points:linkToElementModel( self, "score", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			points:setText( modelValue )
		end
	end )
	self:addElement( points )
	self.points = points
	
	local multiplier = LUI.UIText.new()
	multiplier:setLeftRight( true, false, 349.75, 371.75 )
	multiplier:setTopBottom( true, false, 52, 72 )
	multiplier:setRGB( 1, 1, 1 )
	multiplier:setTTF( "fonts/escom.ttf" )
	multiplier:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_RIGHT )
	multiplier:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	multiplier:linkToElementModel( self, "multiplier", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			multiplier:setText( modelValue )
		end
	end )
	self:addElement( multiplier )
	self.multiplier = multiplier
	
	local Label0 = LUI.UITightText.new()
	Label0:setLeftRight( true, false, 344.75, 355.75 )
	Label0:setTopBottom( true, false, 43.72, 75.22 )
	Label0:setRGB( 1, 1, 1 )
	Label0:setText( Engine.Localize( "x" ) )
	Label0:setTTF( "fonts/default.ttf" )
	self:addElement( Label0 )
	self.Label0 = Label0
	
	local PlayerName = LUI.UIText.new()
	PlayerName:setLeftRight( true, false, 5.75, 352.25 )
	PlayerName:setTopBottom( true, false, 75.22, 105.22 )
	PlayerName:setRGB( 1, 1, 1 )
	PlayerName:setTTF( "fonts/default.ttf" )
	PlayerName:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	PlayerName:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	PlayerName:linkToElementModel( self, "name", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			PlayerName:setText( modelValue )
		end
	end )
	self:addElement( PlayerName )
	self.PlayerName = PlayerName
	
	local xbar1 = CoD.GenericUpdateBarWithLink.new( menu, controller )
	xbar1:setLeftRight( true, false, 5.75, 336.88 )
	xbar1:setTopBottom( true, false, 59.47, 66.75 )
	xbar1:setRGB( 0.87, 0.96, 0.71 )
	xbar1:linkToElementModel( self, "xbar", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			xbar1.barImage:setShaderVector( 0, CoD.GetVectorComponentFromString( modelValue, 1 ), CoD.GetVectorComponentFromString( modelValue, 2 ), CoD.GetVectorComponentFromString( modelValue, 3 ), CoD.GetVectorComponentFromString( modelValue, 4 ) )
		end
	end )
	self:addElement( xbar1 )
	self.xbar1 = xbar1
	
	local bulletbar1 = CoD.GenericUpdateBarWithLink.new( menu, controller )
	bulletbar1:setLeftRight( true, false, 5.75, 338.75 )
	bulletbar1:setTopBottom( true, false, 68.75, 83.75 )
	bulletbar1:setRGB( 1, 1, 1 )
	bulletbar1.barImage:setImage( RegisterImage( "uie_emblem_bg_bullets02" ) )
	bulletbar1:linkToElementModel( self, "bulletbar", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			bulletbar1.barImage:setShaderVector( 0, CoD.GetVectorComponentFromString( modelValue, 1 ), CoD.GetVectorComponentFromString( modelValue, 2 ), CoD.GetVectorComponentFromString( modelValue, 3 ), CoD.GetVectorComponentFromString( modelValue, 4 ) )
		end
	end )
	self:addElement( bulletbar1 )
	self.bulletbar1 = bulletbar1
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 13 )
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
			end
		},
		Invisible = {
			DefaultClip = function ()
				self:setupElementClipCounter( 13 )
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
			end
		}
	}
	self.close = function ( self )
		self.xbar1:close()
		self.bulletbar1:close()
		self.lives:close()
		self.bombs:close()
		self.boost:close()
		self.points:close()
		self.multiplier:close()
		self.PlayerName:close()
		CoD.score.super.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

