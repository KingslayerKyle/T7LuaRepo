-- c0e63b0f2e786caa9054d74e31b2a77f
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.BorderBakedSolid" )

CoD.GroupsTooltip = InheritFrom( LUI.UIElement )
CoD.GroupsTooltip.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.GroupsTooltip )
	self.id = "GroupsTooltip"
	self.soundSet = "HUD"
	self:setLeftRight( true, false, 0, 338 )
	self:setTopBottom( true, false, 0, 195 )
	self.anyChildUsesUpdateState = true
	
	local BorderBakedSolid00 = CoD.BorderBakedSolid.new( menu, controller )
	BorderBakedSolid00:setLeftRight( true, true, 0, 0 )
	BorderBakedSolid00:setTopBottom( true, true, 0, 0 )
	self:addElement( BorderBakedSolid00 )
	self.BorderBakedSolid00 = BorderBakedSolid00
	
	local TooltipTitle = LUI.UITightText.new()
	TooltipTitle:setLeftRight( true, false, 12, 326 )
	TooltipTitle:setTopBottom( true, false, 8, 33 )
	TooltipTitle:setRGB( 1, 0.6, 0 )
	TooltipTitle:setTTF( "fonts/escom.ttf" )
	TooltipTitle:subscribeToGlobalModel( controller, "CreateGroup", "tooltip_title", function ( model )
		local tooltipTitle = Engine.GetModelValue( model )
		if tooltipTitle then
			TooltipTitle:setText( Engine.Localize( tooltipTitle ) )
		end
	end )
	self:addElement( TooltipTitle )
	self.TooltipTitle = TooltipTitle
	
	local TooltipDescription = LUI.UIText.new()
	TooltipDescription:setLeftRight( true, false, 12, 326 )
	TooltipDescription:setTopBottom( true, false, 34, 54 )
	TooltipDescription:setTTF( "fonts/default.ttf" )
	TooltipDescription:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	TooltipDescription:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	TooltipDescription:subscribeToGlobalModel( controller, "CreateGroup", "tooltip_description", function ( model )
		local tooltipDescription = Engine.GetModelValue( model )
		if tooltipDescription then
			TooltipDescription:setText( Engine.Localize( tooltipDescription ) )
		end
	end )
	self:addElement( TooltipDescription )
	self.TooltipDescription = TooltipDescription
	
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.BorderBakedSolid00:close()
		element.TooltipTitle:close()
		element.TooltipDescription:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
