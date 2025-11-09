require( "ui.uieditor.widgets.fe_NAT" )
require( "ui.uieditor.widgets.Footer.fe_LeftContainer_NOTLobby" )
require( "ui.uieditor.widgets.Footer.fe_RightContainerWithoutRightBoxes" )

CoD.fe_FooterContainer_NOTLobby = InheritFrom( LUI.UIElement )
CoD.fe_FooterContainer_NOTLobby.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.fe_FooterContainer_NOTLobby )
	self.id = "fe_FooterContainer_NOTLobby"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 1280 )
	self:setTopBottom( true, false, 0, 65 )
	self.anyChildUsesUpdateState = true
	
	local feNAT = CoD.fe_NAT.new( menu, controller )
	feNAT:setLeftRight( false, true, -177, -62 )
	feNAT:setTopBottom( false, true, -82.85, -56.85 )
	feNAT:setAlpha( 0 )
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
	
	local feLeftContainer = CoD.fe_LeftContainer_NOTLobby.new( menu, controller )
	feLeftContainer:setLeftRight( true, false, 9, 441 )
	feLeftContainer:setTopBottom( false, true, -51, -7 )
	feLeftContainer:linkToElementModel( self, nil, false, function ( model )
		feLeftContainer:setModel( model, controller )
	end )
	self:addElement( feLeftContainer )
	self.feLeftContainer = feLeftContainer
	
	local feRightContainerWithoutRightBoxes0 = CoD.fe_RightContainerWithoutRightBoxes.new( menu, controller )
	feRightContainerWithoutRightBoxes0:setLeftRight( false, true, -902, -32 )
	feRightContainerWithoutRightBoxes0:setTopBottom( false, true, -36, -4 )
	feRightContainerWithoutRightBoxes0:linkToElementModel( self, nil, false, function ( model )
		feRightContainerWithoutRightBoxes0:setModel( model, controller )
	end )
	self:addElement( feRightContainerWithoutRightBoxes0 )
	self.feRightContainerWithoutRightBoxes0 = feRightContainerWithoutRightBoxes0
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )
			end
		}
	}
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.feNAT:close()
		element.feLeftContainer:close()
		element.feRightContainerWithoutRightBoxes0:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

