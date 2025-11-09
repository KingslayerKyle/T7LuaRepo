require( "ui.uieditor.widgets.CallingCards.FlyingBee.CallingCard_FlyingBee_Leg_Mid" )
require( "ui.uieditor.widgets.CallingCards.FlyingBee.CallingCard_FlyingBee_Leg_Hind_Right" )

CoD.CallingCard_FlyingBee_Legs_Right = InheritFrom( LUI.UIElement )
CoD.CallingCard_FlyingBee_Legs_Right.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.CallingCard_FlyingBee_Legs_Right )
	self.id = "CallingCard_FlyingBee_Legs_Right"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 32 )
	self:setTopBottom( true, false, 0, 32 )
	self.anyChildUsesUpdateState = true
	
	local Mid = CoD.CallingCard_FlyingBee_Leg_Mid.new( menu, controller )
	Mid:setLeftRight( true, false, -11, 21 )
	Mid:setTopBottom( true, false, -3.5, 28.5 )
	Mid:setZRot( 3 )
	self:addElement( Mid )
	self.Mid = Mid
	
	local Hind = CoD.CallingCard_FlyingBee_Leg_Hind_Right.new( menu, controller )
	Hind:setLeftRight( true, false, 0, 32 )
	Hind:setTopBottom( true, false, 0, 32 )
	self:addElement( Hind )
	self.Hind = Hind
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				local MidFrame2 = function ( Mid, event )
					local MidFrame3 = function ( Mid, event )
						if not event.interrupted then
							Mid:beginAnimation( "keyframe", 159, false, true, CoD.TweenType.Linear )
						end
						Mid:setZRot( 3 )
						if event.interrupted then
							self.clipFinished( Mid, event )
						else
							Mid:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						MidFrame3( Mid, event )
						return 
					else
						Mid:beginAnimation( "keyframe", 219, false, false, CoD.TweenType.Linear )
						Mid:setZRot( 9 )
						Mid:registerEventHandler( "transition_complete_keyframe", MidFrame3 )
					end
				end
				
				Mid:completeAnimation()
				self.Mid:setZRot( 3 )
				MidFrame2( Mid, {} )
				local HindFrame2 = function ( Hind, event )
					local HindFrame3 = function ( Hind, event )
						if not event.interrupted then
							Hind:beginAnimation( "keyframe", 129, false, false, CoD.TweenType.Linear )
						end
						Hind:setZRot( 0 )
						if event.interrupted then
							self.clipFinished( Hind, event )
						else
							Hind:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						HindFrame3( Hind, event )
						return 
					else
						Hind:beginAnimation( "keyframe", 250, true, true, CoD.TweenType.Linear )
						Hind:setZRot( 6 )
						Hind:registerEventHandler( "transition_complete_keyframe", HindFrame3 )
					end
				end
				
				Hind:completeAnimation()
				self.Hind:setZRot( 0 )
				HindFrame2( Hind, {} )
				self.nextClip = "DefaultClip"
			end
		}
	}
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.Mid:close()
		element.Hind:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

