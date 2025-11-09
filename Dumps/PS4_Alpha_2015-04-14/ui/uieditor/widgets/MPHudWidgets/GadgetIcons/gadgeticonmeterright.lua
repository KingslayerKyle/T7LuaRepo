require( "ui.uieditor.widgets.MPHudWidgets.GadgetIcons.GadgetIcon" )

CoD.GadgetIconMeterRight = InheritFrom( LUI.UIElement )
CoD.GadgetIconMeterRight.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( true )
	self:setClass( CoD.GadgetIconMeterRight )
	self.id = "GadgetIconMeterRight"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 64 )
	self:setTopBottom( true, false, 0, 64 )
	self.anyChildUsesUpdateState = true
	
	local gadgetIcon = CoD.GadgetIcon.new( menu, controller )
	gadgetIcon:setLeftRight( true, false, 0, 64 )
	gadgetIcon:setTopBottom( true, false, 0, 64 )
	gadgetIcon:setRGB( 1, 1, 1 )
	self:addElement( gadgetIcon )
	self.gadgetIcon = gadgetIcon
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				gadgetIcon:completeAnimation()
				self.gadgetIcon:setAlpha( 0 )
				self.clipFinished( gadgetIcon, {} )
			end
		},
		Visible = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				gadgetIcon:completeAnimation()
				self.gadgetIcon:setAlpha( 1 )
				self.clipFinished( gadgetIcon, {} )
			end
		},
		Flicker = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				local gadgetIconFrame2 = function ( gadgetIcon, event )
					local gadgetIconFrame3 = function ( gadgetIcon, event )
						if not event.interrupted then
							gadgetIcon:beginAnimation( "keyframe", 400, false, false, CoD.TweenType.Linear )
						end
						gadgetIcon:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( gadgetIcon, event )
						else
							gadgetIcon:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						gadgetIconFrame3( gadgetIcon, event )
						return 
					else
						gadgetIcon:beginAnimation( "keyframe", 400, false, false, CoD.TweenType.Linear )
						gadgetIcon:setAlpha( 0.25 )
						gadgetIcon:registerEventHandler( "transition_complete_keyframe", gadgetIconFrame3 )
					end
				end
				
				gadgetIcon:completeAnimation()
				self.gadgetIcon:setAlpha( 1 )
				gadgetIconFrame2( gadgetIcon, {} )
				self.nextClip = "DefaultClip"
			end
		}
	}
	self.close = function ( self )
		self.gadgetIcon:close()
		CoD.GadgetIconMeterRight.super.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

