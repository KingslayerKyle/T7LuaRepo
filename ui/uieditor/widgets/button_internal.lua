-- 413c1d94d5d1a866fb4ce9cf36f0d6fc
-- This hash is used for caching, delete to decompile the file again

CoD.button_internal = InheritFrom( LUI.UIElement )
CoD.button_internal.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( true )
	self:setClass( CoD.button_internal )
	self.id = "button_internal"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 500 )
	self:setTopBottom( true, false, 0, 30 )
	
	local Text0 = LUI.UITightText.new()
	Text0:setLeftRight( true, false, 0, 57 )
	Text0:setTopBottom( false, false, -15, 15 )
	Text0:setText( Engine.Localize( "Button" ) )
	Text0:setTTF( "fonts/escom.ttf" )
	self:addElement( Text0 )
	self.Text0 = Text0
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				Text0:completeAnimation()
				self.Text0:setRGB( 1, 0.99, 0.86 )
				self.Text0:setAlpha( 1 )
				self.clipFinished( Text0, {} )
			end
		},
		Invisible = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				Text0:completeAnimation()
				self.Text0:setAlpha( 0 )
				self.clipFinished( Text0, {} )
			end
		}
	}
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

