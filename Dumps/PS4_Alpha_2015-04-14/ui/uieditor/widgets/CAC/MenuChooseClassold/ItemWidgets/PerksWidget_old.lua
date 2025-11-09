require( "ui.uieditor.widgets.CAC.MenuChooseClassold.ItemWidgets.BaseItemWidget_old" )

CoD.PerksWidget_old = InheritFrom( LUI.UIElement )
CoD.PerksWidget_old.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.PerksWidget_old )
	self.id = "PerksWidget_old"
	self.soundSet = "CAC"
	self:setLeftRight( true, false, 0, 145 )
	self:setTopBottom( true, false, 0, 87 )
	self.anyChildUsesUpdateState = true
	
	local perk = CoD.BaseItemWidget_old.new( menu, controller )
	perk:setLeftRight( true, false, -5, 65 )
	perk:setTopBottom( true, false, 0, 87 )
	perk:setRGB( 1, 1, 1 )
	self:addElement( perk )
	self.perk = perk
	
	local perkPlus = CoD.BaseItemWidget_old.new( menu, controller )
	perkPlus:setLeftRight( true, false, 79, 149 )
	perkPlus:setTopBottom( true, false, 0, 87 )
	perkPlus:setRGB( 1, 1, 1 )
	self:addElement( perkPlus )
	self.perkPlus = perkPlus
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				perk:completeAnimation()
				self.perk:setLeftRight( true, false, 37.5, 107.5 )
				self.perk:setTopBottom( true, false, 0, 87 )
				self.perk:setAlpha( 1 )
				self.clipFinished( perk, {} )
				perkPlus:completeAnimation()
				self.perkPlus:setAlpha( 0 )
				self.clipFinished( perkPlus, {} )
			end
		},
		TwoPerks = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				perk:completeAnimation()
				self.perk:setLeftRight( true, false, 0, 70 )
				self.perk:setTopBottom( true, false, 0, 87 )
				self.perk:setAlpha( 1 )
				self.clipFinished( perk, {} )
				perkPlus:completeAnimation()
				self.perkPlus:setAlpha( 1 )
				self.clipFinished( perkPlus, {} )
			end
		}
	}
	self.close = function ( self )
		self.perk:close()
		self.perkPlus:close()
		CoD.PerksWidget_old.super.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

