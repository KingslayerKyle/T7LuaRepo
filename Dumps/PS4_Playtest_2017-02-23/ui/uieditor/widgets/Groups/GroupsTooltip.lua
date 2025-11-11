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
	self:setLeftRight( 0, 0, 0, 507 )
	self:setTopBottom( 0, 0, 0, 292 )
	
	local BorderBakedSolid00 = CoD.BorderBakedSolid.new( menu, controller )
	BorderBakedSolid00:setLeftRight( 0, 0, 0, 507 )
	BorderBakedSolid00:setTopBottom( 0, 0, 0, 292 )
	BorderBakedSolid00:setAlpha( 0.8 )
	self:addElement( BorderBakedSolid00 )
	self.BorderBakedSolid00 = BorderBakedSolid00
	
	local TooltipTitle = LUI.UITightText.new()
	TooltipTitle:setLeftRight( 0, 0, 18, 489 )
	TooltipTitle:setTopBottom( 0, 0, 12, 50 )
	TooltipTitle:setRGB( 1, 0.6, 0 )
	TooltipTitle:setTTF( "fonts/escom.ttf" )
	TooltipTitle:subscribeToGlobalModel( controller, "CreateGroup", "tooltip_title", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			TooltipTitle:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( TooltipTitle )
	self.TooltipTitle = TooltipTitle
	
	local TooltipDescription = LUI.UIText.new()
	TooltipDescription:setLeftRight( 0, 0, 18, 489 )
	TooltipDescription:setTopBottom( 0, 0, 51, 81 )
	TooltipDescription:setTTF( "fonts/default.ttf" )
	TooltipDescription:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	TooltipDescription:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	TooltipDescription:subscribeToGlobalModel( controller, "CreateGroup", "tooltip_description", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			TooltipDescription:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( TooltipDescription )
	self.TooltipDescription = TooltipDescription
	
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.BorderBakedSolid00:close()
		self.TooltipTitle:close()
		self.TooltipDescription:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

