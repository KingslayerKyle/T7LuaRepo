require( "ui.uieditor.widgets.Lobby.Common.FE_Menu_LeftGraphics" )

CoD.cac_ElemsSideList = InheritFrom( LUI.UIElement )
CoD.cac_ElemsSideList.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.cac_ElemsSideList )
	self.id = "cac_ElemsSideList"
	self.soundSet = "CAC_PrimaryWeapon"
	self:setLeftRight( true, false, 0, 68 )
	self:setTopBottom( true, false, 0, 670 )
	self.anyChildUsesUpdateState = true
	
	local LineSide = LUI.UIImage.new()
	LineSide:setLeftRight( true, false, 30, 38 )
	LineSide:setTopBottom( true, false, 0, 670 )
	LineSide:setAlpha( 0 )
	LineSide:setImage( RegisterImage( "uie_t7_menu_frontend_lineside" ) )
	LineSide:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( LineSide )
	self.LineSide = LineSide
	
	local FEMenuLeftGraphics = CoD.FE_Menu_LeftGraphics.new( menu, controller )
	FEMenuLeftGraphics:setLeftRight( true, false, 19, 71 )
	FEMenuLeftGraphics:setTopBottom( true, false, 86, 703.25 )
	self:addElement( FEMenuLeftGraphics )
	self.FEMenuLeftGraphics = FEMenuLeftGraphics
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				LineSide:completeAnimation()
				self.LineSide:setAlpha( 0 )
				self.clipFinished( LineSide, {} )
			end
		}
	}
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.FEMenuLeftGraphics:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

