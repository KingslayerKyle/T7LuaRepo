require( "ui.uieditor.widgets.fe_NAT" )
require( "ui.uieditor.widgets.Footer.fe_LeftContainer_NOTLobby" )
require( "ui.uieditor.widgets.Footer.fe_RightContainerWithHeroesHead" )
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
	self:setLeftRight( 0, 0, 0, 1920 )
	self:setTopBottom( 0, 0, 0, 97 )
	self.anyChildUsesUpdateState = true
	
	local feNAT = CoD.fe_NAT.new( menu, controller )
	feNAT:setLeftRight( 1, 1, -265, -93 )
	feNAT:setTopBottom( 1, 1, -124, -85 )
	feNAT:setAlpha( 0 )
	self:addElement( feNAT )
	self.feNAT = feNAT
	
	local feLeftContainer = CoD.fe_LeftContainer_NOTLobby.new( menu, controller )
	feLeftContainer:setLeftRight( 0, 0, 23, 825 )
	feLeftContainer:setTopBottom( 1, 1, -72, -6 )
	feLeftContainer:linkToElementModel( self, nil, false, function ( model )
		feLeftContainer:setModel( model, controller )
	end )
	self:addElement( feLeftContainer )
	self.feLeftContainer = feLeftContainer
	
	local feRightContainerWithoutRightBoxes0 = CoD.fe_RightContainerWithoutRightBoxes.new( menu, controller )
	feRightContainerWithoutRightBoxes0:setLeftRight( 1, 1, -1352.5, -47.5 )
	feRightContainerWithoutRightBoxes0:setTopBottom( 1, 1, -54, -10 )
	feRightContainerWithoutRightBoxes0:linkToElementModel( self, nil, false, function ( model )
		feRightContainerWithoutRightBoxes0:setModel( model, controller )
	end )
	self:addElement( feRightContainerWithoutRightBoxes0 )
	self.feRightContainerWithoutRightBoxes0 = feRightContainerWithoutRightBoxes0
	
	local feRightContainerWithHeroesHead = CoD.fe_RightContainerWithHeroesHead.new( menu, controller )
	feRightContainerWithHeroesHead:setLeftRight( 1, 1, -1279.5, 25.5 )
	feRightContainerWithHeroesHead:setTopBottom( 1, 1, -58, -10 )
	feRightContainerWithHeroesHead:setAlpha( 0 )
	feRightContainerWithHeroesHead:linkToElementModel( self, nil, false, function ( model )
		feRightContainerWithHeroesHead:setModel( model, controller )
	end )
	self:addElement( feRightContainerWithHeroesHead )
	self.feRightContainerWithHeroesHead = feRightContainerWithHeroesHead
	
	self.resetProperties = function ()
		feRightContainerWithHeroesHead:completeAnimation()
		feRightContainerWithoutRightBoxes0:completeAnimation()
		feRightContainerWithHeroesHead:setLeftRight( 1, 1, -1279.5, 25.5 )
		feRightContainerWithHeroesHead:setTopBottom( 1, 1, -58, -10 )
		feRightContainerWithHeroesHead:setAlpha( 0 )
		feRightContainerWithoutRightBoxes0:setAlpha( 1 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 0 )
			end
		},
		WithHeroesHead = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 2 )
				feRightContainerWithoutRightBoxes0:completeAnimation()
				self.feRightContainerWithoutRightBoxes0:setAlpha( 0 )
				self.clipFinished( feRightContainerWithoutRightBoxes0, {} )
				feRightContainerWithHeroesHead:completeAnimation()
				self.feRightContainerWithHeroesHead:setLeftRight( 1, 1, -1040.5, 264.5 )
				self.feRightContainerWithHeroesHead:setTopBottom( 1, 1, -58, -10 )
				self.feRightContainerWithHeroesHead:setAlpha( 1 )
				self.clipFinished( feRightContainerWithHeroesHead, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "WithHeroesHead",
			condition = function ( menu, element, event )
				return AlwaysFalse()
			end
		}
	} )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.feNAT:close()
		self.feLeftContainer:close()
		self.feRightContainerWithoutRightBoxes0:close()
		self.feRightContainerWithHeroesHead:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

