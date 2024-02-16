-- c7696ad2a05ffa643ea2597fccefcac1
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.StartGameFlow.LoadingScreenTalkerContainerCPZM" )

local PostLoadFunc = function ( f1_arg0, f1_arg1 )
	f1_arg0.LoadingScreenTalkerContainerCPZM:linkToElementModel( f1_arg0, "playerxuid", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			f1_arg0.LoadingScreenTalkerContainerCPZM:setupShowIfXUIDTalking( modelValue )
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
	self:setLeftRight( true, false, 0, 190 )
	self:setTopBottom( true, false, 0, 18 )
	
	local LoadingScreenTalkerContainerCPZM = CoD.LoadingScreenTalkerContainerCPZM.new( menu, controller )
	LoadingScreenTalkerContainerCPZM:setLeftRight( true, false, 0, 190 )
	LoadingScreenTalkerContainerCPZM:setTopBottom( true, false, 0, 17 )
	LoadingScreenTalkerContainerCPZM:linkToElementModel( self, nil, false, function ( model )
		LoadingScreenTalkerContainerCPZM:setModel( model, controller )
	end )
	self:addElement( LoadingScreenTalkerContainerCPZM )
	self.LoadingScreenTalkerContainerCPZM = LoadingScreenTalkerContainerCPZM
	
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.LoadingScreenTalkerContainerCPZM:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
