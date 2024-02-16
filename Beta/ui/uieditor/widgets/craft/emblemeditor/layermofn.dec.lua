CoD.layermofn = InheritFrom( LUI.UIElement )
CoD.layermofn.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.layermofn )
	self.id = "layermofn"
	self.soundSet = "CustomizationEditor"
	self:setLeftRight( true, false, 0, 255 )
	self:setTopBottom( true, false, 0, 55 )
	
	local numberbkg = LUI.UIImage.new()
	numberbkg:setLeftRight( false, false, -59.08, 59.08 )
	numberbkg:setTopBottom( false, false, -15, 15 )
	numberbkg:setRGB( 0, 0, 0 )
	numberbkg:setAlpha( 0.7 )
	self:addElement( numberbkg )
	self.numberbkg = numberbkg
	
	local layerMOfN = LUI.UIText.new()
	layerMOfN:setLeftRight( false, false, -127.34, 128.17 )
	layerMOfN:setTopBottom( false, false, -8, 8 )
	layerMOfN:setText( Engine.Localize( "MENU_EMBLEM_LAYER_M_OF_N" ) )
	layerMOfN:setTTF( "fonts/FoundryGridnik-Bold.ttf" )
	layerMOfN:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	layerMOfN:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( layerMOfN )
	self.layerMOfN = layerMOfN
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				numberbkg:completeAnimation()
				self.numberbkg:setAlpha( 0.7 )
				self.clipFinished( numberbkg, {} )
				layerMOfN:completeAnimation()
				self.layerMOfN:setAlpha( 1 )
				self.clipFinished( layerMOfN, {} )
			end
		},
		EmptyLayer = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				numberbkg:completeAnimation()
				self.numberbkg:setAlpha( 0 )
				self.clipFinished( numberbkg, {} )
				layerMOfN:completeAnimation()
				self.layerMOfN:setAlpha( 0 )
				self.clipFinished( layerMOfN, {} )
			end
		}
	}
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

