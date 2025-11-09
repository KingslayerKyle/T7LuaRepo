require( "ui.uieditor.widgets.BorderBakedMask" )
require( "ui.uieditor.widgets.BorderBakedSolid" )
require( "ui.uieditor.widgets.CAC.MenuChooseClassold.ItemWidgets.BaseItemWidget_old" )
require( "ui.uieditor.widgets.CAC.CustomClassListScreen.CustomClassCategoryHeader" )

CoD.WildcardWidget_old = InheritFrom( LUI.UIElement )
CoD.WildcardWidget_old.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.WildcardWidget_old )
	self.id = "WildcardWidget_old"
	self.soundSet = "CAC"
	self:setLeftRight( true, false, 0, 359 )
	self:setTopBottom( true, false, 0, 108 )
	self.anyChildUsesUpdateState = true
	
	local BorderBakedMask0 = CoD.BorderBakedMask.new( menu, controller )
	BorderBakedMask0:setLeftRight( true, true, 0, 0 )
	BorderBakedMask0:setTopBottom( true, true, 0, 0 )
	BorderBakedMask0:setRGB( 0, 0, 0 )
	BorderBakedMask0:setAlpha( 0.7 )
	self:addElement( BorderBakedMask0 )
	self.BorderBakedMask0 = BorderBakedMask0
	
	local BorderBakedSolid0 = CoD.BorderBakedSolid.new( menu, controller )
	BorderBakedSolid0:setLeftRight( true, true, 0, 0 )
	BorderBakedSolid0:setTopBottom( true, true, 0, 0 )
	BorderBakedSolid0:setRGB( 1, 1, 1 )
	BorderBakedSolid0:setAlpha( 0.25 )
	self:addElement( BorderBakedSolid0 )
	self.BorderBakedSolid0 = BorderBakedSolid0
	
	local wildcard1 = CoD.BaseItemWidget_old.new( menu, controller )
	wildcard1:setLeftRight( false, false, -35, 35 )
	wildcard1:setTopBottom( false, false, -217, -130 )
	wildcard1:setRGB( 1, 1, 1 )
	self:addElement( wildcard1 )
	self.wildcard1 = wildcard1
	
	local wildcard2 = CoD.BaseItemWidget_old.new( menu, controller )
	wildcard2:setLeftRight( false, false, -35, 35 )
	wildcard2:setTopBottom( false, false, -35, 52 )
	wildcard2:setRGB( 1, 1, 1 )
	self:addElement( wildcard2 )
	self.wildcard2 = wildcard2
	
	local wildcard3 = CoD.BaseItemWidget_old.new( menu, controller )
	wildcard3:setLeftRight( false, false, -35, 35 )
	wildcard3:setTopBottom( false, false, 143, 230 )
	wildcard3:setRGB( 1, 1, 1 )
	self:addElement( wildcard3 )
	self.wildcard3 = wildcard3
	
	local headerLabel = CoD.CustomClassCategoryHeader.new( menu, controller )
	headerLabel:setLeftRight( true, true, -3, 4 )
	headerLabel:setTopBottom( true, false, 0, 20 )
	headerLabel:setRGB( 1, 1, 1 )
	headerLabel.text:setText( Engine.Localize( "MENU_WILDCARDS_CAPS" ) )
	self:addElement( headerLabel )
	self.headerLabel = headerLabel
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 6 )
				BorderBakedMask0:completeAnimation()
				self.BorderBakedMask0:setAlpha( 0.7 )
				self.clipFinished( BorderBakedMask0, {} )
				BorderBakedSolid0:completeAnimation()
				self.BorderBakedSolid0:setAlpha( 0.25 )
				self.clipFinished( BorderBakedSolid0, {} )
				wildcard1:completeAnimation()
				self.wildcard1:setLeftRight( false, false, -35, 35 )
				self.wildcard1:setTopBottom( false, false, -217, -130 )
				self.wildcard1:setAlpha( 1 )
				self.clipFinished( wildcard1, {} )
				wildcard2:completeAnimation()
				self.wildcard2:setLeftRight( false, false, -35, 35 )
				self.wildcard2:setTopBottom( false, false, -35, 52 )
				self.wildcard2:setAlpha( 1 )
				self.clipFinished( wildcard2, {} )
				wildcard3:completeAnimation()
				self.wildcard3:setLeftRight( false, false, -35, 35 )
				self.wildcard3:setTopBottom( false, false, 143, 230 )
				self.wildcard3:setAlpha( 1 )
				self.clipFinished( wildcard3, {} )
				headerLabel:completeAnimation()
				self.headerLabel:setAlpha( 1 )
				self.clipFinished( headerLabel, {} )
			end
		},
		NotVisible = {
			DefaultClip = function ()
				self:setupElementClipCounter( 6 )
				BorderBakedMask0:completeAnimation()
				self.BorderBakedMask0:setAlpha( 0.5 )
				self.clipFinished( BorderBakedMask0, {} )
				BorderBakedSolid0:completeAnimation()
				self.BorderBakedSolid0:setAlpha( 0.1 )
				self.clipFinished( BorderBakedSolid0, {} )
				wildcard1:completeAnimation()
				self.wildcard1:setAlpha( 0 )
				self.clipFinished( wildcard1, {} )
				wildcard2:completeAnimation()
				self.wildcard2:setAlpha( 0 )
				self.clipFinished( wildcard2, {} )
				wildcard3:completeAnimation()
				self.wildcard3:setAlpha( 0 )
				self.clipFinished( wildcard3, {} )
				headerLabel:completeAnimation()
				self.headerLabel:setAlpha( 0.4 )
				self.clipFinished( headerLabel, {} )
			end
		}
	}
	self.close = function ( self )
		self.BorderBakedMask0:close()
		self.BorderBakedSolid0:close()
		self.wildcard1:close()
		self.wildcard2:close()
		self.wildcard3:close()
		self.headerLabel:close()
		CoD.WildcardWidget_old.super.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

