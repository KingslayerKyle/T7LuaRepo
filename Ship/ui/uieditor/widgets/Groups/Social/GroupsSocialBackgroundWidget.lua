-- 177099477e3ffe7d3634ff9e4c4bb5e5
-- This hash is used for caching, delete to decompile the file again

CoD.GroupsSocialBackgroundWidget = InheritFrom( LUI.UIElement )
CoD.GroupsSocialBackgroundWidget.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.GroupsSocialBackgroundWidget )
	self.id = "GroupsSocialBackgroundWidget"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 612 )
	self:setTopBottom( true, false, 0, 636 )
	
	local BackgroundGlobe = LUI.UIImage.new()
	BackgroundGlobe:setLeftRight( true, true, 0, 0 )
	BackgroundGlobe:setTopBottom( true, true, 0, 0 )
	BackgroundGlobe:setImage( RegisterImage( "uie_t7_menu_groups_globe_bkgd" ) )
	self:addElement( BackgroundGlobe )
	self.BackgroundGlobe = BackgroundGlobe
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )
			end
		},
		Visible = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )

				BackgroundGlobe:completeAnimation()
				self.BackgroundGlobe:setAlpha( 0.5 )
				self.clipFinished( BackgroundGlobe, {} )
			end
		},
		Hidden = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )

				BackgroundGlobe:completeAnimation()
				self.BackgroundGlobe:setAlpha( 0 )
				self.clipFinished( BackgroundGlobe, {} )
			end
		}
	}
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
