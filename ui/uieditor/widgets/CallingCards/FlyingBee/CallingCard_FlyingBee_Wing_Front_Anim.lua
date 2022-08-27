-- ac48a180bde0b76a702623376df76565
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.CallingCards.FlyingBee.CallingCard_FlyingBee_Wing_Front" )

CoD.CallingCard_FlyingBee_Wing_Front_Anim = InheritFrom( LUI.UIElement )
CoD.CallingCard_FlyingBee_Wing_Front_Anim.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.CallingCard_FlyingBee_Wing_Front_Anim )
	self.id = "CallingCard_FlyingBee_Wing_Front_Anim"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 32 )
	self:setTopBottom( true, false, 0, 32 )
	self.anyChildUsesUpdateState = true
	
	local Wing = CoD.CallingCard_FlyingBee_Wing_Front.new( menu, controller )
	Wing:setLeftRight( true, false, 0, 32 )
	Wing:setTopBottom( true, false, 0, 32 )
	Wing:setZRot( 7 )
	self:addElement( Wing )
	self.Wing = Wing
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				local WingFrame2 = function ( Wing, event )
					local WingFrame3 = function ( Wing, event )
						if not event.interrupted then
							Wing:beginAnimation( "keyframe", 59, true, true, CoD.TweenType.Linear )
						end
						Wing:setZRot( 7 )
						if event.interrupted then
							self.clipFinished( Wing, event )
						else
							Wing:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						WingFrame3( Wing, event )
						return 
					else
						Wing:beginAnimation( "keyframe", 70, true, true, CoD.TweenType.Linear )
						Wing:setZRot( -11 )
						Wing:registerEventHandler( "transition_complete_keyframe", WingFrame3 )
					end
				end
				
				Wing:completeAnimation()
				self.Wing:setZRot( 7 )
				WingFrame2( Wing, {} )
				self.nextClip = "DefaultClip"
			end
		}
	}
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.Wing:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

