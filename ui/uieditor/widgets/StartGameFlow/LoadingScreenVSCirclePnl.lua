-- 41ca51f9b4512acf8f4a5cc222ed264b
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.StartGameFlow.LoadingScreenVSCirclePnlIntl" )

CoD.LoadingScreenVSCirclePnl = InheritFrom( LUI.UIElement )
CoD.LoadingScreenVSCirclePnl.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.LoadingScreenVSCirclePnl )
	self.id = "LoadingScreenVSCirclePnl"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 90 )
	self:setTopBottom( true, false, 0, 90 )
	self.anyChildUsesUpdateState = true
	
	local LoadingScreenVSCirclePnlIntl = CoD.LoadingScreenVSCirclePnlIntl.new( menu, controller )
	LoadingScreenVSCirclePnlIntl:setLeftRight( true, false, 0, 89.88 )
	LoadingScreenVSCirclePnlIntl:setTopBottom( true, false, 0, 89.88 )
	self:addElement( LoadingScreenVSCirclePnlIntl )
	self.LoadingScreenVSCirclePnlIntl = LoadingScreenVSCirclePnlIntl
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )
			end,
			StartLoading = function ()
				self:setupElementClipCounter( 0 )
			end
		},
		CodCaster = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "CodCaster",
			condition = function ( menu, element, event )
				return IsCodCaster( controller )
			end
		}
	} )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.LoadingScreenVSCirclePnlIntl:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

