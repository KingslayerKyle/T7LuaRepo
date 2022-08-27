-- 526603876489cdcb07d6ca04b6808041
-- This hash is used for caching, delete to decompile the file again

CoD.TModeSetting_SurvivalistTacticalMode = InheritFrom( LUI.UIElement )
CoD.TModeSetting_SurvivalistTacticalMode.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.TModeSetting_SurvivalistTacticalMode )
	self.id = "TModeSetting_SurvivalistTacticalMode"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 860 )
	self:setTopBottom( true, false, 0, 470 )
	
	local ImageMain00 = LUI.UIImage.new()
	ImageMain00:setLeftRight( true, false, 0, 509 )
	ImageMain00:setTopBottom( true, false, 100, 388 )
	ImageMain00:setImage( RegisterImage( "uie_t7_cp_dni_tactical_survivalist" ) )
	ImageMain00:setupUIStreamedImage( 0 )
	self:addElement( ImageMain00 )
	self.ImageMain00 = ImageMain00
	
	local TextBox600 = LUI.UIText.new()
	TextBox600:setLeftRight( true, false, 525, 725 )
	TextBox600:setTopBottom( true, false, 194.49, 214.49 )
	TextBox600:setText( Engine.Localize( "CPUI_TMODE_HOTZONE_DESC" ) )
	TextBox600:setTTF( "fonts/default.ttf" )
	TextBox600:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	TextBox600:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( TextBox600 )
	self.TextBox600 = TextBox600
	
	local Image600 = LUI.UIImage.new()
	Image600:setLeftRight( true, false, 525, 555 )
	Image600:setTopBottom( true, false, 163.49, 193.49 )
	Image600:setImage( RegisterImage( "uie_tmode6" ) )
	self:addElement( Image600 )
	self.Image600 = Image600
	
	local TextBox300 = LUI.UIText.new()
	TextBox300:setLeftRight( true, false, 525, 725 )
	TextBox300:setTopBottom( true, false, 255.49, 275.49 )
	TextBox300:setText( Engine.Localize( "CPUI_TMODE_SHOOTER_DESC" ) )
	TextBox300:setTTF( "fonts/default.ttf" )
	TextBox300:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	TextBox300:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( TextBox300 )
	self.TextBox300 = TextBox300
	
	local Image300 = LUI.UIImage.new()
	Image300:setLeftRight( true, false, 525, 557 )
	Image300:setTopBottom( true, false, 223.49, 255.49 )
	Image300:setImage( RegisterImage( "uie_tmode3" ) )
	Image300:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image300 )
	self.Image300 = Image300
	
	local TextBox4000 = LUI.UIText.new()
	TextBox4000:setLeftRight( true, false, 525, 725 )
	TextBox4000:setTopBottom( true, false, 132, 152 )
	TextBox4000:setText( Engine.Localize( "CPUI_TMODE_INCOMING_DESC" ) )
	TextBox4000:setTTF( "fonts/default.ttf" )
	TextBox4000:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	TextBox4000:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( TextBox4000 )
	self.TextBox4000 = TextBox4000
	
	local Image4000 = LUI.UIImage.new()
	Image4000:setLeftRight( true, false, 525, 557 )
	Image4000:setTopBottom( true, false, 100, 132 )
	Image4000:setImage( RegisterImage( "uie_tmode4" ) )
	Image4000:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image4000 )
	self.Image4000 = Image4000
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

