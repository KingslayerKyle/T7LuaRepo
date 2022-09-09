-- 6b59be771e1dddea7913cd52180a27c3
-- This hash is used for caching, delete to decompile the file again

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
	self:setLeftRight( true, false, 0, 480 )
	self:setTopBottom( true, false, 0, 120 )
	self.anyChildUsesUpdateState = true
	
	local RED = LUI.UIImage.new()
	RED:setLeftRight( true, false, 0, 480 )
	RED:setTopBottom( true, false, 0, 120 )
	RED:setRGB( 0.7, 0, 0 )
	self:addElement( RED )
	self.RED = RED
	
	local black = LUI.UIImage.new()
	black:setLeftRight( true, false, 0, 480 )
	black:setTopBottom( true, false, 0, 120 )
	black:setImage( RegisterImage( "uie_t7_callingcard_perk1_black" ) )
	self:addElement( black )
	self.black = black
	
	local flameright = LUI.UIImage.new()
	flameright:setLeftRight( true, false, 388, 508 )
	flameright:setTopBottom( true, false, -38, 178 )
	flameright:setImage( RegisterImage( "uie_t7_callingcard_perk1_flameleft" ) )
	self:addElement( flameright )
	self.flameright = flameright
	
	local flameleft = LUI.UIImage.new()
	flameleft:setLeftRight( true, false, 142, 298 )
	flameleft:setTopBottom( true, false, -44, 172 )
	flameleft:setImage( RegisterImage( "uie_t7_callingcard_perk1_flameright" ) )
	self:addElement( flameleft )
	self.flameleft = flameleft
	
	local hand = LUI.UIImage.new()
	hand:setLeftRight( true, false, 65.25, 159 )
	hand:setTopBottom( true, false, 17, 142 )
	hand:setImage( RegisterImage( "uie_t7_callingcard_perk1_hand" ) )
	self:addElement( hand )
	self.hand = hand
	
	local b1 = LUI.UIImage.new()
	b1:setLeftRight( true, false, 276.25, 396.25 )
	b1:setTopBottom( true, false, 0, 120 )
	b1:setImage( RegisterImage( "uie_t7_callingcard_perk1_flame_flipbook" ) )
	b1:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_flipbook" ) )
	b1:setShaderVector( 0, 3, 0, 0, 0 )
	b1:setShaderVector( 1, 8.06, 0, 0, 0 )
	self:addElement( b1 )
	self.b1 = b1
	
	local man = LUI.UIImage.new()
	man:setLeftRight( true, false, 276.25, 396.25 )
	man:setTopBottom( true, false, 0, 120 )
	man:setImage( RegisterImage( "uie_t7_callingcard_perk1_man" ) )
	self:addElement( man )
	self.man = man
	
	local CallingCardsKillerEyes0 = CoD.CallingCards_KillerEyes.new( menu, controller )
	CallingCardsKillerEyes0:setLeftRight( true, false, 345.11, 377.11 )
	CallingCardsKillerEyes0:setTopBottom( true, false, 8.97, 20.97 )
	CallingCardsKillerEyes0:setZRot( -10 )
	CallingCardsKillerEyes0:setScale( 0.5 )
	self:addElement( CallingCardsKillerEyes0 )
	self.CallingCardsKillerEyes0 = CallingCardsKillerEyes0
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 5 )

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

				hand:completeAnimation()
				self.hand:setLeftRight( true, false, 65.25, 159 )
				self.hand:setTopBottom( true, false, 17, 142 )
				self.hand:setZRot( 0 )
				self.clipFinished( hand, {} )

				CallingCardsKillerEyes0:completeAnimation()
				self.CallingCardsKillerEyes0:setAlpha( 1 )
				self.clipFinished( CallingCardsKillerEyes0, {} )

				self.nextClip = "DefaultClip"
			end
		}
	}

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.CallingCardsKillerEyes0:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
