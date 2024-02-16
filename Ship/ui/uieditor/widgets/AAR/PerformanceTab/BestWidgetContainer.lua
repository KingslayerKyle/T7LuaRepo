-- 561c4cbb00518b9f88f75b09d691f979
-- This hash is used for caching, delete to decompile the file again

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
	self:setLeftRight( true, false, 0, 51 )
	self:setTopBottom( true, false, 0, 50 )
	
	local BestIconForKDR = CoD.BestWidget.new( menu, controller )
	BestIconForKDR:setLeftRight( true, false, 0, 51 )
	BestIconForKDR:setTopBottom( true, false, 0, 50 )
	BestIconForKDR:subscribeToGlobalModel( controller, "AARPerformanceTabStats", "showBestKDRIcon", function ( model )
		local showBestKDRIcon = Engine.GetModelValue( model )
		if showBestKDRIcon then
			BestIconForKDR:setAlpha( showBestKDRIcon )
		end
	end )
	self:addElement( BestIconForKDR )
	self.BestIconForKDR = BestIconForKDR
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )
			end
		}
	}

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.BestIconForKDR:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
