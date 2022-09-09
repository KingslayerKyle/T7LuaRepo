-- bb99ff5d8ba5fba2bdfb561d248fd366
-- This hash is used for caching, delete to decompile the file again

CoD.BM_BigSelection_Hover = InheritFrom( LUI.UIElement )
CoD.BM_BigSelection_Hover.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.BM_BigSelection_Hover )
	self.id = "BM_BigSelection_Hover"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 277 )
	self:setTopBottom( true, false, 0, 384 )
	
	local BigCommonRareHover = LUI.UIImage.new()
	BigCommonRareHover:setLeftRight( true, true, 0, -0.46 )
	BigCommonRareHover:setTopBottom( true, true, 0, -0.06 )
	BigCommonRareHover:setImage( RegisterImage( "uie_t7_blackmarket_bribe_big_selected" ) )
	self:addElement( BigCommonRareHover )
	self.BigCommonRareHover = BigCommonRareHover
	
	local BigCommonRareHover0 = LUI.UIImage.new()
	BigCommonRareHover0:setLeftRight( true, true, 0, -0.46 )
	BigCommonRareHover0:setTopBottom( true, true, 0, -0.06 )
	BigCommonRareHover0:setImage( RegisterImage( "uie_t7_blackmarket_bribe_big_selected" ) )
	self:addElement( BigCommonRareHover0 )
	self.BigCommonRareHover0 = BigCommonRareHover0
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )

				local BigCommonRareHoverFrame2 = function ( BigCommonRareHover, event )
					local BigCommonRareHoverFrame3 = function ( BigCommonRareHover, event )
						if not event.interrupted then
							BigCommonRareHover:beginAnimation( "keyframe", 799, false, false, CoD.TweenType.Linear )
						end
						BigCommonRareHover:setAlpha( 0 )
						if event.interrupted then
							self.clipFinished( BigCommonRareHover, event )
						else
							BigCommonRareHover:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						BigCommonRareHoverFrame3( BigCommonRareHover, event )
						return 
					else
						BigCommonRareHover:beginAnimation( "keyframe", 740, false, false, CoD.TweenType.Linear )
						BigCommonRareHover:setAlpha( 1 )
						BigCommonRareHover:registerEventHandler( "transition_complete_keyframe", BigCommonRareHoverFrame3 )
					end
				end
				
				BigCommonRareHover:completeAnimation()
				self.BigCommonRareHover:setAlpha( 0 )
				BigCommonRareHoverFrame2( BigCommonRareHover, {} )

				self.nextClip = "DefaultClip"
			end
		}
	}
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
