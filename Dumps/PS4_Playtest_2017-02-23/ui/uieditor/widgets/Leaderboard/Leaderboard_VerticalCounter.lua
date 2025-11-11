CoD.Leaderboard_VerticalCounter = InheritFrom( LUI.UIElement )
CoD.Leaderboard_VerticalCounter.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.Leaderboard_VerticalCounter )
	self.id = "Leaderboard_VerticalCounter"
	self.soundSet = "default"
	self:setLeftRight( 0, 0, 0, 300 )
	self:setTopBottom( 0, 0, 0, 37 )
	
	local currentItem = LUI.UIText.new()
	currentItem:setLeftRight( 0.5, 0.5, -114, -12 )
	currentItem:setTopBottom( 0.5, 0.5, -13.5, 13.5 )
	currentItem:setAlpha( 0.65 )
	currentItem:setText( Engine.Localize( "8888888888" ) )
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
	count:setLeftRight( 0.5, 0.5, 12, 114 )
	count:setTopBottom( 0.5, 0.5, -13.5, 13.5 )
	count:setAlpha( 0.65 )
	count:setText( Engine.Localize( "8888888888" ) )
	count:setTTF( "fonts/default.ttf" )
	count:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	count:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( count )
	self.count = count
	
	local upArrow = LUI.UIImage.new()
	upArrow:setLeftRight( 0.5, 0.5, -140, -116 )
	upArrow:setTopBottom( 0.5, 0.5, -6, 6 )
	upArrow:setRGB( 1, 0.41, 0 )
	upArrow:setZRot( 180 )
	upArrow:setImage( RegisterImage( "uie_img_t7_menu_arrow" ) )
	self:addElement( upArrow )
	self.upArrow = upArrow
	
	local downArrow = LUI.UIImage.new()
	downArrow:setLeftRight( 0.5, 0.5, 116, 140 )
	downArrow:setTopBottom( 0.5, 0.5, -6, 6 )
	downArrow:setRGB( 1, 0.41, 0 )
	downArrow:setImage( RegisterImage( "uie_img_t7_menu_arrow" ) )
	self:addElement( downArrow )
	self.downArrow = downArrow
	
	self.resetProperties = function ()
		currentItem:completeAnimation()
		count:completeAnimation()
		dividor:completeAnimation()
		upArrow:completeAnimation()
		downArrow:completeAnimation()
		currentItem:setAlpha( 0.65 )
		count:setAlpha( 0.65 )
		dividor:setAlpha( 0.65 )
		upArrow:setRGB( 1, 0.41, 0 )
		upArrow:setAlpha( 1 )
		downArrow:setRGB( 1, 0.41, 0 )
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
		AtTopAndBottom = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 5 )
				currentItem:completeAnimation()
				self.currentItem:setAlpha( 0 )
				self.clipFinished( currentItem, {} )
				dividor:completeAnimation()
				self.dividor:setAlpha( 0 )
				self.clipFinished( dividor, {} )
				count:completeAnimation()
				self.count:setAlpha( 0 )
				self.clipFinished( count, {} )
				upArrow:completeAnimation()
				self.upArrow:setAlpha( 0 )
				self.clipFinished( upArrow, {} )
				downArrow:completeAnimation()
				self.downArrow:setAlpha( 0 )
				self.clipFinished( downArrow, {} )
			end
		},
		AtTop = {
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
		AtBottom = {
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
				upArrow:completeAnimation()
				self.upArrow:setRGB( 0.2, 0.29, 0.33 )
				self.clipFinished( upArrow, {} )
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
		}
	} )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

