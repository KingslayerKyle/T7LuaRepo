CoD.Prestige_PermanentUnlockTokenStatic = InheritFrom( LUI.UIElement )
CoD.Prestige_PermanentUnlockTokenStatic.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.Prestige_PermanentUnlockTokenStatic )
	self.id = "Prestige_PermanentUnlockTokenStatic"
	self.soundSet = "default"
	self:setLeftRight( 0, 0, 0, 48 )
	self:setTopBottom( 0, 0, 0, 48 )
	
	local imgTokenBox = LUI.UIImage.new()
	imgTokenBox:setLeftRight( 0, 1, 0, 0 )
	imgTokenBox:setTopBottom( 0, 1, 0, 0 )
	imgTokenBox:setAlpha( 0 )
	imgTokenBox:setImage( RegisterImage( "uie_t7_menu_cac_icontokenbox" ) )
	imgTokenBox:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( imgTokenBox )
	self.imgTokenBox = imgTokenBox
	
	local imgIconTokenMult = LUI.UIImage.new()
	imgIconTokenMult:setLeftRight( 0, 1, 0, 0 )
	imgIconTokenMult:setTopBottom( 0, 1, 0, 0 )
	imgIconTokenMult:setRGB( 0, 0, 0 )
	imgIconTokenMult:setAlpha( 0.43 )
	imgIconTokenMult:setImage( RegisterImage( "uie_t7_gamesettings_asteriskicon" ) )
	self:addElement( imgIconTokenMult )
	self.imgIconTokenMult = imgIconTokenMult
	
	local imgIconToken = LUI.UIImage.new()
	imgIconToken:setLeftRight( 0, 1, -24, 24 )
	imgIconToken:setTopBottom( 0, 1, -24, 24 )
	imgIconToken:setAlpha( 0.92 )
	imgIconToken:setScale( 0.5 )
	imgIconToken:setImage( RegisterImage( "t7_icons_prestige_mp_permanentoken" ) )
	self:addElement( imgIconToken )
	self.imgIconToken = imgIconToken
	
	local glow = LUI.UIImage.new()
	glow:setLeftRight( 0, 1, 0, 20 )
	glow:setTopBottom( 0, 1, -3, 17 )
	glow:setRGB( 1, 0.48, 0 )
	glow:setAlpha( RandomAddPercent( -15, 0 ) )
	glow:setImage( RegisterImage( "uie_t7_menu_cac_glow" ) )
	glow:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( glow )
	self.glow = glow
	
	self.resetProperties = function ()
		imgIconToken:completeAnimation()
		imgIconTokenMult:completeAnimation()
		glow:completeAnimation()
		imgTokenBox:completeAnimation()
		imgIconToken:setAlpha( 0.92 )
		imgIconTokenMult:setAlpha( 0.43 )
		glow:setAlpha( RandomAddPercent( -15, 0 ) )
		imgTokenBox:setLeftRight( 0, 1, 0, 0 )
		imgTokenBox:setTopBottom( 0, 1, 0, 0 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 2 )
				imgIconTokenMult:completeAnimation()
				self.imgIconTokenMult:setAlpha( 0 )
				self.clipFinished( imgIconTokenMult, {} )
				imgIconToken:completeAnimation()
				self.imgIconToken:setAlpha( 0 )
				self.clipFinished( imgIconToken, {} )
			end
		},
		Visible = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 2 )
				imgTokenBox:completeAnimation()
				self.imgTokenBox:setLeftRight( 0, 1, -2, 6 )
				self.imgTokenBox:setTopBottom( 0, 1, -6, 6 )
				self.clipFinished( imgTokenBox, {} )
				local glowFrame2 = function ( glow, event )
					local glowFrame3 = function ( glow, event )
						if not event.interrupted then
							glow:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
						end
						glow:setAlpha( RandomAddPercent( -15, 0.26 ) )
						if event.interrupted then
							self.clipFinished( glow, event )
						else
							glow:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						glowFrame3( glow, event )
						return 
					else
						glow:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
						glow:registerEventHandler( "transition_complete_keyframe", glowFrame3 )
					end
				end
				
				glow:completeAnimation()
				self.glow:setAlpha( RandomAddPercent( -15, 0.26 ) )
				glowFrame2( glow, {} )
				self.nextClip = "DefaultClip"
			end
		}
	}
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

