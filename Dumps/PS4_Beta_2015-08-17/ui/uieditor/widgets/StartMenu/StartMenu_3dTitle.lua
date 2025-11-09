require( "ui.uieditor.widgets.Lobby.Common.FE_TitleLine" )
require( "ui.uieditor.widgets.StartMenu.StartMenu_3dTitleLabel" )

CoD.StartMenu_3dTitle = InheritFrom( LUI.UIElement )
CoD.StartMenu_3dTitle.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.StartMenu_3dTitle )
	self.id = "StartMenu_3dTitle"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 1011 )
	self:setTopBottom( true, false, 0, 51 )
	self.anyChildUsesUpdateState = true
	
	local FETitleLineL = CoD.FE_TitleLine.new( menu, controller )
	FETitleLineL:setLeftRight( true, true, 1, -31 )
	FETitleLineL:setTopBottom( false, false, 23, 27 )
	self:addElement( FETitleLineL )
	self.FETitleLineL = FETitleLineL
	
	local FETitleLineU = CoD.FE_TitleLine.new( menu, controller )
	FETitleLineU:setLeftRight( true, true, 1, -31 )
	FETitleLineU:setTopBottom( false, false, -25, -21 )
	self:addElement( FETitleLineU )
	self.FETitleLineU = FETitleLineU
	
	local StartMenu3dTitleLabel = CoD.StartMenu_3dTitleLabel.new( menu, controller )
	StartMenu3dTitleLabel:setLeftRight( true, false, 1, 1011 )
	StartMenu3dTitleLabel:setTopBottom( true, false, -0.5, 50.5 )
	StartMenu3dTitleLabel.Label0:setText( Engine.Localize( "WILDCARDS" ) )
	self:addElement( StartMenu3dTitleLabel )
	self.StartMenu3dTitleLabel = StartMenu3dTitleLabel
	
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.FETitleLineL:close()
		self.FETitleLineU:close()
		self.StartMenu3dTitleLabel:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

