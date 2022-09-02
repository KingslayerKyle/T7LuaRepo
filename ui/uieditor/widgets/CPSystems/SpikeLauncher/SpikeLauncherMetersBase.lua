-- a230c9bd29924bdafad5fdbdf51de688
-- This hash is used for caching, delete to decompile the file again

CoD.SpikeLauncherMetersBase = InheritFrom( LUI.UIElement )
CoD.SpikeLauncherMetersBase.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.SpikeLauncherMetersBase )
	self.id = "SpikeLauncherMetersBase"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 47 )
	self:setTopBottom( true, false, 0, 104 )
	
	local MeterLower = LUI.UIImage.new()
	MeterLower:setLeftRight( true, true, 0, 0.33 )
	MeterLower:setTopBottom( true, true, 104.16, -104 )
	MeterLower:setAlpha( 0 )
	MeterLower:setImage( RegisterImage( "uie_t7_cp_hud_system_spikelauncher_infolmeterbase" ) )
	MeterLower:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( MeterLower )
	self.MeterLower = MeterLower
	
	local MeterLowerColor = LUI.UIImage.new()
	MeterLowerColor:setLeftRight( true, true, 0, 0.33 )
	MeterLowerColor:setTopBottom( true, true, 104.16, -104 )
	MeterLowerColor:setImage( RegisterImage( "uie_t7_cp_hud_system_spikelauncher_infolmeterbasecolor" ) )
	MeterLowerColor:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( MeterLowerColor )
	self.MeterLowerColor = MeterLowerColor
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )

				MeterLower:completeAnimation()
				self.MeterLower:setAlpha( 1 )
				self.clipFinished( MeterLower, {} )

				MeterLowerColor:completeAnimation()
				self.MeterLowerColor:setAlpha( 0 )
				self.clipFinished( MeterLowerColor, {} )
			end
		},
		StrongArea = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )

				MeterLower:completeAnimation()
				self.MeterLower:setAlpha( 0 )
				self.clipFinished( MeterLower, {} )

				MeterLowerColor:completeAnimation()
				self.MeterLowerColor:setAlpha( 1 )
				self.clipFinished( MeterLowerColor, {} )
			end
		}
	}
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

