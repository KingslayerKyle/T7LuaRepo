CoD.BM_Bribe_Selected_Hover = InheritFrom( LUI.UIElement )
CoD.BM_Bribe_Selected_Hover.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.BM_Bribe_Selected_Hover )
	self.id = "BM_Bribe_Selected_Hover"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 497 )
	self:setTopBottom( true, false, 0, 217 )
	
	local BribeSelection = LUI.UIImage.new()
	BribeSelection:setLeftRight( true, false, 0, 497 )
	BribeSelection:setTopBottom( true, false, 0, 217 )
	BribeSelection:setImage( RegisterImage( "uie_t7_blackmarket_bribe_selected" ) )
	self:addElement( BribeSelection )
	self.BribeSelection = BribeSelection
	
	local BribeSelection0 = LUI.UIImage.new()
	BribeSelection0:setLeftRight( true, false, 0, 497 )
	BribeSelection0:setTopBottom( true, false, 0, 217 )
	BribeSelection0:setImage( RegisterImage( "uie_t7_blackmarket_bribe_selected" ) )
	self:addElement( BribeSelection0 )
	self.BribeSelection0 = BribeSelection0
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				local BribeSelectionFrame2 = function ( BribeSelection, event )
					local BribeSelectionFrame3 = function ( BribeSelection, event )
						if not event.interrupted then
							BribeSelection:beginAnimation( "keyframe", 799, false, false, CoD.TweenType.Linear )
						end
						BribeSelection:setAlpha( 0 )
						if event.interrupted then
							self.clipFinished( BribeSelection, event )
						else
							BribeSelection:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						BribeSelectionFrame3( BribeSelection, event )
						return 
					else
						BribeSelection:beginAnimation( "keyframe", 740, false, false, CoD.TweenType.Linear )
						BribeSelection:setAlpha( 1 )
						BribeSelection:registerEventHandler( "transition_complete_keyframe", BribeSelectionFrame3 )
					end
				end
				
				BribeSelection:completeAnimation()
				self.BribeSelection:setAlpha( 0 )
				BribeSelectionFrame2( BribeSelection, {} )
				BribeSelection0:completeAnimation()
				self.BribeSelection0:setAlpha( 1 )
				self.clipFinished( BribeSelection0, {} )
				self.nextClip = "DefaultClip"
			end
		}
	}
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

