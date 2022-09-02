-- f4b6eab126d14805fb79734917ca0fbe
-- This hash is used for caching, delete to decompile the file again

CoD.BlueCoreBacking = InheritFrom( LUI.UIElement )
CoD.BlueCoreBacking.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.BlueCoreBacking )
	self.id = "BlueCoreBacking"
	self.soundSet = "CAC"
	self:setLeftRight( true, false, 0, 147 )
	self:setTopBottom( true, false, 0, 23 )
	
	local subheaderBg = LUI.UIImage.new()
	subheaderBg:setLeftRight( true, true, 0, -0.5 )
	subheaderBg:setTopBottom( true, true, 0, 0 )
	subheaderBg:setRGB( 0.47, 0.69, 1 )
	subheaderBg:setAlpha( 0.6 )
	self:addElement( subheaderBg )
	self.subheaderBg = subheaderBg
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )

			end
		},
		Multicore = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )

			end
		}
	}

	self:mergeStateConditions( {
		{
			stateName = "Multicore",
			condition = function ( menu, element, event )
				return IsMulticoreActivated( controller )
			end
		}
	} )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

