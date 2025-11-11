require( "ui.uieditor.widgets.StartGameFlow.LoadingScreenTalkerContainerCPZM" )

local PostLoadFunc = function ( self, controller )
	self.LoadingScreenTalkerContainerCPZM:linkToElementModel( self, "playerxuid", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			self.LoadingScreenTalkerContainerCPZM:setupShowIfXUIDTalking( modelValue )
		end
	end )
end

CoD.LoadingScreenTalkerWidgetCPZM = InheritFrom( LUI.UIElement )
CoD.LoadingScreenTalkerWidgetCPZM.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.LoadingScreenTalkerWidgetCPZM )
	self.id = "LoadingScreenTalkerWidgetCPZM"
	self.soundSet = "default"
	self:setLeftRight( 0, 0, 0, 285 )
	self:setTopBottom( 0, 0, 0, 27 )
	
	local LoadingScreenTalkerContainerCPZM = CoD.LoadingScreenTalkerContainerCPZM.new( menu, controller )
	LoadingScreenTalkerContainerCPZM:setLeftRight( 0, 0, -0.5, 284.5 )
	LoadingScreenTalkerContainerCPZM:setTopBottom( 0, 0, 0, 26 )
	LoadingScreenTalkerContainerCPZM:linkToElementModel( self, nil, false, function ( model )
		LoadingScreenTalkerContainerCPZM:setModel( model, controller )
	end )
	self:addElement( LoadingScreenTalkerContainerCPZM )
	self.LoadingScreenTalkerContainerCPZM = LoadingScreenTalkerContainerCPZM
	
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.LoadingScreenTalkerContainerCPZM:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

