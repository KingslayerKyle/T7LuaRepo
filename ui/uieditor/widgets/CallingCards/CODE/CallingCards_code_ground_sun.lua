-- d1a381ccdb064e55fff4f1057a602b8a
-- This hash is used for caching, delete to decompile the file again

CoD.CallingCards_code_ground_sun = InheritFrom( LUI.UIElement )
CoD.CallingCards_code_ground_sun.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.CallingCards_code_ground_sun )
	self.id = "CallingCards_code_ground_sun"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 240 )
	self:setTopBottom( true, false, 0, 120 )
	
	local SUN2 = LUI.UIImage.new()
	SUN2:setLeftRight( true, false, 0, 240 )
	SUN2:setTopBottom( true, false, 0, 120 )
	SUN2:setImage( RegisterImage( "uie_t7_callingcards_ground_sun2" ) )
	self:addElement( SUN2 )
	self.SUN2 = SUN2
	
	local SUN = LUI.UIImage.new()
	SUN:setLeftRight( true, false, 0, 240 )
	SUN:setTopBottom( true, false, 0, 120 )
	SUN:setAlpha( 0 )
	SUN:setImage( RegisterImage( "uie_t7_callingcards_ground_sun" ) )
	self:addElement( SUN )
	self.SUN = SUN
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )

				SUN2:completeAnimation()
				self.SUN2:setAlpha( 1 )
				self.clipFinished( SUN2, {} )
				local SUNFrame2 = function ( SUN, event )
					local SUNFrame3 = function ( SUN, event )
						if not event.interrupted then
							SUN:beginAnimation( "keyframe", 2010, false, false, CoD.TweenType.Linear )
						end
						SUN:setAlpha( 0 )
						if event.interrupted then
							self.clipFinished( SUN, event )
						else
							SUN:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						SUNFrame3( SUN, event )
						return 
					else
						SUN:beginAnimation( "keyframe", 2000, false, false, CoD.TweenType.Linear )
						SUN:setAlpha( 1 )
						SUN:registerEventHandler( "transition_complete_keyframe", SUNFrame3 )
					end
				end
				
				SUN:completeAnimation()
				self.SUN:setAlpha( 0 )
				SUNFrame2( SUN, {} )

				self.nextClip = "DefaultClip"
			end
		}
	}
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
