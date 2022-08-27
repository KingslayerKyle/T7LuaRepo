-- ed810c8ad1f4798f7e13787a500d6d85
-- This hash is used for caching, delete to decompile the file again

CoD.verticalCounterBlackMarket = InheritFrom( LUI.UIElement )
CoD.verticalCounterBlackMarket.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.verticalCounterBlackMarket )
	self.id = "verticalCounterBlackMarket"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 200 )
	self:setTopBottom( true, false, 0, 25 )
	
	local currentItem = LUI.UIText.new()
	currentItem:setLeftRight( false, false, -38, -8 )
	currentItem:setTopBottom( false, false, -9, 9 )
	currentItem:setAlpha( 0.65 )
	currentItem:setText( Engine.Localize( "10" ) )
	currentItem:setTTF( "fonts/default.ttf" )
	currentItem:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_RIGHT )
	currentItem:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( currentItem )
	self.currentItem = currentItem
	
	local dividor = LUI.UITightText.new()
	dividor:setLeftRight( false, false, -3, 3 )
	dividor:setTopBottom( false, false, -9, 9 )
	dividor:setAlpha( 0.65 )
	dividor:setText( Engine.Localize( "/" ) )
	dividor:setTTF( "fonts/default.ttf" )
	self:addElement( dividor )
	self.dividor = dividor
	
	local count = LUI.UIText.new()
	count:setLeftRight( false, false, 8, 38 )
	count:setTopBottom( false, false, -9, 9 )
	count:setAlpha( 0.65 )
	count:setText( Engine.Localize( "200" ) )
	count:setTTF( "fonts/default.ttf" )
	count:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	count:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( count )
	self.count = count
	
	local upArrow = LUI.UIImage.new()
	upArrow:setLeftRight( false, false, -58, -42 )
	upArrow:setTopBottom( false, false, -4, 4 )
	upArrow:setRGB( 1, 0.41, 0 )
	upArrow:setZRot( 180 )
	upArrow:setImage( RegisterImage( "uie_img_t7_menu_arrow" ) )
	self:addElement( upArrow )
	self.upArrow = upArrow
	
	local downArrow = LUI.UIImage.new()
	downArrow:setLeftRight( false, false, 42, 58 )
	downArrow:setTopBottom( false, false, -4, 4 )
	downArrow:setRGB( ColorSet.Orange.r, ColorSet.Orange.g, ColorSet.Orange.b )
	downArrow:setImage( RegisterImage( "uie_img_t7_menu_arrow" ) )
	self:addElement( downArrow )
	self.downArrow = downArrow
	
	local upArrowPulse = LUI.UIImage.new()
	upArrowPulse:setLeftRight( false, false, -58, -42 )
	upArrowPulse:setTopBottom( false, false, -4, 4 )
	upArrowPulse:setRGB( 1, 0.41, 0 )
	upArrowPulse:setAlpha( 0 )
	upArrowPulse:setZRot( 180 )
	upArrowPulse:setScale( 2 )
	upArrowPulse:setImage( RegisterImage( "uie_img_t7_menu_arrow" ) )
	self:addElement( upArrowPulse )
	self.upArrowPulse = upArrowPulse
	
	local downArrowPulse = LUI.UIImage.new()
	downArrowPulse:setLeftRight( false, false, 42, 58 )
	downArrowPulse:setTopBottom( false, false, -4, 4 )
	downArrowPulse:setRGB( ColorSet.Orange.r, ColorSet.Orange.g, ColorSet.Orange.b )
	downArrowPulse:setAlpha( 0 )
	downArrowPulse:setImage( RegisterImage( "uie_img_t7_menu_arrow" ) )
	self:addElement( downArrowPulse )
	self.downArrowPulse = downArrowPulse
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 7 )
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
				self.upArrow:setLeftRight( false, false, 42, 58 )
				self.upArrow:setTopBottom( false, false, -4, 4 )
				self.upArrow:setRGB( ColorSet.Orange.r, ColorSet.Orange.g, ColorSet.Orange.b )
				self.upArrow:setAlpha( 1 )
				self.upArrow:setZRot( 0 )
				self.clipFinished( upArrow, {} )
				downArrow:completeAnimation()
				self.downArrow:setLeftRight( false, false, -58, -42 )
				self.downArrow:setTopBottom( false, false, -4, 4 )
				self.downArrow:setRGB( ColorSet.Orange.r, ColorSet.Orange.g, ColorSet.Orange.b )
				self.downArrow:setAlpha( 1 )
				self.downArrow:setZRot( 180 )
				self.clipFinished( downArrow, {} )
				upArrowPulse:completeAnimation()
				self.upArrowPulse:setAlpha( 0 )
				self.upArrowPulse:setScale( 1 )
				self.clipFinished( upArrowPulse, {} )
				downArrowPulse:completeAnimation()
				self.downArrowPulse:setAlpha( 0 )
				self.downArrowPulse:setScale( 1 )
				self.clipFinished( downArrowPulse, {} )
			end
		},
		AtTopAndBottom = {
			DefaultClip = function ()
				self:setupElementClipCounter( 7 )
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
				self.upArrow:setLeftRight( false, false, -58, -42 )
				self.upArrow:setTopBottom( false, false, -4, 4 )
				self.upArrow:setRGB( 0.2, 0.29, 0.33 )
				self.upArrow:setAlpha( 0 )
				self.upArrow:setZRot( 180 )
				self.clipFinished( upArrow, {} )
				downArrow:completeAnimation()
				self.downArrow:setLeftRight( false, false, 42, 58 )
				self.downArrow:setTopBottom( false, false, -4, 4 )
				self.downArrow:setRGB( 0.2, 0.29, 0.33 )
				self.downArrow:setAlpha( 0 )
				self.downArrow:setZRot( 0 )
				self.clipFinished( downArrow, {} )
				upArrowPulse:completeAnimation()
				self.upArrowPulse:setAlpha( 0 )
				self.upArrowPulse:setScale( 1 )
				self.clipFinished( upArrowPulse, {} )
				downArrowPulse:completeAnimation()
				self.downArrowPulse:setAlpha( 0 )
				self.downArrowPulse:setScale( 1 )
				self.clipFinished( downArrowPulse, {} )
			end
		},
		AtTop = {
			DefaultClip = function ()
				self:setupElementClipCounter( 7 )
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
				self.upArrow:setLeftRight( false, false, -58, -42 )
				self.upArrow:setTopBottom( false, false, -4, 4 )
				self.upArrow:setRGB( ColorSet.Orange.r, ColorSet.Orange.g, ColorSet.Orange.b )
				self.upArrow:setAlpha( 1 )
				self.upArrow:setZRot( 180 )
				self.clipFinished( upArrow, {} )
				downArrow:completeAnimation()
				self.downArrow:setLeftRight( false, false, 42, 58 )
				self.downArrow:setTopBottom( false, false, -4, 4 )
				self.downArrow:setRGB( 0.2, 0.29, 0.33 )
				self.downArrow:setAlpha( 1 )
				self.downArrow:setZRot( 0 )
				self.clipFinished( downArrow, {} )
				local upArrowPulseFrame2 = function ( upArrowPulse, event )
					if not event.interrupted then
						upArrowPulse:beginAnimation( "keyframe", 1009, false, false, CoD.TweenType.Linear )
					end
					upArrowPulse:setAlpha( 0 )
					upArrowPulse:setScale( 3 )
					if event.interrupted then
						self.clipFinished( upArrowPulse, event )
					else
						upArrowPulse:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				upArrowPulse:completeAnimation()
				self.upArrowPulse:setAlpha( 1 )
				self.upArrowPulse:setScale( 1 )
				upArrowPulseFrame2( upArrowPulse, {} )
				downArrowPulse:completeAnimation()
				self.downArrowPulse:setAlpha( 0 )
				self.clipFinished( downArrowPulse, {} )
				self.nextClip = "DefaultClip"
			end
		},
		AtBottom = {
			DefaultClip = function ()
				self:setupElementClipCounter( 7 )
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
				self.upArrow:setLeftRight( false, false, -58, -42 )
				self.upArrow:setTopBottom( false, false, -4, 4 )
				self.upArrow:setRGB( 0.2, 0.29, 0.33 )
				self.upArrow:setAlpha( 1 )
				self.upArrow:setZRot( 180 )
				self.clipFinished( upArrow, {} )
				downArrow:completeAnimation()
				self.downArrow:setLeftRight( false, false, 42, 58 )
				self.downArrow:setTopBottom( false, false, -4, 4 )
				self.downArrow:setRGB( ColorSet.Orange.r, ColorSet.Orange.g, ColorSet.Orange.b )
				self.downArrow:setAlpha( 1 )
				self.downArrow:setZRot( 0 )
				self.clipFinished( downArrow, {} )
				upArrowPulse:completeAnimation()
				self.upArrowPulse:setAlpha( 0 )
				self.upArrowPulse:setScale( 1 )
				self.clipFinished( upArrowPulse, {} )
				local downArrowPulseFrame2 = function ( downArrowPulse, event )
					if not event.interrupted then
						downArrowPulse:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Linear )
					end
					downArrowPulse:setAlpha( 0 )
					downArrowPulse:setScale( 3 )
					if event.interrupted then
						self.clipFinished( downArrowPulse, event )
					else
						downArrowPulse:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				downArrowPulse:completeAnimation()
				self.downArrowPulse:setAlpha( 1 )
				self.downArrowPulse:setScale( 1 )
				downArrowPulseFrame2( downArrowPulse, {} )
				self.nextClip = "DefaultClip"
			end
		},
		NoItems = {
			DefaultClip = function ()
				self:setupElementClipCounter( 7 )
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
				self.upArrow:setLeftRight( false, false, -58, -42 )
				self.upArrow:setTopBottom( false, false, -4, 4 )
				self.upArrow:setAlpha( 0 )
				self.upArrow:setZRot( 180 )
				self.clipFinished( upArrow, {} )
				downArrow:completeAnimation()
				self.downArrow:setLeftRight( false, false, 42, 58 )
				self.downArrow:setTopBottom( false, false, -4, 4 )
				self.downArrow:setAlpha( 0 )
				self.downArrow:setZRot( 0 )
				self.clipFinished( downArrow, {} )
				upArrowPulse:completeAnimation()
				self.upArrowPulse:setAlpha( 0 )
				self.upArrowPulse:setScale( 1 )
				self.clipFinished( upArrowPulse, {} )
				downArrowPulse:completeAnimation()
				self.downArrowPulse:setAlpha( 0 )
				self.downArrowPulse:setScale( 1 )
				self.clipFinished( downArrowPulse, {} )
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

