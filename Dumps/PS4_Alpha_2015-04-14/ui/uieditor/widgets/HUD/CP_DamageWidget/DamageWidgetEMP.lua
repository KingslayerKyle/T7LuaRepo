local UpdateVisibility = function ( self, event )
	local controller = event.controller
	if Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_HUD_VISIBLE ) and Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_EMP_ACTIVE ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_DEMO_CAMERA_MODE_MOVIECAM ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_DEMO_ALL_GAME_HUD_HIDDEN ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_UI_ACTIVE ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_IN_KILLCAM ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_GAME_ENDED ) and (not CoD.IsShoutcaster( controller ) or CoD.ExeProfileVarBool( controller, "shoutcaster_teamscore" )) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_IN_GUIDED_MISSILE ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_IN_REMOTE_KILLSTREAK_STATIC ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_IN_VEHICLE ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_HUD_HARDCORE ) and CoD.isCampaign ~= true and CoD.FSM_VISIBILITY( controller ) == 0 then
		if not self.visible then
			self:setAlpha( 1 )
			self.visible = true
		end
	elseif self.visible then
		self:setAlpha( 0 )
		self.visible = nil
	end
end

local PostLoadFunc = function ( self, controller )
	self:setAlpha( 0 )
	self:registerEventHandler( "hud_update_refresh", UpdateVisibility )
	local UpdateVisibility_Internal = function ( model )
		UpdateVisibility( self, {
			controller = controller
		} )
	end
	
	local perControllerModel = Engine.GetModelForController( controller )
	self:subscribeToModel( Engine.GetModel( perControllerModel, "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_HUD_VISIBLE ), UpdateVisibility_Internal )
	self:subscribeToModel( Engine.GetModel( perControllerModel, "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_UI_ACTIVE ), UpdateVisibility_Internal )
	self:subscribeToModel( Engine.GetModel( perControllerModel, "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_EMP_ACTIVE ), UpdateVisibility_Internal )
	self:subscribeToModel( Engine.GetModel( perControllerModel, "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_SPECTATING_CLIENT ), UpdateVisibility_Internal )
	self:subscribeToModel( Engine.GetModel( perControllerModel, "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN ), UpdateVisibility_Internal )
	self:subscribeToModel( Engine.GetModel( perControllerModel, "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_GAME_ENDED ), UpdateVisibility_Internal )
	self:subscribeToModel( Engine.GetModel( perControllerModel, "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IN_VEHICLE ), UpdateVisibility_Internal )
	self:subscribeToModel( Engine.GetModel( perControllerModel, "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IN_GUIDED_MISSILE ), UpdateVisibility_Internal )
	self:subscribeToModel( Engine.GetModel( perControllerModel, "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IN_REMOTE_KILLSTREAK_STATIC ), UpdateVisibility_Internal )
	self:subscribeToModel( Engine.GetModel( perControllerModel, "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_DEMO_CAMERA_MODE_MOVIECAM ), UpdateVisibility_Internal )
	self:subscribeToModel( Engine.GetModel( perControllerModel, "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_DEMO_ALL_GAME_HUD_HIDDEN ), UpdateVisibility_Internal )
	self:subscribeToModel( Engine.GetModel( perControllerModel, "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_HUD_HARDCORE ), UpdateVisibility_Internal )
	self:subscribeToModel( Engine.GetModel( perControllerModel, "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_SELECTING_LOCATION ), UpdateVisibility_Internal )
end

CoD.DamageWidgetEMP = InheritFrom( LUI.UIElement )
CoD.DamageWidgetEMP.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.DamageWidgetEMP )
	self.id = "DamageWidgetEMP"
	self.soundSet = "HUD"
	self:setLeftRight( true, false, 0, 341 )
	self:setTopBottom( true, false, 0, 171 )
	
	local EMPScoreInfo0Hess = LUI.UIImage.new()
	EMPScoreInfo0Hess:setLeftRight( true, false, 0, 208 )
	EMPScoreInfo0Hess:setTopBottom( true, false, 21.67, 171 )
	EMPScoreInfo0Hess:setRGB( 1, 1, 1 )
	EMPScoreInfo0Hess:setImage( RegisterImage( "uie_t7_cp_hud_damagewidget_emptub0hess" ) )
	EMPScoreInfo0Hess:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_emp" ) )
	EMPScoreInfo0Hess:setShaderVector( 0, 26, 0, 0, 0 )
	EMPScoreInfo0Hess:setShaderVector( 1, 1, 0, 0, 0 )
	EMPScoreInfo0Hess:setShaderVector( 2, 1, 0, 0, 0 )
	self:addElement( EMPScoreInfo0Hess )
	self.EMPScoreInfo0Hess = EMPScoreInfo0Hess
	
	local EMPScoreInfo1Hess = LUI.UIImage.new()
	EMPScoreInfo1Hess:setLeftRight( true, false, 0, 298.67 )
	EMPScoreInfo1Hess:setTopBottom( true, false, 21.67, 171 )
	EMPScoreInfo1Hess:setRGB( 1, 1, 1 )
	EMPScoreInfo1Hess:setImage( RegisterImage( "uie_t7_cp_hud_damagewidget_emptub1hess" ) )
	EMPScoreInfo1Hess:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_emp" ) )
	EMPScoreInfo1Hess:setShaderVector( 0, 26, 0, 0, 0 )
	EMPScoreInfo1Hess:setShaderVector( 1, 1, 0, 0, 0 )
	EMPScoreInfo1Hess:setShaderVector( 2, 1, 0, 0, 0 )
	self:addElement( EMPScoreInfo1Hess )
	self.EMPScoreInfo1Hess = EMPScoreInfo1Hess
	
	local EMPScoreInfo2Hess = LUI.UIImage.new()
	EMPScoreInfo2Hess:setLeftRight( true, false, 0, 298.67 )
	EMPScoreInfo2Hess:setTopBottom( true, false, 21.67, 171 )
	EMPScoreInfo2Hess:setRGB( 1, 1, 1 )
	EMPScoreInfo2Hess:setImage( RegisterImage( "uie_t7_cp_hud_damagewidget_emptub2hess" ) )
	EMPScoreInfo2Hess:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_emp" ) )
	EMPScoreInfo2Hess:setShaderVector( 0, 26, 0, 0, 0 )
	EMPScoreInfo2Hess:setShaderVector( 1, 1, 0, 0, 0 )
	EMPScoreInfo2Hess:setShaderVector( 2, 1, 0, 0, 0 )
	self:addElement( EMPScoreInfo2Hess )
	self.EMPScoreInfo2Hess = EMPScoreInfo2Hess
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 3 )
				EMPScoreInfo0Hess:completeAnimation()
				self.EMPScoreInfo0Hess:setAlpha( 1 )
				self.clipFinished( EMPScoreInfo0Hess, {} )
				EMPScoreInfo1Hess:completeAnimation()
				self.EMPScoreInfo1Hess:setAlpha( 0 )
				self.clipFinished( EMPScoreInfo1Hess, {} )
				EMPScoreInfo2Hess:completeAnimation()
				self.EMPScoreInfo2Hess:setAlpha( 0 )
				self.clipFinished( EMPScoreInfo2Hess, {} )
			end
		},
		Hess1 = {
			DefaultClip = function ()
				self:setupElementClipCounter( 3 )
				EMPScoreInfo0Hess:completeAnimation()
				self.EMPScoreInfo0Hess:setAlpha( 0 )
				self.clipFinished( EMPScoreInfo0Hess, {} )
				EMPScoreInfo1Hess:completeAnimation()
				self.EMPScoreInfo1Hess:setAlpha( 1 )
				self.clipFinished( EMPScoreInfo1Hess, {} )
				EMPScoreInfo2Hess:completeAnimation()
				self.EMPScoreInfo2Hess:setAlpha( 0 )
				self.clipFinished( EMPScoreInfo2Hess, {} )
			end
		},
		Hess2 = {
			DefaultClip = function ()
				self:setupElementClipCounter( 3 )
				EMPScoreInfo0Hess:completeAnimation()
				self.EMPScoreInfo0Hess:setAlpha( 0 )
				self.clipFinished( EMPScoreInfo0Hess, {} )
				EMPScoreInfo1Hess:completeAnimation()
				self.EMPScoreInfo1Hess:setAlpha( 0 )
				self.clipFinished( EMPScoreInfo1Hess, {} )
				EMPScoreInfo2Hess:completeAnimation()
				self.EMPScoreInfo2Hess:setAlpha( 1 )
				self.clipFinished( EMPScoreInfo2Hess, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "Hess1",
			condition = function ( menu, element, event )
				return HasNumHessActive( controller, 1 )
			end
		},
		{
			stateName = "Hess2",
			condition = function ( menu, element, event )
				return HasNumHessActive( controller, 2 )
			end
		}
	} )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "hudItems.hess1.type" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "hudItems.hess1.type"
		} )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "hudItems.hess2.type" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "hudItems.hess2.type"
		} )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

