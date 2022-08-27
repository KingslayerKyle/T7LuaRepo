-- b2afab892666eaab484c35ec25723c9f
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.HUD.Equipment.EMP.EmpRebootIndicatorWidget" )
require( "ui.uieditor.widgets.HUD.Equipment.EMP.EmpRebootElectromagneticWidget" )

local PostLoadFunc = function ( f1_arg0 )
	f1_arg0.EmpRebootIndicatorWidget.ProgressBar:subscribeToElementModel( f1_arg0, "startTime", function ( f2_arg0 )
		local f2_local0 = Engine.GetModel( f1_arg0:getModel(), "endTime" )
		local f2_local1 = Engine.GetModelValue( f2_arg0 )
		local f2_local2 = Engine.GetModelValue( f2_local0 ) - f2_local1
		f1_arg0.EmpRebootIndicatorWidget.ProgressBar:setShaderVector( 0, (Engine.CurrentGameTime() - Engine.SnapshotDeltaTime() - f2_local1) / f2_local2, 0, 0, 0 )
		f1_arg0.EmpRebootIndicatorWidget.ProgressBar:beginAnimation( "updateProgress", f2_local2 )
		f1_arg0.EmpRebootIndicatorWidget.ProgressBar:setShaderVector( 0, 1, 0, 0, 0 )
	end )
end

