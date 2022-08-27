-- a67d043047f5662ba996fe549751b790
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.HUD.CP_DamageWidget.DamageWidget" )

local PreLoadFunc = function ( self, controller )
	local f1_local0 = Engine.GetModel( Engine.GetModelForController( controller ), "hudItems" )
	if Engine.GetModel( f1_local0, "hess2.ratio" ) == nil then
		Engine.SetModelValue( Engine.CreateModel( f1_local0, "hess1.type" ), 0 )
		Engine.SetModelValue( Engine.CreateModel( f1_local0, "hess1.ratio" ), 0.5 )
		Engine.SetModelValue( Engine.CreateModel( f1_local0, "hess2.type" ), 0 )
		Engine.SetModelValue( Engine.CreateModel( f1_local0, "hess2.ratio" ), 0.5 )
	end
end

CoD.DamageWidgetContainer = InheritFrom( LUI.UIElement )
CoD.DamageWidgetContainer.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.DamageWidgetContainer )
	self.id = "DamageWidgetContainer"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 266 )
	self:setTopBottom( true, false, 0, 106 )
	self.anyChildUsesUpdateState = true
	
	local DamageWidget = CoD.DamageWidget.new( menu, controller )
	DamageWidget:setLeftRight( true, false, 0, 266 )
	DamageWidget:setTopBottom( true, false, 0, 106 )
	DamageWidget:setXRot( 15 )
	DamageWidget:setYRot( 30 )
	DamageWidget:mergeStateConditions( {
		{
			stateName = "Invisible",
			condition = function ( menu, element, event )
				return IsModelValueEqualTo( controller, "hudItems.showDamageWidget", false )
			end
		}
	} )
	DamageWidget:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "hudItems.showDamageWidget" ), function ( model )
		menu:updateElementState( DamageWidget, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "hudItems.showDamageWidget"
		} )
	end )
	self:addElement( DamageWidget )
	self.DamageWidget = DamageWidget
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				DamageWidget:completeAnimation()
				self.DamageWidget:setAlpha( 1 )
				self.clipFinished( DamageWidget, {} )
			end,
			WheelHide = function ()
				self:setupElementClipCounter( 1 )
				local DamageWidgetFrame2 = function ( DamageWidget, event )
					if not event.interrupted then
						DamageWidget:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
					end
					DamageWidget:setAlpha( 0.2 )
					if event.interrupted then
						self.clipFinished( DamageWidget, event )
					else
						DamageWidget:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				DamageWidget:completeAnimation()
				self.DamageWidget:setAlpha( 1 )
				DamageWidgetFrame2( DamageWidget, {} )
			end
		},
		WheelHide = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				DamageWidget:completeAnimation()
				self.DamageWidget:setAlpha( 0.2 )
				self.clipFinished( DamageWidget, {} )
			end,
			DefaultState = function ()
				self:setupElementClipCounter( 1 )
				local DamageWidgetFrame2 = function ( DamageWidget, event )
					if not event.interrupted then
						DamageWidget:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
					end
					DamageWidget:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( DamageWidget, event )
					else
						DamageWidget:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				DamageWidget:completeAnimation()
				self.DamageWidget:setAlpha( 0.2 )
				DamageWidgetFrame2( DamageWidget, {} )
			end
		}
	}
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.DamageWidget:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

