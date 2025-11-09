require( "ui.uieditor.widgets.fe_NAT" )
require( "ui.uieditor.widgets.Footer.fe_LeftContainer_NOTLobby" )
require( "ui.uieditor.widgets.Footer.fe_RightContainerWithoutRightBoxes" )
require( "ui.uieditor.widgets.Footer.fe_RightContainerWithHeroesHead" )
require( "ui.uieditor.widgets.PC.Utility.StarterPackWatermark" )

local f0_local0 = function ( f1_arg0, f1_arg1, f1_arg2 )
	f1_arg0:setForceMouseEventDispatch( true )
end

local PostLoadFunc = function ( self, controller, menu )
	if CoD.isPC then
		f0_local0( self, controller, menu )
	end
end

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
	blackleftBG:setAlpha( 0.6 )
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
	feLeftContainer:setLeftRight( true, false, 15, 550 )
	feLeftContainer:setTopBottom( false, true, -48, -4 )
	feLeftContainer:linkToElementModel( self, nil, false, function ( model )
		feLeftContainer:setModel( model, controller )
	end )
	self:addElement( feLeftContainer )
	self.feLeftContainer = feLeftContainer
	
	local feRightContainerWithoutRightBoxes0 = CoD.fe_RightContainerWithoutRightBoxes.new( menu, controller )
	feRightContainerWithoutRightBoxes0:setLeftRight( false, true, -902, -32 )
	feRightContainerWithoutRightBoxes0:setTopBottom( false, true, -36, -7 )
	feRightContainerWithoutRightBoxes0:linkToElementModel( self, nil, false, function ( model )
		feRightContainerWithoutRightBoxes0:setModel( model, controller )
	end )
	self:addElement( feRightContainerWithoutRightBoxes0 )
	self.feRightContainerWithoutRightBoxes0 = feRightContainerWithoutRightBoxes0
	
	local feRightContainerWithHeroesHead = CoD.fe_RightContainerWithHeroesHead.new( menu, controller )
	feRightContainerWithHeroesHead:setLeftRight( false, true, -853, 17 )
	feRightContainerWithHeroesHead:setTopBottom( false, true, -39, -7 )
	feRightContainerWithHeroesHead:setAlpha( 0 )
	feRightContainerWithHeroesHead:linkToElementModel( self, nil, false, function ( model )
		feRightContainerWithHeroesHead:setModel( model, controller )
	end )
	self:addElement( feRightContainerWithHeroesHead )
	self.feRightContainerWithHeroesHead = feRightContainerWithHeroesHead
	
	local StarterPackWatermark = CoD.StarterPackWatermark.new( menu, controller )
	StarterPackWatermark:setLeftRight( true, false, 42, 342 )
	StarterPackWatermark:setTopBottom( false, true, -65, -48 )
	self:addElement( StarterPackWatermark )
	self.StarterPackWatermark = StarterPackWatermark
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				feRightContainerWithoutRightBoxes0:completeAnimation()
				self.feRightContainerWithoutRightBoxes0:setAlpha( 1 )
				self.clipFinished( feRightContainerWithoutRightBoxes0, {} )
				feRightContainerWithHeroesHead:completeAnimation()
				self.feRightContainerWithHeroesHead:setAlpha( 0 )
				self.clipFinished( feRightContainerWithHeroesHead, {} )
			end
		},
		WithHeroesHead = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				feRightContainerWithoutRightBoxes0:completeAnimation()
				self.feRightContainerWithoutRightBoxes0:setAlpha( 0 )
				self.clipFinished( feRightContainerWithoutRightBoxes0, {} )
				feRightContainerWithHeroesHead:completeAnimation()
				self.feRightContainerWithHeroesHead:setLeftRight( false, true, -694, 176 )
				self.feRightContainerWithHeroesHead:setTopBottom( false, true, -39, -7 )
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
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.feNAT:close()
		element.feLeftContainer:close()
		element.feRightContainerWithoutRightBoxes0:close()
		element.feRightContainerWithHeroesHead:close()
		element.StarterPackWatermark:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

