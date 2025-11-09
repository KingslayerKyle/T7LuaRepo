CoD.AmmoWidgetMP_Dash = InheritFrom( LUI.UIElement )
CoD.AmmoWidgetMP_Dash.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.AmmoWidgetMP_Dash )
	self.id = "AmmoWidgetMP_Dash"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 4 )
	self:setTopBottom( true, false, 0, 11 )
	
	local Hash4 = LUI.UIImage.new()
	Hash4:setLeftRight( true, false, 0, 4 )
	Hash4:setTopBottom( true, false, 0, 10.67 )
	Hash4:setRGB( 1, 0.77, 0 )
	Hash4:setImage( RegisterImage( "uie_t7_core_hud_ammowidget_abilityhash" ) )
	Hash4:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( Hash4 )
	self.Hash4 = Hash4
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )
			end
		},
		CoreControl = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )
			end
		},
		CoreMartial = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				Hash4:completeAnimation()
				self.Hash4:setRGB( 1, 0.95, 0.36 )
				self.clipFinished( Hash4, {} )
			end
		},
		CoreChaos = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				Hash4:completeAnimation()
				self.Hash4:setRGB( 1, 0.39, 0.19 )
				self.clipFinished( Hash4, {} )
			end
		}
	}
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

