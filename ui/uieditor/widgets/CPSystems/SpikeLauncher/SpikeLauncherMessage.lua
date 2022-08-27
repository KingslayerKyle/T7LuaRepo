-- d19d38a74fb5147a7092c76140d74f68
-- This hash is used for caching, delete to decompile the file again

CoD.SpikeLauncherMessage = InheritFrom( LUI.UIElement )
CoD.SpikeLauncherMessage.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.SpikeLauncherMessage )
	self.id = "SpikeLauncherMessage"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 163 )
	self:setTopBottom( true, false, 0, 25 )
	
	local LineLowerL = LUI.UIImage.new()
	LineLowerL:setLeftRight( true, false, 0, 10.33 )
	LineLowerL:setTopBottom( false, false, 10, 12.33 )
	LineLowerL:setAlpha( 0.7 )
	LineLowerL:setImage( RegisterImage( "uie_t7_cp_hud_system_spikelauncher_inforboxfooterleft" ) )
	LineLowerL:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( LineLowerL )
	self.LineLowerL = LineLowerL
	
	local LineLowerM = LUI.UIImage.new()
	LineLowerM:setLeftRight( true, true, 10.33, -12.34 )
	LineLowerM:setTopBottom( false, false, 10, 12.33 )
	LineLowerM:setAlpha( 0.7 )
	LineLowerM:setImage( RegisterImage( "uie_t7_cp_hud_system_spikelauncher_inforboxfootermiddle" ) )
	LineLowerM:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( LineLowerM )
	self.LineLowerM = LineLowerM
	
	local LineLowerR = LUI.UIImage.new()
	LineLowerR:setLeftRight( false, true, -12.34, -0.01 )
	LineLowerR:setTopBottom( false, false, 10, 12.33 )
	LineLowerR:setAlpha( 0.7 )
	LineLowerR:setImage( RegisterImage( "uie_t7_cp_hud_system_spikelauncher_inforboxfooterright" ) )
	LineLowerR:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( LineLowerR )
	self.LineLowerR = LineLowerR
	
	local BoxR = LUI.UIImage.new()
	BoxR:setLeftRight( false, true, -10.34, -0.01 )
	BoxR:setTopBottom( false, false, -12, 9 )
	BoxR:setAlpha( 0.9 )
	BoxR:setImage( RegisterImage( "uie_t7_cp_hud_system_spikelauncher_inforboxright" ) )
	BoxR:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( BoxR )
	self.BoxR = BoxR
	
	local BoxM = LUI.UIImage.new()
	BoxM:setLeftRight( true, true, 11.33, -10.34 )
	BoxM:setTopBottom( false, false, -12, 9 )
	BoxM:setAlpha( 0.9 )
	BoxM:setImage( RegisterImage( "uie_t7_cp_hud_system_spikelauncher_inforboxmiddle" ) )
	BoxM:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( BoxM )
	self.BoxM = BoxM
	
	local BoxL = LUI.UIImage.new()
	BoxL:setLeftRight( true, false, 0, 11.33 )
	BoxL:setTopBottom( false, false, -12, 9 )
	BoxL:setAlpha( 0.9 )
	BoxL:setImage( RegisterImage( "uie_t7_cp_hud_system_spikelauncher_inforboxleft" ) )
	BoxL:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( BoxL )
	self.BoxL = BoxL
	
	local DescLbl = LUI.UITightText.new()
	DescLbl:setLeftRight( true, false, 6.17, 97.17 )
	DescLbl:setTopBottom( false, false, -8, 9 )
	DescLbl:setRGB( 0, 0, 0 )
	DescLbl:setText( Engine.Localize( "D E S T R O Y" ) )
	DescLbl:setTTF( "fonts/UnitedSansRgMd.ttf" )
	self:addElement( DescLbl )
	self.DescLbl = DescLbl
	
	local ArrowRight = LUI.UIImage.new()
	ArrowRight:setLeftRight( false, true, 10.5, 17.17 )
	ArrowRight:setTopBottom( false, false, -8, 5.34 )
	ArrowRight:setImage( RegisterImage( "uie_t7_cp_hud_system_spikelauncher_framearrowside" ) )
	ArrowRight:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( ArrowRight )
	self.ArrowRight = ArrowRight
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

