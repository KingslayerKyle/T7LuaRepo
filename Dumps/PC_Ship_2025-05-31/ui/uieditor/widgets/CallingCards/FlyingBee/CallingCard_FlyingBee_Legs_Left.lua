require( "ui.uieditor.widgets.CallingCards.FlyingBee.CallingCard_FlyingBee_Leg_Hind_Left" )
require( "ui.uieditor.widgets.CallingCards.FlyingBee.CallingCard_FlyingBee_Leg_Mid" )

CoD.CallingCard_FlyingBee_Legs_Left = InheritFrom( LUI.UIElement )
CoD.CallingCard_FlyingBee_Legs_Left.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.CallingCard_FlyingBee_Legs_Left )
	self.id = "CallingCard_FlyingBee_Legs_Left"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 32 )
	self:setTopBottom( true, false, 0, 32 )
	self.anyChildUsesUpdateState = true
	
	local Hind = CoD.CallingCard_FlyingBee_Leg_Hind_Left.new( menu, controller )
	Hind:setLeftRight( true, false, 0, 32 )
	Hind:setTopBottom( true, false, 0, 32 )
	self:addElement( Hind )
	self.Hind = Hind
	
	local Mid = CoD.CallingCard_FlyingBee_Leg_Mid.new( menu, controller )
	Mid:setLeftRight( true, false, -11, 21 )
	Mid:setTopBottom( true, false, -3.5, 28.5 )
	self:addElement( Mid )
	self.Mid = Mid
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				local HindFrame2 = function ( Hind, event )
					local HindFrame3 = function ( Hind, event )
						if not event.interrupted then
							Hind:beginAnimation( "keyframe", 159, false, false, CoD.TweenType.Linear )
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
						Hind:beginAnimation( "keyframe", 219, false, false, CoD.TweenType.Linear )
						Hind:setZRot( 4 )
						Hind:registerEventHandler( "transition_complete_keyframe", HindFrame3 )
					end
				end
				
				Hind:completeAnimation()
				self.Hind:setZRot( 0 )
				HindFrame2( Hind, {} )
				local MidFrame2 = function ( Mid, event )
					local MidFrame3 = function ( Mid, event )
						if not event.interrupted then
							Mid:beginAnimation( "keyframe", 199, false, true, CoD.TweenType.Linear )
						end
						Mid:setZRot( 0 )
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
						Mid:beginAnimation( "keyframe", 180, false, false, CoD.TweenType.Linear )
						Mid:setZRot( 9 )
						Mid:registerEventHandler( "transition_complete_keyframe", MidFrame3 )
					end
				end
				
				Mid:completeAnimation()
				self.Mid:setZRot( 0 )
				MidFrame2( Mid, {} )
				self.nextClip = "DefaultClip"
			end
		}
	}
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.Hind:close()
		element.Mid:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

