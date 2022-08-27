-- 2fbbfbda5f359052b69777c0da6053b6
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.fe_NAT" )
require( "ui.uieditor.widgets.Footer.fe_RightContainer" )
require( "ui.uieditor.widgets.Footer.fe_LeftContainer" )
require( "ui.uieditor.widgets.Footer.fe_InspectionViewButton" )
require( "ui.uieditor.widgets.PC.Utility.StarterPackWatermark" )

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
	self:setLeftRight( true, false, 0, 1280 )
	self:setTopBottom( true, false, 0, 65 )
	self.anyChildUsesUpdateState = true
	
	local feNAT = CoD.fe_NAT.new( menu, controller )
	feNAT:setLeftRight( true, true, 764, -312 )
	feNAT:setTopBottom( false, true, -74, -48 )
	self:addElement( feNAT )
	self.feNAT = feNAT
	
	local blackleftBG = LUI.UIImage.new()
	blackleftBG:setLeftRight( true, true, -123, 131.5 )
	blackleftBG:setTopBottom( false, true, -40, 149 )
	blackleftBG:setRGB( 0, 0, 0 )
	blackleftBG:setAlpha( 0.65 )
	self:addElement( blackleftBG )
	self.blackleftBG = blackleftBG
	
	local LineLeft = LUI.UIImage.new()
	LineLeft:setLeftRight( true, true, -123, 131.5 )
	LineLeft:setTopBottom( false, true, -41.85, -37.85 )
	LineLeft:setAlpha( 0.55 )
	LineLeft:setImage( RegisterImage( "uie_t7_menu_frontend_featuredframeum" ) )
	LineLeft:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( LineLeft )
	self.LineLeft = LineLeft
	
	local feRightContainer = CoD.fe_RightContainer.new( menu, controller )
	feRightContainer:setLeftRight( false, true, -930, -48 )
	feRightContainer:setTopBottom( false, true, -65, -4 )
	feRightContainer:linkToElementModel( self, nil, false, function ( model )
		feRightContainer:setModel( model, controller )
	end )
	self:addElement( feRightContainer )
	self.feRightContainer = feRightContainer
	
	local feLeftContainer = CoD.fe_LeftContainer.new( menu, controller )
	feLeftContainer:setLeftRight( true, false, 15, 342 )
	feLeftContainer:setTopBottom( false, true, -36, 8 )
	feLeftContainer:linkToElementModel( self, nil, false, function ( model )
		feLeftContainer:setModel( model, controller )
	end )
	self:addElement( feLeftContainer )
	self.feLeftContainer = feLeftContainer
	
	local feInspectionViewButton = CoD.fe_InspectionViewButton.new( menu, controller )
	feInspectionViewButton:setLeftRight( false, true, -43, -13 )
	feInspectionViewButton:setTopBottom( false, true, -35, -5 )
	self:addElement( feInspectionViewButton )
	self.feInspectionViewButton = feInspectionViewButton
	
	local StarterPackWatermark = CoD.StarterPackWatermark.new( menu, controller )
	StarterPackWatermark:setLeftRight( true, false, 42, 342 )
	StarterPackWatermark:setTopBottom( false, true, -65, -48 )
	self:addElement( StarterPackWatermark )
	self.StarterPackWatermark = StarterPackWatermark
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )
			end
		}
	}
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.feNAT:close()
		element.feRightContainer:close()
		element.feLeftContainer:close()
		element.feInspectionViewButton:close()
		element.StarterPackWatermark:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

