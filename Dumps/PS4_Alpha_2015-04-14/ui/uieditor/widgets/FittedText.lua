local PostLoadFunc = function ( self, controller )
	LUI.OverrideFunction_CallOriginalFirst( self.text, "setText", function ( text )
		self:setWidth( self.text:getTextWidth() + 6 )
	end )
end

CoD.FittedText = InheritFrom( LUI.UIElement )
CoD.FittedText.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.FittedText )
	self.id = "FittedText"
	self.soundSet = "none"
	self:setLeftRight( true, false, 0, 60 )
	self:setTopBottom( true, false, 0, 31 )
	self:makeFocusable()
	self:setHandleMouse( true )
	
	local nameBacking = LUI.UIImage.new()
	nameBacking:setLeftRight( true, true, 0, 0 )
	nameBacking:setTopBottom( true, true, 0, 0 )
	nameBacking:setRGB( 0.05, 0.05, 0.05 )
	nameBacking:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( nameBacking )
	self.nameBacking = nameBacking
	
	local text = LUI.UITightText.new()
	text:setLeftRight( true, false, 3, 47 )
	text:setTopBottom( true, false, 3, 25 )
	text:setRGB( 1, 1, 1 )
	text:setText( Engine.Localize( "MENU_NEW" ) )
	text:setTTF( "fonts/default.ttf" )
	self:addElement( text )
	self.text = text
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )
			end,
			Focus = function ()
				self:setupElementClipCounter( 1 )
				text:completeAnimation()
				self.text:setRGB( 1, 0.41, 0 )
				self.clipFinished( text, {} )
			end
		}
	}
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

