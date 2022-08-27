-- 7703072da6e0c06b2bcc5ba36badd037
-- This hash is used for caching, delete to decompile the file again

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
	self:setLeftRight( true, false, 0, 480 )
	self:setTopBottom( true, false, 0, 120 )
	self.anyChildUsesUpdateState = true
	
	local BG = LUI.UIImage.new()
	BG:setLeftRight( true, false, 0, 480 )
	BG:setTopBottom( true, false, 0, 120 )
	BG:setImage( RegisterImage( "uie_t7_callingcard_returnfire_bg" ) )
	self:addElement( BG )
	self.BG = BG
	
	local rainbow = LUI.UIImage.new()
	rainbow:setLeftRight( true, false, 0, 352.62 )
	rainbow:setTopBottom( true, false, 24.79, 98.48 )
	rainbow:setImage( RegisterImage( "uie_t7_callingcard_returnfire_rainbow" ) )
	rainbow:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_tile_scroll_normal" ) )
	rainbow:setShaderVector( 0, 1, 1, 0, 0 )
	rainbow:setShaderVector( 1, 0.6, 0, 0, 0 )
	self:addElement( rainbow )
	self.rainbow = rainbow
	
	local cat = LUI.UIImage.new()
	cat:setLeftRight( true, false, 284, 480 )
	cat:setTopBottom( true, false, 8, 106 )
	cat:setImage( RegisterImage( "uie_t7_callingcard_returnfire_cat" ) )
	self:addElement( cat )
	self.cat = cat
	
	local CallingCardsReturnFireStars = CoD.CallingCards_ReturnFire_Stars.new( menu, controller )
	CallingCardsReturnFireStars:setLeftRight( true, false, 253.02, 352.62 )
	CallingCardsReturnFireStars:setTopBottom( true, false, 15.64, 106 )
	self:addElement( CallingCardsReturnFireStars )
	self.CallingCardsReturnFireStars = CallingCardsReturnFireStars
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				local catFrame2 = function ( cat, event )
					local catFrame3 = function ( cat, event )
						local catFrame4 = function ( cat, event )
							if not event.interrupted then
								cat:beginAnimation( "keyframe", 370, false, false, CoD.TweenType.Linear )
							end
							cat:setLeftRight( true, false, 284, 480 )
							cat:setTopBottom( true, false, 8, 106 )
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
							cat:setTopBottom( true, false, 0.48, 98.48 )
							cat:registerEventHandler( "transition_complete_keyframe", catFrame4 )
						end
					end
					
					if event.interrupted then
						catFrame3( cat, event )
						return 
					else
						cat:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
						cat:setTopBottom( true, false, 10.64, 108.64 )
						cat:registerEventHandler( "transition_complete_keyframe", catFrame3 )
					end
				end
				
				cat:completeAnimation()
				self.cat:setLeftRight( true, false, 284, 480 )
				self.cat:setTopBottom( true, false, 8, 106 )
				catFrame2( cat, {} )
				CallingCardsReturnFireStars:completeAnimation()
				self.CallingCardsReturnFireStars:setAlpha( 1 )
				self.clipFinished( CallingCardsReturnFireStars, {} )
				self.nextClip = "DefaultClip"
			end
		}
	}
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.CallingCardsReturnFireStars:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

