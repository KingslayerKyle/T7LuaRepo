-- 321382fe9bade5abba56e785acff35f1
-- This hash is used for caching, delete to decompile the file again

CoD.LoadingScreenVSCirclePnlIntl = InheritFrom( LUI.UIElement )
CoD.LoadingScreenVSCirclePnlIntl.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.LoadingScreenVSCirclePnlIntl )
	self.id = "LoadingScreenVSCirclePnlIntl"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 90 )
	self:setTopBottom( true, false, 0, 90 )
	
	local VSCircle = LUI.UIImage.new()
	VSCircle:setLeftRight( true, false, 0, 89.88 )
	VSCircle:setTopBottom( true, false, 0, 89.88 )
	VSCircle:setRGB( 0, 0, 0 )
	VSCircle:setImage( RegisterImage( "uie_t7_hud_loadingscreen_factioncircle" ) )
	self:addElement( VSCircle )
	self.VSCircle = VSCircle
	
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
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
