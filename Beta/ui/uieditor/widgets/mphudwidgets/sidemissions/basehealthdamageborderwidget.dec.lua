require( "ui.uieditor.widgets.Border" )

CoD.baseHealthDamageBorderWidget = InheritFrom( LUI.UIElement )
CoD.baseHealthDamageBorderWidget.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.baseHealthDamageBorderWidget )
	self.id = "baseHealthDamageBorderWidget"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 232 )
	self:setTopBottom( true, false, 0, 32 )
	
	local border = CoD.Border.new( menu, controller )
	border:setLeftRight( true, true, 0, 0 )
	border:setTopBottom( true, true, 0, 0 )
	border:setRGB( 0, 0, 0 )
	self:addElement( border )
	self.border = border
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				border:completeAnimation()
				self.border:setRGB( 0, 0, 0 )
				self.clipFinished( border, {} )
			end
		},
		TakingDamage = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				local borderFrame2 = function ( border, event )
					local borderFrame3 = function ( border, event )
						if not event.interrupted then
							border:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
						end
						border:setRGB( 0, 0, 0 )
						if event.interrupted then
							self.clipFinished( border, event )
						else
							border:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						borderFrame3( border, event )
						return 
					else
						border:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
						border:setRGB( 1, 0, 0 )
						border:registerEventHandler( "transition_complete_keyframe", borderFrame3 )
					end
				end
				
				border:completeAnimation()
				self.border:setRGB( 0, 0, 0 )
				borderFrame2( border, {} )
				self.nextClip = "DefaultClip"
			end
		}
	}
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.border:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

