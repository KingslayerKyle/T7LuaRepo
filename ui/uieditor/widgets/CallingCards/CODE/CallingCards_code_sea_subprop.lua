-- 2c65d924428a80df9fa8e072304ca9ab
-- This hash is used for caching, delete to decompile the file again

CoD.CallingCards_code_sea_subprop = InheritFrom( LUI.UIElement )
CoD.CallingCards_code_sea_subprop.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( true )
	self:setClass( CoD.CallingCards_code_sea_subprop )
	self.id = "CallingCards_code_sea_subprop"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 36 )
	self:setTopBottom( true, false, 0, 36 )
	
	local subprop = LUI.UIImage.new()
	subprop:setLeftRight( true, false, 0, 36 )
	subprop:setTopBottom( true, false, 0, 36 )
	subprop:setImage( RegisterImage( "uie_t7_callingcards_sea_sub_prop" ) )
	self:addElement( subprop )
	self.subprop = subprop
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )

				local subpropFrame2 = function ( subprop, event )
					if not event.interrupted then
						subprop:beginAnimation( "keyframe", 5050, false, false, CoD.TweenType.Linear )
					end
					subprop:setZRot( 360 )
					if event.interrupted then
						self.clipFinished( subprop, event )
					else
						subprop:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				subprop:completeAnimation()
				self.subprop:setZRot( 0 )
				subpropFrame2( subprop, {} )

				self.nextClip = "DefaultClip"
			end
		}
	}
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
