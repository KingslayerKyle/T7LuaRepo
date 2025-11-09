require( "ui.uieditor.widgets.Groups.Social.GroupsSocialBackgroundWidget" )
require( "ui.uieditor.widgets.Groups.GroupsNoConentDetail" )

CoD.GroupsSocialMainFrameWidgetDisabled = InheritFrom( LUI.UIElement )
CoD.GroupsSocialMainFrameWidgetDisabled.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.GroupsSocialMainFrameWidgetDisabled )
	self.id = "GroupsSocialMainFrameWidgetDisabled"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 1152 )
	self:setTopBottom( true, false, 0, 629 )
	self.anyChildUsesUpdateState = true
	
	local GroupsSocialBackgroundWidget = CoD.GroupsSocialBackgroundWidget.new( menu, controller )
	GroupsSocialBackgroundWidget:setLeftRight( true, false, 413, 940.32 )
	GroupsSocialBackgroundWidget:setTopBottom( true, false, -15, 533 )
	self:addElement( GroupsSocialBackgroundWidget )
	self.GroupsSocialBackgroundWidget = GroupsSocialBackgroundWidget
	
	local GroupsDisabledDurango = CoD.GroupsNoConentDetail.new( menu, controller )
	GroupsDisabledDurango:setLeftRight( true, false, 13, 494 )
	GroupsDisabledDurango:setTopBottom( true, false, 4, 274 )
	GroupsDisabledDurango.HeaderBkgd:setRGB( 0.87, 0.3, 0.19 )
	GroupsDisabledDurango.HeaderIcon:setImage( RegisterImage( "uie_t7_icon_menu_simple_customgames" ) )
	GroupsDisabledDurango.Header:setText( Engine.Localize( "GROUPS_NOT_AVAILABLE" ) )
	GroupsDisabledDurango.Desc:setText( Engine.Localize( "GROUPS_NOT_AVAILABLE_DURANGO_DESC" ) )
	GroupsDisabledDurango.Glow2:setRGB( ColorSet.SelectedGreen.r, ColorSet.SelectedGreen.g, ColorSet.SelectedGreen.b )
	GroupsDisabledDurango:mergeStateConditions( {
		{
			stateName = "Hidden",
			condition = function ( menu, element, event )
				return not IsDurango()
			end
		}
	} )
	self:addElement( GroupsDisabledDurango )
	self.GroupsDisabledDurango = GroupsDisabledDurango
	
	local GroupsDisabledOrbis = CoD.GroupsNoConentDetail.new( menu, controller )
	GroupsDisabledOrbis:setLeftRight( true, false, 13, 494 )
	GroupsDisabledOrbis:setTopBottom( true, false, 4, 274 )
	GroupsDisabledOrbis.HeaderBkgd:setRGB( 0.87, 0.3, 0.19 )
	GroupsDisabledOrbis.HeaderIcon:setImage( RegisterImage( "uie_t7_icon_menu_simple_customgames" ) )
	GroupsDisabledOrbis.Header:setText( Engine.Localize( "GROUPS_NOT_AVAILABLE" ) )
	GroupsDisabledOrbis.Desc:setText( Engine.Localize( "GROUPS_NOT_AVAILABLE_ORBIS_DESC" ) )
	GroupsDisabledOrbis.Glow2:setRGB( ColorSet.SelectedGreen.r, ColorSet.SelectedGreen.g, ColorSet.SelectedGreen.b )
	GroupsDisabledOrbis:mergeStateConditions( {
		{
			stateName = "Hidden",
			condition = function ( menu, element, event )
				return not IsOrbis()
			end
		}
	} )
	self:addElement( GroupsDisabledOrbis )
	self.GroupsDisabledOrbis = GroupsDisabledOrbis
	
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.GroupsSocialBackgroundWidget:close()
		element.GroupsDisabledDurango:close()
		element.GroupsDisabledOrbis:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