LUI.createMenu.EmpRebootIndicator = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "EmpRebootIndicator" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "HUD"
	self:setOwner( controller )
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, true, 0, 0 )
	self:playSound( "menu_open", controller )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "EmpRebootIndicator.buttonPrompts" )
	local f3_local1 = self
	self.anyChildUsesUpdateState = true
	
	local EmpRebootIndicatorWidget = CoD.EmpRebootIndicatorWidget.new( f3_local1, controller )
	EmpRebootIndicatorWidget:setLeftRight( true, false, 585.12, 694.88 )
	EmpRebootIndicatorWidget:setTopBottom( true, false, 594.75, 622.48 )
	self:addElement( EmpRebootIndicatorWidget )
	self.EmpRebootIndicatorWidget = EmpRebootIndicatorWidget
	
	local EmpRebootElectromagneticWidget0 = CoD.EmpRebootElectromagneticWidget.new( f3_local1, controller )
	EmpRebootElectromagneticWidget0:setLeftRight( true, false, 264.38, 1015.62 )
	EmpRebootElectromagneticWidget0:setTopBottom( true, false, 545.67, 594.75 )
	self:addElement( EmpRebootElectromagneticWidget0 )
	self.EmpRebootElectromagneticWidget0 = EmpRebootElectromagneticWidget0
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				EmpRebootIndicatorWidget:completeAnimation()
				self.EmpRebootIndicatorWidget:setAlpha( 1 )
				self.clipFinished( EmpRebootIndicatorWidget, {} )
				EmpRebootElectromagneticWidget0:completeAnimation()
				self.EmpRebootElectromagneticWidget0:setAlpha( 1 )
				self.clipFinished( EmpRebootElectromagneticWidget0, {} )
			end,
			Boot = function ()
				self:setupElementClipCounter( 2 )
				local EmpRebootIndicatorWidgetFrame2 = function ( EmpRebootIndicatorWidget, event )
					if not event.interrupted then
						EmpRebootIndicatorWidget:beginAnimation( "keyframe", 400, true, false, CoD.TweenType.Bounce )
					end
					EmpRebootIndicatorWidget:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( EmpRebootIndicatorWidget, event )
					else
						EmpRebootIndicatorWidget:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				EmpRebootIndicatorWidget:completeAnimation()
				self.EmpRebootIndicatorWidget:setAlpha( 0 )
				EmpRebootIndicatorWidgetFrame2( EmpRebootIndicatorWidget, {} )
				local EmpRebootElectromagneticWidget0Frame2 = function ( EmpRebootElectromagneticWidget0, event )
					if not event.interrupted then
						EmpRebootElectromagneticWidget0:beginAnimation( "keyframe", 400, true, false, CoD.TweenType.Bounce )
					end
					EmpRebootElectromagneticWidget0:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( EmpRebootElectromagneticWidget0, event )
					else
						EmpRebootElectromagneticWidget0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				EmpRebootElectromagneticWidget0:completeAnimation()
				self.EmpRebootElectromagneticWidget0:setAlpha( 0 )
				EmpRebootElectromagneticWidget0Frame2( EmpRebootElectromagneticWidget0, {} )
			end
		},
		Invisible = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				EmpRebootIndicatorWidget:completeAnimation()
				self.EmpRebootIndicatorWidget:setAlpha( 0 )
				self.clipFinished( EmpRebootIndicatorWidget, {} )
				EmpRebootElectromagneticWidget0:completeAnimation()
				self.EmpRebootElectromagneticWidget0:setAlpha( 0 )
				self.clipFinished( EmpRebootElectromagneticWidget0, {} )
			end
		},
		InvisibleForKillcamEntity = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				EmpRebootIndicatorWidget:completeAnimation()
				self.EmpRebootIndicatorWidget:setAlpha( 0 )
				self.clipFinished( EmpRebootIndicatorWidget, {} )
				EmpRebootElectromagneticWidget0:completeAnimation()
				self.EmpRebootElectromagneticWidget0:setAlpha( 0 )
				self.clipFinished( EmpRebootElectromagneticWidget0, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "Invisible",
			condition = function ( menu, element, event )
				local f10_local0 = Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_IN_GUIDED_MISSILE )
				if not f10_local0 then
					f10_local0 = Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_IN_VEHICLE )
					if not f10_local0 then
						f10_local0 = Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_MIGRATING_HOST )
						if not f10_local0 then
							f10_local0 = Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_SELECTING_LOCATIONAL_KILLSTREAK )
							if not f10_local0 then
								f10_local0 = Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_UI_ACTIVE )
							end
						end
					end
				end
				return f10_local0
			end
		},
		{
			stateName = "InvisibleForKillcamEntity",
			condition = function ( menu, element, event )
				return IsModelValueTrue( controller, "hudItems.killCamHideEmpReboot" )
			end
		}
	} )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IN_GUIDED_MISSILE ), function ( model )
		f3_local1:updateElementState( self, {
			name = "model_validation",
			menu = f3_local1,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IN_GUIDED_MISSILE
		} )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IN_VEHICLE ), function ( model )
		f3_local1:updateElementState( self, {
			name = "model_validation",
			menu = f3_local1,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IN_VEHICLE
		} )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_MIGRATING_HOST ), function ( model )
		f3_local1:updateElementState( self, {
			name = "model_validation",
			menu = f3_local1,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_MIGRATING_HOST
		} )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_SELECTING_LOCATIONAL_KILLSTREAK ), function ( model )
		f3_local1:updateElementState( self, {
			name = "model_validation",
			menu = f3_local1,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_SELECTING_LOCATIONAL_KILLSTREAK
		} )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_UI_ACTIVE ), function ( model )
		f3_local1:updateElementState( self, {
			name = "model_validation",
			menu = f3_local1,
			modelValue = Engine.GetModelValue( model ),
			modelName = "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_UI_ACTIVE
		} )
	end )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "hudItems.killCamHideEmpReboot" ), function ( model )
		f3_local1:updateElementState( self, {
			name = "model_validation",
			menu = f3_local1,
			modelValue = Engine.GetModelValue( model ),
			modelName = "hudItems.killCamHideEmpReboot"
		} )
	end )
	self:registerEventHandler( "menu_loaded", function ( element, event )
		local f18_local0 = nil
		PlayClip( self, "Boot", controller )
		if not f18_local0 then
			f18_local0 = element:dispatchEventToChildren( event )
		end
		return f18_local0
	end )
	self:processEvent( {
		name = "menu_loaded",
		controller = controller
	} )
	self:processEvent( {
		name = "update_state",
		menu = f3_local1
	} )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.EmpRebootIndicatorWidget:close()
		element.EmpRebootElectromagneticWidget0:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "EmpRebootIndicator.buttonPrompts" ) )
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	
	return self
end

