require( "ui.uieditor.widgets.AAR.PerformanceTab.BestWidget" )

CoD.BestWidgetContainer = InheritFrom( LUI.UIElement )
CoD.BestWidgetContainer.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.BestWidgetContainer )
	self.id = "BestWidgetContainer"
	self.soundSet = "HUD"
	self:setLeftRight( 0, 0, 0, 76 )
	self:setTopBottom( 0, 0, 0, 75 )
	
	local BestIconForKDR = CoD.BestWidget.new( menu, controller )
	BestIconForKDR:setLeftRight( 0, 0, 0, 76 )
	BestIconForKDR:setTopBottom( 0, 0, 0.5, 75.5 )
	BestIconForKDR:subscribeToGlobalModel( controller, "AARPerformanceTabStats", "showBestKDRIcon", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			BestIconForKDR:setAlpha( modelValue )
		end
	end )
	self:addElement( BestIconForKDR )
	self.BestIconForKDR = BestIconForKDR
	
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.BestIconForKDR:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

