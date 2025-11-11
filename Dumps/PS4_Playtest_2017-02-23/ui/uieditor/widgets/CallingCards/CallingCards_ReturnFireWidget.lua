require( "ui.uieditor.widgets.CallingCards.CallingCards_ReturnFire_Stars" )

CoD.CallingCards_ReturnFireWidget = InheritFrom( LUI.UIElement )
CoD.CallingCards_ReturnFireWidget.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( true )
	self:setClass( CoD.CallingCards_ReturnFireWidget )
	self.id = "CallingCards_ReturnFireWidget"
	self.soundSet = "default"
	self:setLeftRight( 0, 0, 0, 720 )
	self:setTopBottom( 0, 0, 0, 180 )
	self.anyChildUsesUpdateState = true
	
	local BG = LUI.UIImage.new()
	BG:setLeftRight( 0, 0, 0, 720 )
	BG:setTopBottom( 0, 0, 0, 180 )
	BG:setImage( RegisterImage( "uie_t7_callingcard_returnfire_bg" ) )
	self:addElement( BG )
	self.BG = BG
	
	local rainbow = LUI.UIImage.new()
	rainbow:setLeftRight( 0, 0, 0, 529 )
	rainbow:setTopBottom( 0, 0, 37, 148 )
	rainbow:setImage( RegisterImage( "uie_t7_callingcard_returnfire_rainbow" ) )
	rainbow:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_tile_scroll_normal" ) )
	rainbow:setShaderVector( 0, 1, 1, 0, 0 )
	rainbow:setShaderVector( 1, 0.6, 0, 0, 0 )
	self:addElement( rainbow )
	self.rainbow = rainbow
	
	local cat = LUI.UIImage.new()
	cat:setLeftRight( 0, 0, 426, 720 )
	cat:setTopBottom( 0, 0, 12, 159 )
	cat:setImage( RegisterImage( "uie_t7_callingcard_returnfire_cat" ) )
	self:addElement( cat )
	self.cat = cat
	
	local CallingCardsReturnFireStars = CoD.CallingCards_ReturnFire_Stars.new( menu, controller )
	CallingCardsReturnFireStars:setLeftRight( 0, 0, 380, 529 )
	CallingCardsReturnFireStars:setTopBottom( 0, 0, 23, 159 )
	self:addElement( CallingCardsReturnFireStars )
	self.CallingCardsReturnFireStars = CallingCardsReturnFireStars
	
	self.resetProperties = function ()
		cat:completeAnimation()
		cat:setLeftRight( 0, 0, 426, 720 )
		cat:setTopBottom( 0, 0, 12, 159 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 1 )
				local catFrame2 = function ( cat, event )
					local catFrame3 = function ( cat, event )
						local catFrame4 = function ( cat, event )
							if not event.interrupted then
								cat:beginAnimation( "keyframe", 370, false, false, CoD.TweenType.Linear )
							end
							cat:setLeftRight( 0, 0, 426, 720 )
							cat:setTopBottom( 0, 0, 12, 159 )
							if event.interrupted then
								self.clipFinished( cat, event )
							else
								cat:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							catFrame4( cat, event )
							return 
						else
							cat:beginAnimation( "keyframe", 329, false, false, CoD.TweenType.Linear )
							cat:setTopBottom( 0, 0, 1, 148 )
							cat:registerEventHandler( "transition_complete_keyframe", catFrame4 )
						end
					end
					
					if event.interrupted then
						catFrame3( cat, event )
						return 
					else
						cat:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
						cat:setTopBottom( 0, 0, 16, 163 )
						cat:registerEventHandler( "transition_complete_keyframe", catFrame3 )
					end
				end
				
				cat:completeAnimation()
				self.cat:setLeftRight( 0, 0, 426, 720 )
				self.cat:setTopBottom( 0, 0, 12, 159 )
				catFrame2( cat, {} )
				self.nextClip = "DefaultClip"
			end
		}
	}
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.CallingCardsReturnFireStars:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

