-- 8f03e845249769be8f5bcd73c826dcf9
-- This hash is used for caching, delete to decompile the file again

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
	self:setLeftRight( true, false, 0, 520 )
	self:setTopBottom( true, false, 0, 485 )
	self.anyChildUsesUpdateState = true
	
	local NetworkBox4 = CoD.cac_ButtonBoxLrgInactiveStroke.new( menu, controller )
	NetworkBox4:setLeftRight( true, true, 0, 0 )
	NetworkBox4:setTopBottom( true, true, 0, 0 )
	self:addElement( NetworkBox4 )
	self.NetworkBox4 = NetworkBox4
	
	local NetworkPanel = CoD.FE_ButtonPanel.new( menu, controller )
	NetworkPanel:setLeftRight( true, true, 12.66, -11.4 )
	NetworkPanel:setTopBottom( true, true, 9.94, -9.9 )
	NetworkPanel:setRGB( 0.24, 0.24, 0.26 )
	NetworkPanel:setAlpha( 0.3 )
	self:addElement( NetworkPanel )
	self.NetworkPanel = NetworkPanel
	
	local aboutTitle = LUI.UITightText.new()
	aboutTitle:setLeftRight( true, false, 25, 495 )
	aboutTitle:setTopBottom( true, false, 20, 45.75 )
	aboutTitle:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	aboutTitle:linkToElementModel( self, "aboutTitle", true, function ( model )
		local _aboutTitle = Engine.GetModelValue( model )
		if _aboutTitle then
			aboutTitle:setText( Engine.Localize( _aboutTitle ) )
		end
	end )
	self:addElement( aboutTitle )
	self.aboutTitle = aboutTitle
	
	local description = CoD.verticalScrollingTextBox.new( menu, controller )
	description:setLeftRight( true, false, 25, 495 )
	description:setTopBottom( true, false, 49, 465 )
	description.textBox:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	description.textBox:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	description:linkToElementModel( self, "desc", true, function ( model )
		local desc = Engine.GetModelValue( model )
		if desc then
			description.textBox:setText( Engine.Localize( desc ) )
		end
	end )
	self:addElement( description )
	self.description = description
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )
			end
		}
	}

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.NetworkBox4:close()
		element.NetworkPanel:close()
		element.description:close()
		element.aboutTitle:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
