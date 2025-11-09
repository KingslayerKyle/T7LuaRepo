CoD.AAR_PT_Numbers = InheritFrom( LUI.UIElement )
CoD.AAR_PT_Numbers.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.AAR_PT_Numbers )
	self.id = "AAR_PT_Numbers"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 160 )
	self:setTopBottom( true, false, 0, 70 )
	
	local Numbers = LUI.UIText.new()
	Numbers:setLeftRight( true, false, 18, 178 )
	Numbers:setTopBottom( true, true, 0, 0 )
	Numbers:setRGB( 0.59, 0.64, 0.74 )
	Numbers:setText( Engine.Localize( "XX" ) )
	Numbers:setTTF( "fonts/FoundryGridnik-Bold.ttf" )
	Numbers:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	Numbers:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( Numbers )
	self.Numbers = Numbers
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )
			end,
			Start = function ()
				self:setupElementClipCounter( 1 )
				local NumbersFrame2 = function ( Numbers, event )
					if not event.interrupted then
						Numbers:beginAnimation( "keyframe", 259, false, false, CoD.TweenType.Linear )
					end
					Numbers:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( Numbers, event )
					else
						Numbers:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Numbers:completeAnimation()
				self.Numbers:setAlpha( 0 )
				NumbersFrame2( Numbers, {} )
			end
		}
	}
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

