CoD.horizontalCounter = InheritFrom( LUI.UIElement )
CoD.horizontalCounter.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.horizontalCounter )
	self.id = "horizontalCounter"
	self.soundSet = "default"
	self:setLeftRight( 0, 0, 0, 300 )
	self:setTopBottom( 0, 0, 0, 37 )
	
	local upArrow = LUI.UIImage.new()
	upArrow:setLeftRight( 0.5, 0.5, -87, -63 )
	upArrow:setTopBottom( 0.5, 0.5, -6, 6 )
	upArrow:setRGB( ColorSet.Orange.r, ColorSet.Orange.g, ColorSet.Orange.b )
	upArrow:setZRot( 90 )
	upArrow:setImage( RegisterImage( "uie_img_t7_menu_arrow" ) )
	self:addElement( upArrow )
	self.upArrow = upArrow
	
	local currentItem = LUI.UIText.new()
	currentItem:setLeftRight( 0.5, 0.5, -57, -12 )
	currentItem:setTopBottom( 0.5, 0.5, -13.5, 13.5 )
	currentItem:setAlpha( 0.65 )
	currentItem:setText( Engine.Localize( "10" ) )
	currentItem:setTTF( "fonts/default.ttf" )
	currentItem:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_RIGHT )
	currentItem:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( currentItem )
	self.currentItem = currentItem
	
	local dividor = LUI.UITightText.new()
	dividor:setLeftRight( 0.5, 0.5, -4.5, 4.5 )
	dividor:setTopBottom( 0.5, 0.5, -13.5, 13.5 )
	dividor:setAlpha( 0.65 )
	dividor:setText( Engine.Localize( "/" ) )
	dividor:setTTF( "fonts/default.ttf" )
	self:addElement( dividor )
	self.dividor = dividor
	
	local count = LUI.UIText.new()
	count:setLeftRight( 0.5, 0.5, 12, 57 )
	count:setTopBottom( 0.5, 0.5, -13.5, 13.5 )
	count:setAlpha( 0.65 )
	count:setText( Engine.Localize( "200" ) )
	count:setTTF( "fonts/default.ttf" )
	count:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	count:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( count )
	self.count = count
	
	local downArrow = LUI.UIImage.new()
	downArrow:setLeftRight( 0.5, 0.5, 63, 87 )
	downArrow:setTopBottom( 0.5, 0.5, -6, 6 )
	downArrow:setRGB( ColorSet.Orange.r, ColorSet.Orange.g, ColorSet.Orange.b )
	downArrow:setZRot( -90 )
	downArrow:setImage( RegisterImage( "uie_img_t7_menu_arrow" ) )
	self:addElement( downArrow )
	self.downArrow = downArrow
	
	self.resetProperties = function ()
		currentItem:completeAnimation()
		dividor:completeAnimation()
		count:completeAnimation()
		upArrow:completeAnimation()
		downArrow:completeAnimation()
		currentItem:setAlpha( 0.65 )
		dividor:setAlpha( 0.65 )
		count:setAlpha( 0.65 )
		upArrow:setRGB( ColorSet.Orange.r, ColorSet.Orange.g, ColorSet.Orange.b )
		upArrow:setAlpha( 1 )
		downArrow:setRGB( ColorSet.Orange.r, ColorSet.Orange.g, ColorSet.Orange.b )
		downArrow:setAlpha( 1 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 3 )
				currentItem:completeAnimation()
				self.currentItem:setAlpha( 1 )
				self.clipFinished( currentItem, {} )
				dividor:completeAnimation()
				self.dividor:setAlpha( 1 )
				self.clipFinished( dividor, {} )
				count:completeAnimation()
				self.count:setAlpha( 1 )
				self.clipFinished( count, {} )
			end
		},
		AtLeftAndRight = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 5 )
				upArrow:completeAnimation()
				self.upArrow:setRGB( 0.2, 0.29, 0.33 )
				self.clipFinished( upArrow, {} )
				currentItem:completeAnimation()
				self.currentItem:setAlpha( 1 )
				self.clipFinished( currentItem, {} )
				dividor:completeAnimation()
				self.dividor:setAlpha( 1 )
				self.clipFinished( dividor, {} )
				count:completeAnimation()
				self.count:setAlpha( 1 )
				self.clipFinished( count, {} )
				downArrow:completeAnimation()
				self.downArrow:setRGB( 0.2, 0.29, 0.33 )
				self.clipFinished( downArrow, {} )
			end
		},
		AtLeft = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 4 )
				upArrow:completeAnimation()
				self.upArrow:setRGB( 0.2, 0.29, 0.33 )
				self.clipFinished( upArrow, {} )
				currentItem:completeAnimation()
				self.currentItem:setAlpha( 1 )
				self.clipFinished( currentItem, {} )
				dividor:completeAnimation()
				self.dividor:setAlpha( 1 )
				self.clipFinished( dividor, {} )
				count:completeAnimation()
				self.count:setAlpha( 1 )
				self.clipFinished( count, {} )
			end
		},
		AtRight = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 4 )
				currentItem:completeAnimation()
				self.currentItem:setAlpha( 1 )
				self.clipFinished( currentItem, {} )
				dividor:completeAnimation()
				self.dividor:setAlpha( 1 )
				self.clipFinished( dividor, {} )
				count:completeAnimation()
				self.count:setAlpha( 1 )
				self.clipFinished( count, {} )
				downArrow:completeAnimation()
				self.downArrow:setRGB( 0.2, 0.29, 0.33 )
				self.clipFinished( downArrow, {} )
			end
		},
		NoItems = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 5 )
				upArrow:completeAnimation()
				self.upArrow:setAlpha( 0 )
				self.clipFinished( upArrow, {} )
				currentItem:completeAnimation()
				self.currentItem:setAlpha( 0 )
				self.clipFinished( currentItem, {} )
				dividor:completeAnimation()
				self.dividor:setAlpha( 0 )
				self.clipFinished( dividor, {} )
				count:completeAnimation()
				self.count:setAlpha( 0 )
				self.clipFinished( count, {} )
				downArrow:completeAnimation()
				self.downArrow:setAlpha( 0 )
				self.clipFinished( downArrow, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "AtLeftAndRight",
			condition = function ( menu, element, event )
				return IsSelfInState( self, "AtLeftAndRight" )
			end
		},
		{
			stateName = "AtLeft",
			condition = function ( menu, element, event )
				return IsSelfInState( self, "AtLeft" )
			end
		},
		{
			stateName = "AtRight",
			condition = function ( menu, element, event )
				return IsSelfInState( self, "AtRight" )
			end
		},
		{
			stateName = "NoItems",
			condition = function ( menu, element, event )
				return true
			end
		}
	} )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

