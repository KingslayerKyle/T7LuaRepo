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
	self:setLeftRight( 0, 0, 0, 382 )
	self:setTopBottom( 0, 0, 0, 82 )
	
	local numberbkg = LUI.UIImage.new()
	numberbkg:setLeftRight( 0.5, 0.5, -88.5, 88.5 )
	numberbkg:setTopBottom( 0.5, 0.5, -22.5, 22.5 )
	numberbkg:setRGB( 0, 0, 0 )
	numberbkg:setAlpha( 0.7 )
	self:addElement( numberbkg )
	self.numberbkg = numberbkg
	
	local layerMOfN = LUI.UIText.new()
	layerMOfN:setLeftRight( 0.5, 0.5, -191, 192 )
	layerMOfN:setTopBottom( 0.5, 0.5, -12, 12 )
	layerMOfN:setText( Engine.Localize( "MENU_EMBLEM_LAYER_M_OF_N" ) )
	layerMOfN:setTTF( "fonts/FoundryGridnik-Bold.ttf" )
	layerMOfN:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	layerMOfN:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( layerMOfN )
	self.layerMOfN = layerMOfN
	
	self.resetProperties = function ()
		numberbkg:completeAnimation()
		layerMOfN:completeAnimation()
		numberbkg:setAlpha( 0.7 )
		layerMOfN:setAlpha( 1 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 0 )
			end
		},
		EmptyLayer = {
			DefaultClip = function ()
				self.resetProperties()
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

