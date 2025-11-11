require( "ui.uieditor.widgets.CAC.cac_ButtonBoxLrgInactiveStroke" )
require( "ui.uieditor.widgets.Lobby.Common.FE_ButtonPanel" )
require( "ui.uieditor.widgets.verticalScrollingTextBox" )

CoD.StartMenu_Options_Network_DescriptionPanels = InheritFrom( LUI.UIElement )
CoD.StartMenu_Options_Network_DescriptionPanels.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.StartMenu_Options_Network_DescriptionPanels )
	self.id = "StartMenu_Options_Network_DescriptionPanels"
	self.soundSet = "default"
	self:setLeftRight( 0, 0, 0, 780 )
	self:setTopBottom( 0, 0, 0, 727 )
	
	local NetworkBox4 = CoD.cac_ButtonBoxLrgInactiveStroke.new( menu, controller )
	NetworkBox4:setLeftRight( 0, 1, 0, 0 )
	NetworkBox4:setTopBottom( 0, 1, 0, 0 )
	self:addElement( NetworkBox4 )
	self.NetworkBox4 = NetworkBox4
	
	local NetworkPanel = CoD.FE_ButtonPanel.new( menu, controller )
	NetworkPanel:setLeftRight( 0, 1, 19, -17 )
	NetworkPanel:setTopBottom( 0, 1, 15, -15 )
	NetworkPanel:setRGB( 0.24, 0.24, 0.26 )
	NetworkPanel:setAlpha( 0.3 )
	self:addElement( NetworkPanel )
	self.NetworkPanel = NetworkPanel
	
	local aboutTitle = LUI.UITightText.new()
	aboutTitle:setLeftRight( 0, 0, 37, 742 )
	aboutTitle:setTopBottom( 0, 0, 30, 69 )
	aboutTitle:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	aboutTitle:linkToElementModel( self, "aboutTitle", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			aboutTitle:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( aboutTitle )
	self.aboutTitle = aboutTitle
	
	local description = CoD.verticalScrollingTextBox.new( menu, controller )
	description:setLeftRight( 0, 0, 37, 742 )
	description:setTopBottom( 0, 0, 74, 698 )
	description.textBox:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	description.textBox:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	description:linkToElementModel( self, "desc", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			description.textBox:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( description )
	self.description = description
	
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.NetworkBox4:close()
		self.NetworkPanel:close()
		self.description:close()
		self.aboutTitle:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

