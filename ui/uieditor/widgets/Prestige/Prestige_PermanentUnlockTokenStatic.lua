-- 0abf46137f19e0fe25ffa12ba558ac86
-- This hash is used for caching, delete to decompile the file again

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
	self:setLeftRight( true, false, 0, 32 )
	self:setTopBottom( true, false, 0, 32 )
	
	local imgTokenBox = LUI.UIImage.new()
	imgTokenBox:setLeftRight( true, true, 0, 0 )
	imgTokenBox:setTopBottom( true, true, 0, 0 )
	imgTokenBox:setAlpha( 0 )
	imgTokenBox:setImage( RegisterImage( "uie_t7_menu_cac_icontokenbox" ) )
	imgTokenBox:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( imgTokenBox )
	self.imgTokenBox = imgTokenBox
	
	local imgIconTokenMult = LUI.UIImage.new()
	imgIconTokenMult:setLeftRight( true, true, 0, 0 )
	imgIconTokenMult:setTopBottom( true, true, 0, 0 )
	imgIconTokenMult:setRGB( 0, 0, 0 )
	imgIconTokenMult:setAlpha( 0.43 )
	imgIconTokenMult:setImage( RegisterImage( "uie_t7_gamesettings_asteriskicon" ) )
	self:addElement( imgIconTokenMult )
	self.imgIconTokenMult = imgIconTokenMult
	
	local imgIconToken = LUI.UIImage.new()
	imgIconToken:setLeftRight( true, true, -16, 16 )
	imgIconToken:setTopBottom( true, true, -16, 16 )
	imgIconToken:setAlpha( 0.92 )
	imgIconToken:setScale( 0.5 )
	imgIconToken:setImage( RegisterImage( "uie_t7_icons_prestige_permanenttoken" ) )
	self:addElement( imgIconToken )
	self.imgIconToken = imgIconToken
	
	local glow = LUI.UIImage.new()
	glow:setLeftRight( true, true, 0, 12.7 )
	glow:setTopBottom( true, true, -2, 10.7 )
	glow:setRGB( 1, 0.48, 0 )
	glow:setAlpha( RandomAddPercent( -15, 0 ) )
	glow:setImage( RegisterImage( "uie_t7_menu_cac_glow" ) )
	glow:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( glow )
	self.glow = glow
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 4 )
				imgTokenBox:completeAnimation()
				self.imgTokenBox:setAlpha( 0 )
				self.clipFinished( imgTokenBox, {} )
				imgIconTokenMult:completeAnimation()
				self.imgIconTokenMult:setAlpha( 0 )
				self.clipFinished( imgIconTokenMult, {} )
				imgIconToken:completeAnimation()
				self.imgIconToken:setAlpha( 0 )
				self.clipFinished( imgIconToken, {} )
				glow:completeAnimation()
				self.glow:setAlpha( RandomAddPercent( -15, 0 ) )
				self.clipFinished( glow, {} )
			end
		},
		Visible = {
			DefaultClip = function ()
				self:setupElementClipCounter( 4 )
				imgTokenBox:completeAnimation()
				self.imgTokenBox:setLeftRight( true, true, -1.89, 3.89 )
				self.imgTokenBox:setTopBottom( true, true, -4, 4 )
				self.imgTokenBox:setAlpha( 0 )
				self.clipFinished( imgTokenBox, {} )
				imgIconTokenMult:completeAnimation()
				self.imgIconTokenMult:setAlpha( 0.43 )
				self.clipFinished( imgIconTokenMult, {} )
				imgIconToken:completeAnimation()
				self.imgIconToken:setAlpha( 0.92 )
				self.clipFinished( imgIconToken, {} )
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

