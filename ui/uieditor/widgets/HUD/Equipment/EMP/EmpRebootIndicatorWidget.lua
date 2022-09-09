-- 95ef63a4aeabc2ec16793067923689c6
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.Border" )

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
	self:setLeftRight( true, false, 0, 201 )
	self:setTopBottom( true, false, 0, 39 )
	
	local ArmorFrame = LUI.UIImage.new()
	ArmorFrame:setLeftRight( false, false, -88.29, 86.5 )
	ArmorFrame:setTopBottom( false, false, -2.8, 19.5 )
	ArmorFrame:setAlpha( 0.4 )
	ArmorFrame:setImage( RegisterImage( "uie_t7_hud_armorcontainer" ) )
	self:addElement( ArmorFrame )
	self.ArmorFrame = ArmorFrame
	
	local BlackFrame = LUI.UIImage.new()
	BlackFrame:setLeftRight( false, false, -100.09, 99.5 )
	BlackFrame:setTopBottom( false, false, -18.92, -1.92 )
	BlackFrame:setRGB( 0, 0, 0 )
	BlackFrame:setAlpha( 0.4 )
	self:addElement( BlackFrame )
	self.BlackFrame = BlackFrame
	
	local armorBorder = CoD.Border.new( menu, controller )
	armorBorder:setLeftRight( false, false, -91.5, 89.5 )
	armorBorder:setTopBottom( false, false, -11.8, -8.3 )
	armorBorder:setAlpha( 0.4 )
	self:addElement( armorBorder )
	self.armorBorder = armorBorder
	
	local ProgressBar = LUI.UIImage.new()
	ProgressBar:setLeftRight( false, false, -90.5, 88.5 )
	ProgressBar:setTopBottom( false, false, -10.55, -9.55 )
	ProgressBar:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_wipe" ) )
	ProgressBar:setShaderVector( 0, 1, 0, 0, 0 )
	ProgressBar:setShaderVector( 1, 0, 0, 0, 0 )
	ProgressBar:setShaderVector( 2, 1, 0, 0, 0 )
	ProgressBar:setShaderVector( 3, 0, 0, 0, 0 )
	self:addElement( ProgressBar )
	self.ProgressBar = ProgressBar
	
	local RebootText = LUI.UIText.new()
	RebootText:setLeftRight( false, false, -77.88, 75.5 )
	RebootText:setTopBottom( false, false, -2.3, 14.7 )
	RebootText:setText( Engine.Localize( "MP_HUD_EMP_REBOOTING" ) )
	RebootText:setTTF( "fonts/escom.ttf" )
	RebootText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	RebootText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( RebootText )
	self.RebootText = RebootText
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )

				RebootText:completeAnimation()
				self.RebootText:setAlpha( 1 )
				self.clipFinished( RebootText, {} )
			end
		}
	}

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.armorBorder:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
