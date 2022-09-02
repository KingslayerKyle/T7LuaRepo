-- a0787fc75f4648e37002fd2dfbdab27a
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.CallingCards.FlyingBee.CallingCard_FlyingBee_Bee" )

CoD.CallingCard_FlyingBee_Bee_Anim = InheritFrom( LUI.UIElement )
CoD.CallingCard_FlyingBee_Bee_Anim.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.CallingCard_FlyingBee_Bee_Anim )
	self.id = "CallingCard_FlyingBee_Bee_Anim"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 148 )
	self:setTopBottom( true, false, 0, 148 )
	self.anyChildUsesUpdateState = true
	
	local Bee = CoD.CallingCard_FlyingBee_Bee.new( menu, controller )
	Bee:setLeftRight( true, false, 0, 147.67 )
	Bee:setTopBottom( true, false, 0, 148 )
	self:addElement( Bee )
	self.Bee = Bee
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )

				local BeeFrame2 = function ( Bee, event )
					local BeeFrame3 = function ( Bee, event )
						if not event.interrupted then
							Bee:beginAnimation( "keyframe", 300, true, true, CoD.TweenType.Linear )
						end
						Bee:setLeftRight( true, false, 0, 147.67 )
						Bee:setTopBottom( true, false, -1.5, 146.5 )
						if event.interrupted then
							self.clipFinished( Bee, event )
						else
							Bee:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						BeeFrame3( Bee, event )
						return 
					else
						Bee:beginAnimation( "keyframe", 300, true, true, CoD.TweenType.Linear )
						Bee:setTopBottom( true, false, 1.5, 149.5 )
						Bee:registerEventHandler( "transition_complete_keyframe", BeeFrame3 )
					end
				end
				
				Bee:completeAnimation()
				self.Bee:setLeftRight( true, false, 0, 147.67 )
				self.Bee:setTopBottom( true, false, -1.5, 146.5 )
				BeeFrame2( Bee, {} )

				self.nextClip = "DefaultClip"
			end
		}
	}

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.Bee:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

