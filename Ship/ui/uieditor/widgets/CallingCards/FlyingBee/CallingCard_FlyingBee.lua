-- 55dfd40762dd935c5973f84935472eae
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.CallingCards.FlyingBee.CallingCard_FlyingBee_Bee_Anim" )

CoD.CallingCard_FlyingBee = InheritFrom( LUI.UIElement )
CoD.CallingCard_FlyingBee.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( true )
	self:setClass( CoD.CallingCard_FlyingBee )
	self.id = "CallingCard_FlyingBee"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 480 )
	self:setTopBottom( true, false, 0, 120 )
	self.anyChildUsesUpdateState = true
	
	local BG = LUI.UIImage.new()
	BG:setLeftRight( true, true, -480, 0 )
	BG:setTopBottom( true, true, 0, 0 )
	BG:setImage( RegisterImage( "uie_t7_callingcard_mp_flyingbee_bg" ) )
	self:addElement( BG )
	self.BG = BG
	
	local Gradient = LUI.UIImage.new()
	Gradient:setLeftRight( true, true, 0, 0 )
	Gradient:setTopBottom( true, true, 0, 0 )
	Gradient:setImage( RegisterImage( "uie_t7_callingcard_mp_flyingbee_gradient" ) )
	self:addElement( Gradient )
	self.Gradient = Gradient
	
	local Bee = CoD.CallingCard_FlyingBee_Bee_Anim.new( menu, controller )
	Bee:setLeftRight( true, false, 303, 450.67 )
	Bee:setTopBottom( true, false, -21, 127 )
	self:addElement( Bee )
	self.Bee = Bee
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )

				local BGFrame2 = function ( BG, event )
					if not event.interrupted then
						BG:beginAnimation( "keyframe", 3970, false, false, CoD.TweenType.Linear )
					end
					BG:setLeftRight( true, true, 0, 480 )
					BG:setTopBottom( true, true, 0, 0 )
					if event.interrupted then
						self.clipFinished( BG, event )
					else
						BG:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				BG:completeAnimation()
				self.BG:setLeftRight( true, true, -480, 0 )
				self.BG:setTopBottom( true, true, 0, 0 )
				BGFrame2( BG, {} )

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
