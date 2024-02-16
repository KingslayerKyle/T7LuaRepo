-- 40fb2ab0c8e991e8e3f56450da502000
-- This hash is used for caching, delete to decompile the file again

CoD.BM_SmallSelected_Hover = InheritFrom( LUI.UIElement )
CoD.BM_SmallSelected_Hover.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.BM_SmallSelected_Hover )
	self.id = "BM_SmallSelected_Hover"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 269 )
	self:setTopBottom( true, false, 0, 222 )
	
	local SmallSelected = LUI.UIImage.new()
	SmallSelected:setLeftRight( true, false, 0, 269.08 )
	SmallSelected:setTopBottom( true, false, 0, 221.6 )
	SmallSelected:setAlpha( 0 )
	SmallSelected:setImage( RegisterImage( "uie_t7_blackmarket_bribe_small_selected" ) )
	self:addElement( SmallSelected )
	self.SmallSelected = SmallSelected
	
	local SmallSelected1 = LUI.UIImage.new()
	SmallSelected1:setLeftRight( true, false, 0, 269.08 )
	SmallSelected1:setTopBottom( true, false, 0, 221.6 )
	SmallSelected1:setImage( RegisterImage( "uie_t7_blackmarket_bribe_small_selected" ) )
	self:addElement( SmallSelected1 )
	self.SmallSelected1 = SmallSelected1
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )

				local SmallSelectedFrame2 = function ( SmallSelected, event )
					local SmallSelectedFrame3 = function ( SmallSelected, event )
						if not event.interrupted then
							SmallSelected:beginAnimation( "keyframe", 799, false, false, CoD.TweenType.Linear )
						end
						SmallSelected:setAlpha( 0 )
						if event.interrupted then
							self.clipFinished( SmallSelected, event )
						else
							SmallSelected:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						SmallSelectedFrame3( SmallSelected, event )
						return 
					else
						SmallSelected:beginAnimation( "keyframe", 740, false, false, CoD.TweenType.Linear )
						SmallSelected:setAlpha( 1 )
						SmallSelected:registerEventHandler( "transition_complete_keyframe", SmallSelectedFrame3 )
					end
				end
				
				SmallSelected:completeAnimation()
				self.SmallSelected:setAlpha( 0 )
				SmallSelectedFrame2( SmallSelected, {} )

				SmallSelected1:completeAnimation()
				self.SmallSelected1:setAlpha( 1 )
				self.clipFinished( SmallSelected1, {} )

				self.nextClip = "DefaultClip"
			end
		}
	}
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
