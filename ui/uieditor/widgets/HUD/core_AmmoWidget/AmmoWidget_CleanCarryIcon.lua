-- 3e77d19935a105c3762e82edc9199f8e
-- This hash is used for caching, delete to decompile the file again

CoD.AmmoWidget_CleanCarryIcon = InheritFrom( LUI.UIElement )
CoD.AmmoWidget_CleanCarryIcon.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.AmmoWidget_CleanCarryIcon )
	self.id = "AmmoWidget_CleanCarryIcon"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 82 )
	self:setTopBottom( true, false, 0, 82 )
	
	local CleanIcon = LUI.UIImage.new()
	CleanIcon:setLeftRight( true, false, 0, 82 )
	CleanIcon:setTopBottom( true, false, 0, 82 )
	CleanIcon:setImage( RegisterImage( "uie_t7_hud_widget_stockpile" ) )
	self:addElement( CleanIcon )
	self.CleanIcon = CleanIcon
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )

				CleanIcon:completeAnimation()
				self.CleanIcon:setScale( 1 )
				self.clipFinished( CleanIcon, {} )

				self.nextClip = "DefaultClip"
			end,
			Full = function ()
				self:setupElementClipCounter( 1 )

				local CleanIconFrame2 = function ( CleanIcon, event )
					local CleanIconFrame3 = function ( CleanIcon, event )
						if not event.interrupted then
							CleanIcon:beginAnimation( "keyframe", 200, false, true, CoD.TweenType.Linear )
						end
						CleanIcon:setScale( 1 )
						if event.interrupted then
							self.clipFinished( CleanIcon, event )
						else
							CleanIcon:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						CleanIconFrame3( CleanIcon, event )
						return 
					else
						CleanIcon:beginAnimation( "keyframe", 100, false, true, CoD.TweenType.Linear )
						CleanIcon:setScale( 1.2 )
						CleanIcon:registerEventHandler( "transition_complete_keyframe", CleanIconFrame3 )
					end
				end
				
				CleanIcon:completeAnimation()
				self.CleanIcon:setScale( 1 )
				CleanIconFrame2( CleanIcon, {} )
			end
		}
	}
	self:subscribeToGlobalModel( controller, "PerController", "hudItems.cleanCarryFull", function ( model )
		local f6_local0 = self
		PlayClip( self, "Full", controller )
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

