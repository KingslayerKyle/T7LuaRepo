require( "ui.uieditor.widgets.Lobby.Common.FE_PanelNoBlur" )
require( "ui.uieditor.widgets.Lobby.Common.FE_LabelSubHeadingC" )

CoD.FE_LabelSubHeadingCcontainer = InheritFrom( LUI.UIElement )
CoD.FE_LabelSubHeadingCcontainer.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.FE_LabelSubHeadingCcontainer )
	self.id = "FE_LabelSubHeadingCcontainer"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 210 )
	self:setTopBottom( true, false, 0, 37 )
	
	local FEPanelNoBlur0 = CoD.FE_PanelNoBlur.new( menu, controller )
	FEPanelNoBlur0:setLeftRight( true, true, 0, 0 )
	FEPanelNoBlur0:setTopBottom( false, false, -18, 19 )
	FEPanelNoBlur0:setRGB( 0, 0, 0 )
	FEPanelNoBlur0:setAlpha( 0.2 )
	self:addElement( FEPanelNoBlur0 )
	self.FEPanelNoBlur0 = FEPanelNoBlur0
	
	local FELabelSubHeadingC0 = CoD.FE_LabelSubHeadingC.new( menu, controller )
	FELabelSubHeadingC0:setLeftRight( true, false, 8.89, 203.89 )
	FELabelSubHeadingC0:setTopBottom( true, false, 5, 37 )
	FELabelSubHeadingC0:setRGB( 1, 1, 1 )
	FELabelSubHeadingC0:setAlpha( 0.77 )
	FELabelSubHeadingC0.TextBox2:setRGB( 0.84, 0.86, 0.87 )
	FELabelSubHeadingC0.TextBox2:setText( Engine.Localize( "ZombieSlashers" ) )
	FELabelSubHeadingC0.TextBox2:setTTF( "fonts/Entovo.ttf" )
	self:addElement( FELabelSubHeadingC0 )
	self.FELabelSubHeadingC0 = FELabelSubHeadingC0
	
	self.close = function ( self )
		self.FEPanelNoBlur0:close()
		self.FELabelSubHeadingC0:close()
		CoD.FE_LabelSubHeadingCcontainer.super.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

