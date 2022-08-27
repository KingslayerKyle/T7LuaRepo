-- 328e957ce3294d07fd341b49ea2ff5fb
-- This hash is used for caching, delete to decompile the file again

CoD.TextWithDisableState = InheritFrom( LUI.UIElement )
CoD.TextWithDisableState.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( true )
	self:setClass( CoD.TextWithDisableState )
	self.id = "TextWithDisableState"
	self.soundSet = "RaidsPurchases"
	self:setLeftRight( true, false, 0, 312 )
	self:setTopBottom( true, false, 0, 40 )
	
	local Description = LUI.UIText.new()
	Description:setLeftRight( true, true, 0, 0 )
	Description:setTopBottom( true, false, 0, 20 )
	Description:setText( Engine.Localize( "MENU_NEW" ) )
	Description:setTTF( "fonts/default.ttf" )
	Description:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	Description:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( Description )
	self.Description = Description
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				Description:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
				self.Description:setRGB( 1, 1, 1 )
				Description:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
			end,
			Disabled = function ()
				self:setupElementClipCounter( 1 )
				local DescriptionFrame2 = function ( Description, event )
					local DescriptionFrame3 = function ( Description, event )
						if not event.interrupted then
							Description:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
						end
						Description:setRGB( 1, 0, 0 )
						if event.interrupted then
							self.clipFinished( Description, event )
						else
							Description:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						DescriptionFrame3( Description, event )
						return 
					else
						Description:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
						Description:setRGB( 1, 0.21, 0.21 )
						Description:registerEventHandler( "transition_complete_keyframe", DescriptionFrame3 )
					end
				end
				
				Description:completeAnimation()
				self.Description:setRGB( 1, 0, 0 )
				DescriptionFrame2( Description, {} )
				self.nextClip = "Disabled"
			end
		}
	}
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

