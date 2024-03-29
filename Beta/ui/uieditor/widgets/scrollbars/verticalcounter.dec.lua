CoD.verticalCounter = InheritFrom( LUI.UIElement )
CoD.verticalCounter.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.verticalCounter )
	self.id = "verticalCounter"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 200 )
	self:setTopBottom( true, false, 0, 25 )
	
	local upArrow = LUI.UIImage.new()
	upArrow:setLeftRight( false, false, -58, -42 )
	upArrow:setTopBottom( false, false, -4, 4 )
	upArrow:setRGB( ColorSet.Orange.r, ColorSet.Orange.g, ColorSet.Orange.b )
	upArrow:setImage( RegisterImage( "uie_img_t7_menu_arrow" ) )
	self:addElement( upArrow )
	self.upArrow = upArrow
	
	local currentItem = LUI.UIText.new()
	currentItem:setLeftRight( false, false, -38, -8 )
	currentItem:setTopBottom( false, false, -9, 9 )
	currentItem:setText( Engine.Localize( "10" ) )
	currentItem:setTTF( "fonts/default.ttf" )
	currentItem:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_RIGHT )
	currentItem:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( currentItem )
	self.currentItem = currentItem
	
	local dividor = LUI.UITightText.new()
	dividor:setLeftRight( false, false, -3, 3 )
	dividor:setTopBottom( false, false, -9, 9 )
	dividor:setText( Engine.Localize( "/" ) )
	dividor:setTTF( "fonts/default.ttf" )
	self:addElement( dividor )
	self.dividor = dividor
	
	local count = LUI.UIText.new()
	count:setLeftRight( false, false, 8, 38 )
	count:setTopBottom( false, false, -9, 9 )
	count:setText( Engine.Localize( "200" ) )
	count:setTTF( "fonts/default.ttf" )
	count:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	count:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( count )
	self.count = count
	
	local downArrow = LUI.UIImage.new()
	downArrow:setLeftRight( false, false, 42, 58 )
	downArrow:setTopBottom( false, false, -4, 4 )
	downArrow:setRGB( ColorSet.Orange.r, ColorSet.Orange.g, ColorSet.Orange.b )
	downArrow:setZRot( 180 )
	downArrow:setImage( RegisterImage( "uie_img_t7_menu_arrow" ) )
	self:addElement( downArrow )
	self.downArrow = downArrow
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 5 )
				upArrow:completeAnimation()
				self.upArrow:setLeftRight( false, false, 42, 58 )
				self.upArrow:setTopBottom( false, false, -4, 4 )
				self.upArrow:setRGB( ColorSet.Orange.r, ColorSet.Orange.g, ColorSet.Orange.b )
				self.upArrow:setAlpha( 1 )
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
				self.downArrow:setLeftRight( false, false, -58, -42 )
				self.downArrow:setTopBottom( false, false, -4, 4 )
				self.downArrow:setRGB( ColorSet.Orange.r, ColorSet.Orange.g, ColorSet.Orange.b )
				self.downArrow:setAlpha( 1 )
				self.clipFinished( downArrow, {} )
			end
		},
		AtTopAndBottom = {
			DefaultClip = function ()
				self:setupElementClipCounter( 5 )
				upArrow:completeAnimation()
				self.upArrow:setRGB( 0.2, 0.29, 0.33 )
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
				self.downArrow:setRGB( 0.2, 0.29, 0.33 )
				self.downArrow:setAlpha( 0 )
				self.clipFinished( downArrow, {} )
			end
		},
		AtTop = {
			DefaultClip = function ()
				self:setupElementClipCounter( 5 )
				upArrow:completeAnimation()
				self.upArrow:setRGB( 0.2, 0.29, 0.33 )
				self.upArrow:setAlpha( 1 )
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
				self.downArrow:setRGB( ColorSet.Orange.r, ColorSet.Orange.g, ColorSet.Orange.b )
				self.downArrow:setAlpha( 1 )
				self.clipFinished( downArrow, {} )
			end
		},
		AtBottom = {
			DefaultClip = function ()
				self:setupElementClipCounter( 5 )
				upArrow:completeAnimation()
				self.upArrow:setRGB( ColorSet.Orange.r, ColorSet.Orange.g, ColorSet.Orange.b )
				self.upArrow:setAlpha( 1 )
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
				self.downArrow:setAlpha( 1 )
				self.clipFinished( downArrow, {} )
			end
		},
		NoItems = {
			DefaultClip = function ()
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
			stateName = "AtTopAndBottom",
			condition = function ( menu, element, event )
				return IsSelfInState( self, "AtTopAndBottom" )
			end
		},
		{
			stateName = "AtTop",
			condition = function ( menu, element, event )
				return IsSelfInState( self, "AtTop" )
			end
		},
		{
			stateName = "AtBottom",
			condition = function ( menu, element, event )
				return IsSelfInState( self, "AtBottom" )
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

