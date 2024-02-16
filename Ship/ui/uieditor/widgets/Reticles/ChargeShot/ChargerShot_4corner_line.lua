-- 7f998019c1371b98efaf098141ba94b9
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.Reticles.ChargeShot.ChargeShot_ActiveLine" )

CoD.ChargerShot_4corner_line = InheritFrom( LUI.UIElement )
CoD.ChargerShot_4corner_line.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.ChargerShot_4corner_line )
	self.id = "ChargerShot_4corner_line"
	self.soundSet = "ChooseDecal"
	self:setLeftRight( true, false, 0, 294 )
	self:setTopBottom( true, false, 0, 297 )
	
	local ChargeShotActiveLine3 = CoD.ChargeShot_ActiveLine.new( menu, controller )
	ChargeShotActiveLine3:setLeftRight( false, false, -146.89, -95.89 )
	ChargeShotActiveLine3:setTopBottom( false, false, -148.31, -97.31 )
	ChargeShotActiveLine3:setRGB( 0.29, 0.69, 0.95 )
	self:addElement( ChargeShotActiveLine3 )
	self.ChargeShotActiveLine3 = ChargeShotActiveLine3
	
	local ChargeShotActiveLine1 = CoD.ChargeShot_ActiveLine.new( menu, controller )
	ChargeShotActiveLine1:setLeftRight( false, false, 95.89, 146.89 )
	ChargeShotActiveLine1:setTopBottom( false, false, 97.69, 148.69 )
	ChargeShotActiveLine1:setRGB( 0.29, 0.69, 0.95 )
	ChargeShotActiveLine1:setXRot( -180 )
	ChargeShotActiveLine1:setYRot( 180 )
	self:addElement( ChargeShotActiveLine1 )
	self.ChargeShotActiveLine1 = ChargeShotActiveLine1
	
	local ChargeShotActiveLine10 = CoD.ChargeShot_ActiveLine.new( menu, controller )
	ChargeShotActiveLine10:setLeftRight( false, false, -146.39, -95.39 )
	ChargeShotActiveLine10:setTopBottom( false, false, 97.69, 148.69 )
	ChargeShotActiveLine10:setRGB( 0.29, 0.69, 0.95 )
	ChargeShotActiveLine10:setXRot( 180 )
	self:addElement( ChargeShotActiveLine10 )
	self.ChargeShotActiveLine10 = ChargeShotActiveLine10
	
	local ChargeShotActiveLine11 = CoD.ChargeShot_ActiveLine.new( menu, controller )
	ChargeShotActiveLine11:setLeftRight( false, false, 95.89, 146.89 )
	ChargeShotActiveLine11:setTopBottom( false, false, -148.69, -97.69 )
	ChargeShotActiveLine11:setRGB( 0.29, 0.69, 0.95 )
	ChargeShotActiveLine11:setXRot( 180 )
	ChargeShotActiveLine11:setZRot( 180 )
	self:addElement( ChargeShotActiveLine11 )
	self.ChargeShotActiveLine11 = ChargeShotActiveLine11
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )

				ChargeShotActiveLine11:completeAnimation()
				self.ChargeShotActiveLine11:setAlpha( 1 )
				self.clipFinished( ChargeShotActiveLine11, {} )
			end,
			Fire = function ()
				self:setupElementClipCounter( 4 )

				local ChargeShotActiveLine3Frame2 = function ( ChargeShotActiveLine3, event )
					if not event.interrupted then
						ChargeShotActiveLine3:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
					end
					ChargeShotActiveLine3:setLeftRight( false, false, -67.91, -16.91 )
					ChargeShotActiveLine3:setTopBottom( false, false, -63.83, -12.83 )
					ChargeShotActiveLine3:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( ChargeShotActiveLine3, event )
					else
						ChargeShotActiveLine3:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				ChargeShotActiveLine3:completeAnimation()
				self.ChargeShotActiveLine3:setLeftRight( false, false, -67.91, -16.91 )
				self.ChargeShotActiveLine3:setTopBottom( false, false, -63.83, -12.83 )
				self.ChargeShotActiveLine3:setAlpha( 1 )
				ChargeShotActiveLine3Frame2( ChargeShotActiveLine3, {} )
				ChargeShotActiveLine1:beginAnimation( "keyframe", 389, false, false, CoD.TweenType.Linear )
				ChargeShotActiveLine1:setLeftRight( false, false, 14.16, 65.16 )
				ChargeShotActiveLine1:setTopBottom( false, false, 17.17, 68.17 )
				ChargeShotActiveLine1:setAlpha( 1 )
				ChargeShotActiveLine1:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
				ChargeShotActiveLine10:beginAnimation( "keyframe", 109, false, false, CoD.TweenType.Linear )
				ChargeShotActiveLine10:setLeftRight( false, false, -68.29, -17.29 )
				ChargeShotActiveLine10:setTopBottom( false, false, 17.83, 68.83 )
				ChargeShotActiveLine10:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
				ChargeShotActiveLine11:beginAnimation( "keyframe", 389, false, false, CoD.TweenType.Linear )
				ChargeShotActiveLine11:setLeftRight( false, false, 14.16, 65.16 )
				ChargeShotActiveLine11:setTopBottom( false, false, -63.83, -12.83 )
				ChargeShotActiveLine11:setAlpha( 1 )
				ChargeShotActiveLine11:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
			end,
			Cancel = function ()
				self:setupElementClipCounter( 0 )
			end
		}
	}

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.ChargeShotActiveLine3:close()
		element.ChargeShotActiveLine1:close()
		element.ChargeShotActiveLine10:close()
		element.ChargeShotActiveLine11:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
