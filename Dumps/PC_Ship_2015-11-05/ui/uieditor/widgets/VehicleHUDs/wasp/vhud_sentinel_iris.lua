require( "ui.uieditor.widgets.VehicleHUDs.Ground.VehicleGround_VignetteContainer" )
require( "ui.uieditor.widgets.VehicleHUDs.Ground.VehicleGround_Iris" )

CoD.vhud_sentinel_iris = InheritFrom( LUI.UIElement )
CoD.vhud_sentinel_iris.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.vhud_sentinel_iris )
	self.id = "vhud_sentinel_iris"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 1685 )
	self:setTopBottom( true, false, 0, 950 )
	self.anyChildUsesUpdateState = true
	
	local vignetteCenter = LUI.UIImage.new()
	vignetteCenter:setLeftRight( true, true, 0, 0 )
	vignetteCenter:setTopBottom( true, true, 0, 0 )
	vignetteCenter:setAlpha( 0.3 )
	vignetteCenter:setImage( RegisterImage( "uie_t7_cp_hud_vehicle_agr_backgroundtint" ) )
	self:addElement( vignetteCenter )
	self.vignetteCenter = vignetteCenter
	
	local VignetteR1 = LUI.UIImage.new()
	VignetteR1:setLeftRight( false, true, -579.81, -255.05 )
	VignetteR1:setTopBottom( false, false, -360, 360 )
	VignetteR1:setAlpha( 0.15 )
	VignetteR1:setImage( RegisterImage( "uie_t7_cp_hud_vehicle_wasp_reticlevignetteblackblur" ) )
	self:addElement( VignetteR1 )
	self.VignetteR1 = VignetteR1
	
	local VignetteL1 = LUI.UIImage.new()
	VignetteL1:setLeftRight( true, false, 252.49, 577.25 )
	VignetteL1:setTopBottom( false, false, -360, 360 )
	VignetteL1:setAlpha( 0.15 )
	VignetteL1:setZRot( 180 )
	VignetteL1:setImage( RegisterImage( "uie_t7_cp_hud_vehicle_wasp_reticlevignetteblackblur" ) )
	self:addElement( VignetteL1 )
	self.VignetteL1 = VignetteL1
	
	local VignetteR2 = LUI.UIImage.new()
	VignetteR2:setLeftRight( false, true, -556.81, -152.05 )
	VignetteR2:setTopBottom( false, false, -449, 449 )
	VignetteR2:setAlpha( 0.5 )
	VignetteR2:setImage( RegisterImage( "uie_t7_cp_hud_vehicle_wasp_reticlevignetteblackblur" ) )
	self:addElement( VignetteR2 )
	self.VignetteR2 = VignetteR2
	
	local VignetteL2 = LUI.UIImage.new()
	VignetteL2:setLeftRight( true, false, 150.75, 555.5 )
	VignetteL2:setTopBottom( false, false, -449, 449 )
	VignetteL2:setAlpha( 0.5 )
	VignetteL2:setZRot( 180 )
	VignetteL2:setImage( RegisterImage( "uie_t7_cp_hud_vehicle_wasp_reticlevignetteblackblur" ) )
	self:addElement( VignetteL2 )
	self.VignetteL2 = VignetteL2
	
	local VignetteContainer = CoD.VehicleGround_VignetteContainer.new( menu, controller )
	VignetteContainer:setLeftRight( true, true, 202.5, -202.5 )
	VignetteContainer:setTopBottom( true, true, 115, -115 )
	VignetteContainer:setAlpha( 0 )
	self:addElement( VignetteContainer )
	self.VignetteContainer = VignetteContainer
	
	local VehicleGroundIris = CoD.VehicleGround_Iris.new( menu, controller )
	VehicleGroundIris:setLeftRight( false, false, -640, 640 )
	VehicleGroundIris:setTopBottom( false, false, -360, 360 )
	VehicleGroundIris:setRGB( 1, 0.35, 0.35 )
	VehicleGroundIris:setAlpha( 0 )
	VehicleGroundIris:linkToElementModel( self, nil, false, function ( model )
		VehicleGroundIris:setModel( model, controller )
	end )
	VehicleGroundIris:registerEventHandler( "menu_loaded", function ( element, event )
		local f3_local0 = nil
		PlayClipOnElement( self, {
			elementName = "VehicleGroundIris",
			clipName = "StartUp"
		}, controller )
		if not f3_local0 then
			f3_local0 = element:dispatchEventToChildren( event )
		end
		return f3_local0
	end )
	VehicleGroundIris:mergeStateConditions( {
		{
			stateName = "Zoom",
			condition = function ( menu, element, event )
				return IsSelfModelValueTrue( element, controller, "zoomed" )
			end
		}
	} )
	VehicleGroundIris:linkToElementModel( VehicleGroundIris, "zoomed", true, function ( model )
		menu:updateElementState( VehicleGroundIris, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "zoomed"
		} )
	end )
	self:addElement( VehicleGroundIris )
	self.VehicleGroundIris = VehicleGroundIris
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				VignetteContainer:completeAnimation()
				self.VignetteContainer:setAlpha( 0 )
				self.clipFinished( VignetteContainer, {} )
				VehicleGroundIris:completeAnimation()
				self.VehicleGroundIris:setAlpha( 0 )
				self.clipFinished( VehicleGroundIris, {} )
				self.nextClip = "DefaultClip"
			end
		},
		LeavingOperationZone_CP = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				local VignetteContainerFrame2 = function ( VignetteContainer, event )
					local VignetteContainerFrame3 = function ( VignetteContainer, event )
						local VignetteContainerFrame4 = function ( VignetteContainer, event )
							if not event.interrupted then
								VignetteContainer:beginAnimation( "keyframe", 590, false, false, CoD.TweenType.Linear )
							end
							VignetteContainer:setAlpha( 0.7 )
							if event.interrupted then
								self.clipFinished( VignetteContainer, event )
							else
								VignetteContainer:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							VignetteContainerFrame4( VignetteContainer, event )
							return 
						else
							VignetteContainer:beginAnimation( "keyframe", 919, false, false, CoD.TweenType.Linear )
							VignetteContainer:setAlpha( 0.63 )
							VignetteContainer:registerEventHandler( "transition_complete_keyframe", VignetteContainerFrame4 )
						end
					end
					
					if event.interrupted then
						VignetteContainerFrame3( VignetteContainer, event )
						return 
					else
						VignetteContainer:beginAnimation( "keyframe", 490, false, false, CoD.TweenType.Linear )
						VignetteContainer:setAlpha( 0.8 )
						VignetteContainer:registerEventHandler( "transition_complete_keyframe", VignetteContainerFrame3 )
					end
				end
				
				VignetteContainer:completeAnimation()
				self.VignetteContainer:setAlpha( 0.7 )
				VignetteContainerFrame2( VignetteContainer, {} )
				local VehicleGroundIrisFrame2 = function ( VehicleGroundIris, event )
					local VehicleGroundIrisFrame3 = function ( VehicleGroundIris, event )
						local VehicleGroundIrisFrame4 = function ( VehicleGroundIris, event )
							local VehicleGroundIrisFrame5 = function ( VehicleGroundIris, event )
								local VehicleGroundIrisFrame6 = function ( VehicleGroundIris, event )
									local VehicleGroundIrisFrame7 = function ( VehicleGroundIris, event )
										local VehicleGroundIrisFrame8 = function ( VehicleGroundIris, event )
											if not event.interrupted then
												VehicleGroundIris:beginAnimation( "keyframe", 460, false, false, CoD.TweenType.Linear )
											end
											VehicleGroundIris:setRGB( 1, 0.35, 0.35 )
											VehicleGroundIris:setAlpha( 0.8 )
											if event.interrupted then
												self.clipFinished( VehicleGroundIris, event )
											else
												VehicleGroundIris:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
											end
										end
										
										if event.interrupted then
											VehicleGroundIrisFrame8( VehicleGroundIris, event )
											return 
										else
											VehicleGroundIris:beginAnimation( "keyframe", 49, false, false, CoD.TweenType.Linear )
											VehicleGroundIris:setAlpha( 0.58 )
											VehicleGroundIris:registerEventHandler( "transition_complete_keyframe", VehicleGroundIrisFrame8 )
										end
									end
									
									if event.interrupted then
										VehicleGroundIrisFrame7( VehicleGroundIris, event )
										return 
									else
										VehicleGroundIris:beginAnimation( "keyframe", 180, false, false, CoD.TweenType.Linear )
										VehicleGroundIris:setAlpha( 0.52 )
										VehicleGroundIris:registerEventHandler( "transition_complete_keyframe", VehicleGroundIrisFrame7 )
									end
								end
								
								if event.interrupted then
									VehicleGroundIrisFrame6( VehicleGroundIris, event )
									return 
								else
									VehicleGroundIris:beginAnimation( "keyframe", 209, false, false, CoD.TweenType.Linear )
									VehicleGroundIris:setAlpha( 0.67 )
									VehicleGroundIris:registerEventHandler( "transition_complete_keyframe", VehicleGroundIrisFrame6 )
								end
							end
							
							if event.interrupted then
								VehicleGroundIrisFrame5( VehicleGroundIris, event )
								return 
							else
								VehicleGroundIris:beginAnimation( "keyframe", 420, false, false, CoD.TweenType.Linear )
								VehicleGroundIris:setAlpha( 0.92 )
								VehicleGroundIris:registerEventHandler( "transition_complete_keyframe", VehicleGroundIrisFrame5 )
							end
						end
						
						if event.interrupted then
							VehicleGroundIrisFrame4( VehicleGroundIris, event )
							return 
						else
							VehicleGroundIris:beginAnimation( "keyframe", 60, false, false, CoD.TweenType.Linear )
							VehicleGroundIris:setAlpha( 0.86 )
							VehicleGroundIris:registerEventHandler( "transition_complete_keyframe", VehicleGroundIrisFrame4 )
						end
					end
					
					if event.interrupted then
						VehicleGroundIrisFrame3( VehicleGroundIris, event )
						return 
					else
						VehicleGroundIris:beginAnimation( "keyframe", 620, false, false, CoD.TweenType.Linear )
						VehicleGroundIris:setAlpha( 0.59 )
						VehicleGroundIris:registerEventHandler( "transition_complete_keyframe", VehicleGroundIrisFrame3 )
					end
				end
				
				VehicleGroundIris:completeAnimation()
				self.VehicleGroundIris:setRGB( 1, 0.35, 0.35 )
				self.VehicleGroundIris:setAlpha( 0.8 )
				VehicleGroundIrisFrame2( VehicleGroundIris, {} )
				self.nextClip = "DefaultClip"
			end
		},
		Campaign = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				VignetteContainer:completeAnimation()
				self.VignetteContainer:setAlpha( 0.7 )
				self.clipFinished( VignetteContainer, {} )
				VehicleGroundIris:completeAnimation()
				self.VehicleGroundIris:setAlpha( 0.8 )
				self.clipFinished( VehicleGroundIris, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "LeavingOperationZone_CP",
			condition = function ( menu, element, event )
				return IsCampaign() and IsSelfModelValueTrue( element, controller, "outOfRange" )
			end
		},
		{
			stateName = "Campaign",
			condition = function ( menu, element, event )
				return IsCampaign()
			end
		}
	} )
	self:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyNav" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "lobbyRoot.lobbyNav"
		} )
	end )
	self:linkToElementModel( self, "outOfRange", true, function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "outOfRange"
		} )
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.VignetteContainer:close()
		element.VehicleGroundIris:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

