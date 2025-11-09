require( "ui.uieditor.widgets.HUD.CP_Prologue.CP_Prologue_FaceScannerWidget" )

LUI.createMenu.SecurityCamera = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "SecurityCamera" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "default"
	self:setOwner( controller )
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, true, 0, 0 )
	self:playSound( "menu_open", controller )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "SecurityCamera.buttonPrompts" )
	self.anyChildUsesUpdateState = true
	
	local CPPrologueFaceScannerWidget0 = CoD.CP_Prologue_FaceScannerWidget.new( self, controller )
	CPPrologueFaceScannerWidget0:setLeftRight( true, false, 937, 1216 )
	CPPrologueFaceScannerWidget0:setTopBottom( true, false, 36, 360 )
	CPPrologueFaceScannerWidget0:mergeStateConditions( {
		{
			stateName = "Scanning",
			condition = function ( menu, element, event )
				return IsSelfModelValueEqualTo( element, controller, "scanning", 1 )
			end
		},
		{
			stateName = "Found",
			condition = function ( menu, element, event )
				return IsSelfModelValueEqualTo( element, controller, "found", 1 )
			end
		},
		{
			stateName = "Failed",
			condition = function ( menu, element, event )
				return IsSelfModelValueEqualTo( element, controller, "failed", 1 )
			end
		}
	} )
	CPPrologueFaceScannerWidget0:linkToElementModel( CPPrologueFaceScannerWidget0, "scanning", true, function ( model )
		self:updateElementState( CPPrologueFaceScannerWidget0, {
			name = "model_validation",
			menu = self,
			modelValue = Engine.GetModelValue( model ),
			modelName = "scanning"
		} )
	end )
	CPPrologueFaceScannerWidget0:linkToElementModel( CPPrologueFaceScannerWidget0, "found", true, function ( model )
		self:updateElementState( CPPrologueFaceScannerWidget0, {
			name = "model_validation",
			menu = self,
			modelValue = Engine.GetModelValue( model ),
			modelName = "found"
		} )
	end )
	CPPrologueFaceScannerWidget0:linkToElementModel( CPPrologueFaceScannerWidget0, "failed", true, function ( model )
		self:updateElementState( CPPrologueFaceScannerWidget0, {
			name = "model_validation",
			menu = self,
			modelValue = Engine.GetModelValue( model ),
			modelName = "failed"
		} )
	end )
	self:addElement( CPPrologueFaceScannerWidget0 )
	self.CPPrologueFaceScannerWidget0 = CPPrologueFaceScannerWidget0
	
	self:processEvent( {
		name = "menu_loaded",
		controller = controller
	} )
	self:processEvent( {
		name = "update_state",
		menu = self
	} )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.CPPrologueFaceScannerWidget0:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "SecurityCamera.buttonPrompts" ) )
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	
	return self
end

