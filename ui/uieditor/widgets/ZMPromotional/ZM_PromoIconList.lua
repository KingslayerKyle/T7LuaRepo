-- 78ff054334c0e179775a5513a2f1eb99
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.ZMPromotional.ZM_PromoListItem" )

CoD.ZM_PromoIconList = InheritFrom( LUI.UIElement )
CoD.ZM_PromoIconList.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.ZM_PromoIconList )
	self.id = "ZM_PromoIconList"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 202 )
	self:setTopBottom( true, false, 0, 55 )
	self.anyChildUsesUpdateState = true
	
	local GridLayout0 = LUI.GridLayout.new( menu, controller, false, 0, 0, 2, 0, nil, nil, false, false, 0, 0, false, true )
	GridLayout0:setLeftRight( true, false, 0, 202 )
	GridLayout0:setTopBottom( false, false, -24.5, 24.5 )
	GridLayout0:setWidgetType( CoD.ZM_PromoListItem )
	GridLayout0:setHorizontalCount( 4 )
	GridLayout0:setDataSource( "ZMPromoIconList" )
	self:addElement( GridLayout0 )
	self.GridLayout0 = GridLayout0
	
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.GridLayout0:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

