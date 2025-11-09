require( "ui.uieditor.widgets.VehicleHUDs.siegebot.vhud_siegebot_reticle" )
require( "ui.uieditor.widgets.VehicleHUDs.siegebot.vhud_siegebot_bootupWidget" )

CoD.vhud_siegebot_internal = InheritFrom( LUI.UIElement )
CoD.vhud_siegebot_internal.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.vhud_siegebot_internal )
	self.id = "vhud_siegebot_internal"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 1280 )
	self:setTopBottom( true, false, 0, 720 )
	self.anyChildUsesUpdateState = true
	
	local vhudsiegebotreticle = CoD.vhud_siegebot_reticle.new( menu, controller )
	vhudsiegebotreticle:setLeftRight( false, false, -640, 640 )
	vhudsiegebotreticle:setTopBottom( false, false, -360, 360 )
	vhudsiegebotreticle:linkToElementModel( self, nil, false, function ( model )
		vhudsiegebotreticle:setModel( model, controller )
	end )
	vhudsiegebotreticle:registerEventHandler( "menu_loaded", function ( element, event )
		local f3_local0 = nil
		PlayClipOnElement( self, {
			elementName = "vhudsiegebotreticle",
			clipName = "StartUp"
		}, controller )
		if not f3_local0 then
			f3_local0 = element:dispatchEventToChildren( event )
		end
		return f3_local0
	end )
	vhudsiegebotreticle:mergeStateConditions( {
		{
			stateName = "Zoom",
			condition = function ( menu, element, event )
				return IsSelfModelValueTrue( element, controller, "zoomed" )
			end
		}
	} )
	vhudsiegebotreticle:linkToElementModel( vhudsiegebotreticle, "zoomed", true, function ( model )
		menu:updateElementState( vhudsiegebotreticle, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "zoomed"
		} )
	end )
	self:addElement( vhudsiegebotreticle )
	self.vhudsiegebotreticle = vhudsiegebotreticle
	
	local vhudsiegebotbootupWidget = CoD.vhud_siegebot_bootupWidget.new( menu, controller )
	vhudsiegebotbootupWidget:setLeftRight( true, false, 0, 640 )
	vhudsiegebotbootupWidget:setTopBottom( true, false, 0, 360 )
	self:addElement( vhudsiegebotbootupWidget )
	self.vhudsiegebotbootupWidget = vhudsiegebotbootupWidget
	
	local vhudsiegebotbootupWidget0 = CoD.vhud_siegebot_bootupWidget.new( menu, controller )
	vhudsiegebotbootupWidget0:setLeftRight( true, false, 0, 640 )
	vhudsiegebotbootupWidget0:setTopBottom( true, false, 360, 720 )
	vhudsiegebotbootupWidget0:setXRot( 180 )
	self:addElement( vhudsiegebotbootupWidget0 )
	self.vhudsiegebotbootupWidget0 = vhudsiegebotbootupWidget0
	
	local vhudsiegebotbootupWidget1 = CoD.vhud_siegebot_bootupWidget.new( menu, controller )
	vhudsiegebotbootupWidget1:setLeftRight( true, false, 640, 1280 )
	vhudsiegebotbootupWidget1:setTopBottom( true, false, 0, 360 )
	vhudsiegebotbootupWidget1:setYRot( 180 )
	self:addElement( vhudsiegebotbootupWidget1 )
	self.vhudsiegebotbootupWidget1 = vhudsiegebotbootupWidget1
	
	local vhudsiegebotbootupWidget2 = CoD.vhud_siegebot_bootupWidget.new( menu, controller )
	vhudsiegebotbootupWidget2:setLeftRight( true, false, 640, 1280 )
	vhudsiegebotbootupWidget2:setTopBottom( true, false, 360, 720 )
	vhudsiegebotbootupWidget2:setXRot( 180 )
	vhudsiegebotbootupWidget2:setYRot( 180 )
	self:addElement( vhudsiegebotbootupWidget2 )
	self.vhudsiegebotbootupWidget2 = vhudsiegebotbootupWidget2
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 5 )
				local vhudsiegebotreticleFrame2 = function ( vhudsiegebotreticle, event )
					local vhudsiegebotreticleFrame3 = function ( vhudsiegebotreticle, event )
						local vhudsiegebotreticleFrame4 = function ( vhudsiegebotreticle, event )
							local vhudsiegebotreticleFrame5 = function ( vhudsiegebotreticle, event )
								local vhudsiegebotreticleFrame6 = function ( vhudsiegebotreticle, event )
									if not event.interrupted then
										vhudsiegebotreticle:beginAnimation( "keyframe", 69, false, false, CoD.TweenType.Linear )
									end
									vhudsiegebotreticle:setAlpha( 1 )
									if event.interrupted then
										self.clipFinished( vhudsiegebotreticle, event )
									else
										vhudsiegebotreticle:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
									end
								end
								
								if event.interrupted then
									vhudsiegebotreticleFrame6( vhudsiegebotreticle, event )
									return 
								else
									vhudsiegebotreticle:beginAnimation( "keyframe", 50, false, false, CoD.TweenType.Linear )
									vhudsiegebotreticle:setAlpha( 0.3 )
									vhudsiegebotreticle:registerEventHandler( "transition_complete_keyframe", vhudsiegebotreticleFrame6 )
								end
							end
							
							if event.interrupted then
								vhudsiegebotreticleFrame5( vhudsiegebotreticle, event )
								return 
							else
								vhudsiegebotreticle:beginAnimation( "keyframe", 69, false, false, CoD.TweenType.Linear )
								vhudsiegebotreticle:setAlpha( 1 )
								vhudsiegebotreticle:registerEventHandler( "transition_complete_keyframe", vhudsiegebotreticleFrame5 )
							end
						end
						
						if event.interrupted then
							vhudsiegebotreticleFrame4( vhudsiegebotreticle, event )
							return 
						else
							vhudsiegebotreticle:beginAnimation( "keyframe", 60, false, false, CoD.TweenType.Linear )
							vhudsiegebotreticle:setAlpha( 0.43 )
							vhudsiegebotreticle:registerEventHandler( "transition_complete_keyframe", vhudsiegebotreticleFrame4 )
						end
					end
					
					if event.interrupted then
						vhudsiegebotreticleFrame3( vhudsiegebotreticle, event )
						return 
					else
						vhudsiegebotreticle:beginAnimation( "keyframe", 159, false, false, CoD.TweenType.Linear )
						vhudsiegebotreticle:setAlpha( 1 )
						vhudsiegebotreticle:registerEventHandler( "transition_complete_keyframe", vhudsiegebotreticleFrame3 )
					end
				end
				
				vhudsiegebotreticle:completeAnimation()
				self.vhudsiegebotreticle:setAlpha( 0 )
				vhudsiegebotreticleFrame2( vhudsiegebotreticle, {} )
				vhudsiegebotbootupWidget:completeAnimation()
				self.vhudsiegebotbootupWidget:setAlpha( 1 )
				self.clipFinished( vhudsiegebotbootupWidget, {} )
				vhudsiegebotbootupWidget0:completeAnimation()
				self.vhudsiegebotbootupWidget0:setAlpha( 1 )
				self.clipFinished( vhudsiegebotbootupWidget0, {} )
				vhudsiegebotbootupWidget1:completeAnimation()
				self.vhudsiegebotbootupWidget1:setAlpha( 1 )
				self.clipFinished( vhudsiegebotbootupWidget1, {} )
				vhudsiegebotbootupWidget2:completeAnimation()
				self.vhudsiegebotbootupWidget2:setAlpha( 1 )
				self.clipFinished( vhudsiegebotbootupWidget2, {} )
			end
		}
	}
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.vhudsiegebotreticle:close()
		element.vhudsiegebotbootupWidget:close()
		element.vhudsiegebotbootupWidget0:close()
		element.vhudsiegebotbootupWidget1:close()
		element.vhudsiegebotbootupWidget2:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

