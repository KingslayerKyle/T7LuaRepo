require( "ui.uieditor.widgets.MPHudWidgets.ResourceEnergyBarLine" )

CoD.WarlordArmorRegenBarFill = InheritFrom( LUI.UIElement )
CoD.WarlordArmorRegenBarFill.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( true )
	self:setClass( CoD.WarlordArmorRegenBarFill )
	self.id = "WarlordArmorRegenBarFill"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 100 )
	self:setTopBottom( true, false, 0, 18 )
	
	local ResourceEnergyBarLine = CoD.ResourceEnergyBarLine.new( menu, controller )
	ResourceEnergyBarLine:setLeftRight( true, false, 0, 100 )
	ResourceEnergyBarLine:setTopBottom( true, false, 0, 18 )
	ResourceEnergyBarLine:setRGB( 1, 1, 1 )
	self:addElement( ResourceEnergyBarLine )
	self.ResourceEnergyBarLine = ResourceEnergyBarLine
	
	local line0 = LUI.UIImage.new()
	line0:setLeftRight( true, false, 9, 11 )
	line0:setTopBottom( true, false, 3.01, 14.99 )
	line0:setRGB( 0, 0, 0 )
	line0:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( line0 )
	self.line0 = line0
	
	local line1 = LUI.UIImage.new()
	line1:setLeftRight( true, false, 19, 21 )
	line1:setTopBottom( true, false, 3.01, 14.99 )
	line1:setRGB( 0, 0, 0 )
	line1:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( line1 )
	self.line1 = line1
	
	local line2 = LUI.UIImage.new()
	line2:setLeftRight( true, false, 49, 51 )
	line2:setTopBottom( true, false, 3.01, 14.99 )
	line2:setRGB( 0, 0, 0 )
	line2:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( line2 )
	self.line2 = line2
	
	local line3 = LUI.UIImage.new()
	line3:setLeftRight( true, false, 29, 31 )
	line3:setTopBottom( true, false, 3.01, 14.99 )
	line3:setRGB( 0, 0, 0 )
	line3:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( line3 )
	self.line3 = line3
	
	local line4 = LUI.UIImage.new()
	line4:setLeftRight( true, false, 39, 41 )
	line4:setTopBottom( true, false, 3.01, 14.99 )
	line4:setRGB( 0, 0, 0 )
	line4:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( line4 )
	self.line4 = line4
	
	local line5 = LUI.UIImage.new()
	line5:setLeftRight( true, false, 59, 61 )
	line5:setTopBottom( true, false, 3.01, 14.99 )
	line5:setRGB( 0, 0, 0 )
	line5:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( line5 )
	self.line5 = line5
	
	local line6 = LUI.UIImage.new()
	line6:setLeftRight( true, false, 69, 71 )
	line6:setTopBottom( true, false, 3.01, 14.99 )
	line6:setRGB( 0, 0, 0 )
	line6:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( line6 )
	self.line6 = line6
	
	local line7 = LUI.UIImage.new()
	line7:setLeftRight( true, false, 79, 81 )
	line7:setTopBottom( true, false, 3.01, 14.99 )
	line7:setRGB( 0, 0, 0 )
	line7:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( line7 )
	self.line7 = line7
	
	local line8 = LUI.UIImage.new()
	line8:setLeftRight( true, false, 89, 91 )
	line8:setTopBottom( true, false, 3.01, 14.99 )
	line8:setRGB( 0, 0, 0 )
	line8:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( line8 )
	self.line8 = line8
	
	self.close = function ( self )
		self.ResourceEnergyBarLine:close()
		CoD.WarlordArmorRegenBarFill.super.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

