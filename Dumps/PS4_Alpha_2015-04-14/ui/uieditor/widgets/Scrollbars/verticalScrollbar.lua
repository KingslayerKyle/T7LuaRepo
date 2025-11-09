require( "ui.uieditor.widgets.Border" )

CoD.verticalScrollbar = InheritFrom( LUI.UIElement )
CoD.verticalScrollbar.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.verticalScrollbar )
	self.id = "verticalScrollbar"
	self.soundSet = "none"
	self:setLeftRight( true, false, 0, 10 )
	self:setTopBottom( true, false, 0, 500 )
	
	local topArrow = LUI.UIImage.new()
	topArrow:setLeftRight( true, true, 0, 0 )
	topArrow:setTopBottom( true, false, 0, 10 )
	topArrow:setRGB( 1, 1, 1 )
	topArrow:setImage( RegisterImage( "uie_ui_arrow_up" ) )
	topArrow:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( topArrow )
	self.topArrow = topArrow
	
	local bottomArrow = LUI.UIImage.new()
	bottomArrow:setLeftRight( true, true, 0, 0 )
	bottomArrow:setTopBottom( false, true, -10, 0 )
	bottomArrow:setRGB( 1, 1, 1 )
	bottomArrow:setImage( RegisterImage( "uie_ui_arrow_down" ) )
	bottomArrow:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( bottomArrow )
	self.bottomArrow = bottomArrow
	
	local sliderBorder = CoD.Border.new( menu, controller )
	sliderBorder:setLeftRight( true, true, 0, 0 )
	sliderBorder:setTopBottom( true, true, 10, -10 )
	sliderBorder:setRGB( 0.79, 0.78, 0.78 )
	self:addElement( sliderBorder )
	self.sliderBorder = sliderBorder
	
	local slider = LUI.UIImage.new()
	slider:setLeftRight( true, true, 2, -2 )
	slider:setTopBottom( true, true, 12, -12 )
	slider:setRGB( 1, 1, 1 )
	slider:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( slider )
	self.slider = slider
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 4 )
				topArrow:completeAnimation()
				self.topArrow:setAlpha( 1 )
				self.clipFinished( topArrow, {} )
				bottomArrow:completeAnimation()
				self.bottomArrow:setAlpha( 1 )
				self.clipFinished( bottomArrow, {} )
				sliderBorder:completeAnimation()
				self.sliderBorder:setAlpha( 1 )
				self.clipFinished( sliderBorder, {} )
				slider:completeAnimation()
				self.slider:setAlpha( 1 )
				self.clipFinished( slider, {} )
			end
		},
		AtTop = {
			DefaultClip = function ()
				self:setupElementClipCounter( 4 )
				topArrow:completeAnimation()
				self.topArrow:setAlpha( 0 )
				self.clipFinished( topArrow, {} )
				bottomArrow:completeAnimation()
				self.bottomArrow:setAlpha( 1 )
				self.clipFinished( bottomArrow, {} )
				sliderBorder:completeAnimation()
				self.sliderBorder:setAlpha( 1 )
				self.clipFinished( sliderBorder, {} )
				slider:completeAnimation()
				self.slider:setAlpha( 1 )
				self.clipFinished( slider, {} )
			end
		},
		AtTopAndBottom = {
			DefaultClip = function ()
				self:setupElementClipCounter( 4 )
				topArrow:completeAnimation()
				self.topArrow:setAlpha( 0 )
				self.clipFinished( topArrow, {} )
				bottomArrow:completeAnimation()
				self.bottomArrow:setAlpha( 0 )
				self.clipFinished( bottomArrow, {} )
				sliderBorder:completeAnimation()
				self.sliderBorder:setAlpha( 0 )
				self.clipFinished( sliderBorder, {} )
				slider:completeAnimation()
				self.slider:setAlpha( 0 )
				self.clipFinished( slider, {} )
			end
		},
		AtBottom = {
			DefaultClip = function ()
				self:setupElementClipCounter( 4 )
				topArrow:completeAnimation()
				self.topArrow:setAlpha( 1 )
				self.clipFinished( topArrow, {} )
				bottomArrow:completeAnimation()
				self.bottomArrow:setAlpha( 0 )
				self.clipFinished( bottomArrow, {} )
				sliderBorder:completeAnimation()
				self.sliderBorder:setAlpha( 1 )
				self.clipFinished( sliderBorder, {} )
				slider:completeAnimation()
				self.slider:setAlpha( 1 )
				self.clipFinished( slider, {} )
			end
		}
	}
	self.close = function ( self )
		self.sliderBorder:close()
		CoD.verticalScrollbar.super.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

