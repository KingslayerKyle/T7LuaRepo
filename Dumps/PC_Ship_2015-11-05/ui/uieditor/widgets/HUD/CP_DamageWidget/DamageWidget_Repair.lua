require( "ui.uieditor.widgets.HUD.CP_DamageWidget.DamageWidget_RepairMeter" )

CoD.DamageWidget_Repair = InheritFrom( LUI.UIElement )
CoD.DamageWidget_Repair.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.DamageWidget_Repair )
	self.id = "DamageWidget_Repair"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 86 )
	self:setTopBottom( true, false, 0, 97 )
	self.anyChildUsesUpdateState = true
	
	local RepairMeter = CoD.DamageWidget_RepairMeter.new( menu, controller )
	RepairMeter:setLeftRight( true, false, 0, 109 )
	RepairMeter:setTopBottom( true, false, 0, 109 )
	RepairMeter:mergeStateConditions( {
		{
			stateName = "State0",
			condition = function ( menu, element, event )
				return IsModelValueLessThan( controller, "hudItems.regenDelayProgress", 0.2 )
			end
		},
		{
			stateName = "State1",
			condition = function ( menu, element, event )
				return IsModelValueLessThan( controller, "hudItems.regenDelayProgress", 0.4 )
			end
		},
		{
			stateName = "State2",
			condition = function ( menu, element, event )
				return IsModelValueLessThan( controller, "hudItems.regenDelayProgress", 0.6 )
			end
		},
		{
			stateName = "State3",
			condition = function ( menu, element, event )
				return IsModelValueLessThan( controller, "hudItems.regenDelayProgress", 0.8 )
			end
		},
		{
			stateName = "State4",
			condition = function ( menu, element, event )
				return IsModelValueLessThan( controller, "hudItems.regenDelayProgress", 1 )
			end
		},
		{
			stateName = "State5",
			condition = function ( menu, element, event )
				return IsModelValueEqualTo( controller, "hudItems.regenDelayProgress", 1 )
			end
		}
	} )
	RepairMeter:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "hudItems.regenDelayProgress" ), function ( model )
		menu:updateElementState( RepairMeter, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "hudItems.regenDelayProgress"
		} )
	end )
	self:addElement( RepairMeter )
	self.RepairMeter = RepairMeter
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )
			end
		},
		Invisible = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				RepairMeter:completeAnimation()
				self.RepairMeter:setLeftRight( true, false, 14, 95 )
				self.RepairMeter:setTopBottom( true, false, 14, 95 )
				self.RepairMeter:setAlpha( 0 )
				self.clipFinished( RepairMeter, {} )
			end,
			Visible = function ()
				self:setupElementClipCounter( 1 )
				local RepairMeterFrame2 = function ( RepairMeter, event )
					if not event.interrupted then
						RepairMeter:beginAnimation( "keyframe", 300, false, true, CoD.TweenType.Linear )
					end
					RepairMeter:setLeftRight( true, false, 0, 109 )
					RepairMeter:setTopBottom( true, false, 0, 109 )
					RepairMeter:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( RepairMeter, event )
					else
						RepairMeter:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				RepairMeter:completeAnimation()
				self.RepairMeter:setLeftRight( true, false, 14, 95 )
				self.RepairMeter:setTopBottom( true, false, 14, 95 )
				self.RepairMeter:setAlpha( 0 )
				RepairMeterFrame2( RepairMeter, {} )
			end
		},
		Visible = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				RepairMeter:completeAnimation()
				self.RepairMeter:setLeftRight( true, false, 0, 109 )
				self.RepairMeter:setTopBottom( true, false, 0, 109 )
				self.RepairMeter:setAlpha( 1 )
				self.clipFinished( RepairMeter, {} )
			end,
			Invisible = function ()
				self:setupElementClipCounter( 1 )
				local RepairMeterFrame2 = function ( RepairMeter, event )
					if not event.interrupted then
						RepairMeter:beginAnimation( "keyframe", 300, true, false, CoD.TweenType.Linear )
					end
					RepairMeter:setLeftRight( true, false, 14, 95 )
					RepairMeter:setTopBottom( true, false, 14, 95 )
					RepairMeter:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( RepairMeter, event )
					else
						RepairMeter:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				RepairMeter:completeAnimation()
				self.RepairMeter:setLeftRight( true, false, 0, 109 )
				self.RepairMeter:setTopBottom( true, false, 0, 109 )
				self.RepairMeter:setAlpha( 1 )
				RepairMeterFrame2( RepairMeter, {} )
			end
		}
	}
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.RepairMeter:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

