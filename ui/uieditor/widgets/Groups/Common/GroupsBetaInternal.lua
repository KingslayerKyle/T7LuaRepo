-- d09e36ac77ee6a3cfe5980b92b7bfc97
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.Groups.Common.GroupsBetaBacking" )

CoD.GroupsBetaInternal = InheritFrom( LUI.UIElement )
CoD.GroupsBetaInternal.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.GroupsBetaInternal )
	self.id = "GroupsBetaInternal"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 200 )
	self:setTopBottom( true, false, 0, 22 )
	self.anyChildUsesUpdateState = true
	
	local GroupsBetaBacking = CoD.GroupsBetaBacking.new( menu, controller )
	GroupsBetaBacking:setLeftRight( true, true, 0, 0 )
	GroupsBetaBacking:setTopBottom( true, true, 0, 0 )
	self:addElement( GroupsBetaBacking )
	self.GroupsBetaBacking = GroupsBetaBacking
	
	local Label = LUI.UIText.new()
	Label:setLeftRight( true, true, 5, -7 )
	Label:setTopBottom( false, false, -9, 11 )
	Label:setText( LocalizeToUpperString( "GROUPS_BETA" ) )
	Label:setTTF( "fonts/FoundryGridnik-Bold.ttf" )
	Label:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_RIGHT )
	Label:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	LUI.OverrideFunction_CallOriginalFirst( Label, "setText", function ( element, controller )
		ScaleWidgetToLabelRightAligned( self, element, 0 )
	end )
	self:addElement( Label )
	self.Label = Label
	
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.GroupsBetaBacking:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

