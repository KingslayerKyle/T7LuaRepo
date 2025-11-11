require( "ui.uieditor.widgets.CallingCards.CallingCards_KillerEyes" )

CoD.CallingCards_Perk1Widget = InheritFrom( LUI.UIElement )
CoD.CallingCards_Perk1Widget.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( true )
	self:setClass( CoD.CallingCards_Perk1Widget )
	self.id = "CallingCards_Perk1Widget"
	self.soundSet = "default"
	self:setLeftRight( 0, 0, 0, 720 )
	self:setTopBottom( 0, 0, 0, 180 )
	self.anyChildUsesUpdateState = true
	
	local RED = LUI.UIImage.new()
	RED:setLeftRight( 0, 0, 0, 720 )
	RED:setTopBottom( 0, 0, 0, 180 )
	RED:setRGB( 0.7, 0, 0 )
	self:addElement( RED )
	self.RED = RED
	
	local black = LUI.UIImage.new()
	black:setLeftRight( 0, 0, 0, 720 )
	black:setTopBottom( 0, 0, 0, 180 )
	black:setImage( RegisterImage( "uie_t7_callingcard_perk1_black" ) )
	self:addElement( black )
	self.black = black
	
	local flameright = LUI.UIImage.new()
	flameright:setLeftRight( 0, 0, 582, 762 )
	flameright:setTopBottom( 0, 0, -57, 267 )
	flameright:setImage( RegisterImage( "uie_t7_callingcard_perk1_flameleft" ) )
	self:addElement( flameright )
	self.flameright = flameright
	
	local flameleft = LUI.UIImage.new()
	flameleft:setLeftRight( 0, 0, 213, 447 )
	flameleft:setTopBottom( 0, 0, -66, 258 )
	flameleft:setImage( RegisterImage( "uie_t7_callingcard_perk1_flameright" ) )
	self:addElement( flameleft )
	self.flameleft = flameleft
	
	local hand = LUI.UIImage.new()
	hand:setLeftRight( 0, 0, 98, 239 )
	hand:setTopBottom( 0, 0, 25, 213 )
	hand:setImage( RegisterImage( "uie_t7_callingcard_perk1_hand" ) )
	self:addElement( hand )
	self.hand = hand
	
	local b1 = LUI.UIImage.new()
	b1:setLeftRight( 0, 0, 414, 594 )
	b1:setTopBottom( 0, 0, 0, 180 )
	b1:setImage( RegisterImage( "uie_t7_callingcard_perk1_flame_flipbook" ) )
	b1:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_flipbook" ) )
	b1:setShaderVector( 0, 3, 0, 0, 0 )
	b1:setShaderVector( 1, 8.06, 0, 0, 0 )
	self:addElement( b1 )
	self.b1 = b1
	
	local man = LUI.UIImage.new()
	man:setLeftRight( 0, 0, 414, 594 )
	man:setTopBottom( 0, 0, 0, 180 )
	man:setImage( RegisterImage( "uie_t7_callingcard_perk1_man" ) )
	self:addElement( man )
	self.man = man
	
	local CallingCardsKillerEyes0 = CoD.CallingCards_KillerEyes.new( menu, controller )
	CallingCardsKillerEyes0:setLeftRight( 0, 0, 518, 566 )
	CallingCardsKillerEyes0:setTopBottom( 0, 0, 13, 31 )
	CallingCardsKillerEyes0:setZRot( -10 )
	CallingCardsKillerEyes0:setScale( 0.5 )
	self:addElement( CallingCardsKillerEyes0 )
	self.CallingCardsKillerEyes0 = CallingCardsKillerEyes0
	
	self.resetProperties = function ()
		RED:completeAnimation()
		flameleft:completeAnimation()
		flameright:completeAnimation()
		RED:setRGB( 0.7, 0, 0 )
		RED:setAlpha( 1 )
		flameleft:setRGB( 1, 1, 1 )
		flameleft:setAlpha( 1 )
		flameright:setRGB( 1, 1, 1 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 3 )
				local REDFrame2 = function ( RED, event )
					local REDFrame3 = function ( RED, event )
						if not event.interrupted then
							RED:beginAnimation( "keyframe", 279, false, false, CoD.TweenType.Linear )
						end
						RED:setRGB( 0.7, 0, 0 )
						RED:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( RED, event )
						else
							RED:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						REDFrame3( RED, event )
						return 
					else
						RED:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
						RED:setRGB( 0.86, 0.38, 0 )
						RED:registerEventHandler( "transition_complete_keyframe", REDFrame3 )
					end
				end
				
				RED:completeAnimation()
				self.RED:setRGB( 0.7, 0, 0 )
				self.RED:setAlpha( 1 )
				REDFrame2( RED, {} )
				local flamerightFrame2 = function ( flameright, event )
					local flamerightFrame3 = function ( flameright, event )
						if not event.interrupted then
							flameright:beginAnimation( "keyframe", 279, false, false, CoD.TweenType.Linear )
						end
						flameright:setRGB( 1, 1, 1 )
						if event.interrupted then
							self.clipFinished( flameright, event )
						else
							flameright:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						flamerightFrame3( flameright, event )
						return 
					else
						flameright:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
						flameright:setRGB( 0.75, 1, 0.79 )
						flameright:registerEventHandler( "transition_complete_keyframe", flamerightFrame3 )
					end
				end
				
				flameright:completeAnimation()
				self.flameright:setRGB( 1, 1, 1 )
				flamerightFrame2( flameright, {} )
				local flameleftFrame2 = function ( flameleft, event )
					local flameleftFrame3 = function ( flameleft, event )
						if not event.interrupted then
							flameleft:beginAnimation( "keyframe", 279, false, false, CoD.TweenType.Linear )
						end
						flameleft:setRGB( 1, 1, 1 )
						flameleft:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( flameleft, event )
						else
							flameleft:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						flameleftFrame3( flameleft, event )
						return 
					else
						flameleft:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
						flameleft:setRGB( 0.75, 1, 0.79 )
						flameleft:registerEventHandler( "transition_complete_keyframe", flameleftFrame3 )
					end
				end
				
				flameleft:completeAnimation()
				self.flameleft:setRGB( 1, 1, 1 )
				self.flameleft:setAlpha( 1 )
				flameleftFrame2( flameleft, {} )
				self.nextClip = "DefaultClip"
			end
		}
	}
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.CallingCardsKillerEyes0:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

