require( "ui.uieditor.widgets.CPLevels.RamsesStation.NasserInterviewMeterStencil" )

CoD.NasserInterviewMeter = InheritFrom( LUI.UIElement )
CoD.NasserInterviewMeter.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.NasserInterviewMeter )
	self.id = "NasserInterviewMeter"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 37 )
	self:setTopBottom( true, false, 0, 190 )
	
	local MeterDot = LUI.UIImage.new()
	MeterDot:setLeftRight( false, false, -2.5, 2.5 )
	MeterDot:setTopBottom( true, false, 16.5, 21.5 )
	MeterDot:setRGB( 1, 1, 1 )
	MeterDot:setImage( RegisterImage( "uie_img_t7_hud_cp_biometrics_meterpoint" ) )
	MeterDot:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( MeterDot )
	self.MeterDot = MeterDot
	
	local MeterOrbit = LUI.UIImage.new()
	MeterOrbit:setLeftRight( false, false, -18.5, 18.5 )
	MeterOrbit:setTopBottom( true, false, 0, 37 )
	MeterOrbit:setRGB( 1, 1, 1 )
	MeterOrbit:setImage( RegisterImage( "uie_img_t7_hud_cp_biometrics_meterorbit" ) )
	MeterOrbit:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( MeterOrbit )
	self.MeterOrbit = MeterOrbit
	
	local NasserInterviewMeterStencil = CoD.NasserInterviewMeterStencil.new( menu, controller )
	NasserInterviewMeterStencil:setLeftRight( false, false, -2.5, 2.5 )
	NasserInterviewMeterStencil:setTopBottom( true, true, 19, 0 )
	NasserInterviewMeterStencil:setRGB( 1, 1, 1 )
	self:addElement( NasserInterviewMeterStencil )
	self.NasserInterviewMeterStencil = NasserInterviewMeterStencil
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				local MeterOrbitFrame2 = function ( MeterOrbit, event )
					if not event.interrupted then
						MeterOrbit:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Linear )
					end
					MeterOrbit:setZRot( -360 )
					if event.interrupted then
						self.clipFinished( MeterOrbit, event )
					else
						MeterOrbit:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				MeterOrbit:completeAnimation()
				self.MeterOrbit:setZRot( 0 )
				MeterOrbitFrame2( MeterOrbit, {} )
				self.nextClip = "DefaultClip"
			end
		}
	}
	self.close = function ( self )
		self.NasserInterviewMeterStencil:close()
		CoD.NasserInterviewMeter.super.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

