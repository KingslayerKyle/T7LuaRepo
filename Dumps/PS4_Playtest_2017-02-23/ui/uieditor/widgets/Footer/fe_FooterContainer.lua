require( "ui.uieditor.widgets.fe_NAT" )
require( "ui.uieditor.widgets.Footer.fe_InspectionViewButton" )
require( "ui.uieditor.widgets.Footer.fe_LeftContainer" )
require( "ui.uieditor.widgets.Footer.fe_RightContainer" )

CoD.fe_FooterContainer = InheritFrom( LUI.UIElement )
CoD.fe_FooterContainer.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.fe_FooterContainer )
	self.id = "fe_FooterContainer"
	self.soundSet = "default"
	self:setLeftRight( 0, 0, 0, 1920 )
	self:setTopBottom( 0, 0, 0, 97 )
	self.anyChildUsesUpdateState = true
	
	local feNAT = CoD.fe_NAT.new( menu, controller )
	feNAT:setLeftRight( 0, 1, 1146, -468 )
	feNAT:setTopBottom( 1, 1, -99, -60 )
	self:addElement( feNAT )
	self.feNAT = feNAT
	
	local feRightContainer = CoD.fe_RightContainer.new( menu, controller )
	feRightContainer:setLeftRight( 1, 1, -1395, -72 )
	feRightContainer:setTopBottom( 1, 1, -98, -6 )
	feRightContainer:linkToElementModel( self, nil, false, function ( model )
		feRightContainer:setModel( model, controller )
	end )
	self:addElement( feRightContainer )
	self.feRightContainer = feRightContainer
	
	local feLeftContainer = CoD.fe_LeftContainer.new( menu, controller )
	feLeftContainer:setLeftRight( 0, 0, 23, 513 )
	feLeftContainer:setTopBottom( 1, 1, -54, 12 )
	feLeftContainer:linkToElementModel( self, nil, false, function ( model )
		feLeftContainer:setModel( model, controller )
	end )
	self:addElement( feLeftContainer )
	self.feLeftContainer = feLeftContainer
	
	local feInspectionViewButton = CoD.fe_InspectionViewButton.new( menu, controller )
	feInspectionViewButton:setLeftRight( 1, 1, -64.5, -19.5 )
	feInspectionViewButton:setTopBottom( 1, 1, -52.5, -7.5 )
	self:addElement( feInspectionViewButton )
	self.feInspectionViewButton = feInspectionViewButton
	
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.feNAT:close()
		self.feRightContainer:close()
		self.feLeftContainer:close()
		self.feInspectionViewButton:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

