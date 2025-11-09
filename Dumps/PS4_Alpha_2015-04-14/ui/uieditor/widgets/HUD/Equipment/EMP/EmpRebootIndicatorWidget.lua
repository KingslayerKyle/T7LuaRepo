CoD.EmpRebootIndicatorWidget = InheritFrom( LUI.UIElement )
CoD.EmpRebootIndicatorWidget.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.EmpRebootIndicatorWidget )
	self.id = "EmpRebootIndicatorWidget"
	self.soundSet = "HUD"
	self:setLeftRight( true, false, 0, 110 )
	self:setTopBottom( true, false, 0, 28 )
	
	local Background = LUI.UIImage.new()
	Background:setLeftRight( false, false, -49.61, 49.61 )
	Background:setTopBottom( false, false, -13.86, -2.36 )
	Background:setRGB( 0, 0, 0 )
	Background:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( Background )
	self.Background = Background
	
	local ProgressBar = LUI.UIImage.new()
	ProgressBar:setLeftRight( false, false, -49.61, 49.61 )
	ProgressBar:setTopBottom( false, false, -13.86, -2.36 )
	ProgressBar:setRGB( 1, 1, 1 )
	ProgressBar:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_wipe" ) )
	ProgressBar:setShaderVector( 0, 1, 0, 0, 0 )
	ProgressBar:setShaderVector( 1, 0, 0, 0, 0 )
	ProgressBar:setShaderVector( 2, 1, 0, 0, 0 )
	ProgressBar:setShaderVector( 3, 0, 0, 0, 0 )
	self:addElement( ProgressBar )
	self.ProgressBar = ProgressBar
	
	local RebootText = LUI.UIText.new()
	RebootText:setLeftRight( false, false, -54.88, 54.88 )
	RebootText:setTopBottom( false, false, 2.39, 13.86 )
	RebootText:setRGB( 1, 1, 1 )
	RebootText:setText( Engine.Localize( "MPUI_REBOOTING_HUD" ) )
	RebootText:setTTF( "fonts/UnitedSansSmExMd.ttf" )
	RebootText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	RebootText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( RebootText )
	self.RebootText = RebootText
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

