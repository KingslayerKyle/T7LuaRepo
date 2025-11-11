require( "ui.uieditor.widgets.Border" )
require( "ui.uieditor.widgets.button_internal" )

CoD.ListButton = InheritFrom( LUI.UIElement )
CoD.ListButton.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.ListButton )
	self.id = "ListButton"
	self.soundSet = "default"
	self:setLeftRight( 0, 0, 0, 540 )
	self:setTopBottom( 0, 0, 0, 52 )
	self:makeFocusable()
	self:setHandleMouse( true )
	self.anyChildUsesUpdateState = true
	
	local Background = LUI.UIImage.new()
	Background:setLeftRight( 0, 0, 22, 540 )
	Background:setTopBottom( 0, 0, 0, 52 )
	Background:setRGB( 0.11, 0.14, 0.2 )
	Background:setAlpha( 0 )
	self:addElement( Background )
	self.Background = Background
	
	local Text = CoD.button_internal.new( menu, controller )
	Text:setLeftRight( 0, 0, 45, 540 )
	Text:setTopBottom( 0, 0, 0, 52 )
	Text:linkToElementModel( self, "displayText", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			Text.Text0:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( Text )
	self.Text = Text
	
	local SelectionIndicator = CoD.Border.new( menu, controller )
	SelectionIndicator:setLeftRight( 0, 0, 12, 18 )
	SelectionIndicator:setTopBottom( 0, 0, 0, 52 )
	SelectionIndicator:setRGB( 1, 0.41, 0 )
	SelectionIndicator:setAlpha( 0 )
	self:addElement( SelectionIndicator )
	self.SelectionIndicator = SelectionIndicator
	
	self.resetProperties = function ()
		SelectionIndicator:completeAnimation()
		Background:completeAnimation()
		Text:completeAnimation()
		SelectionIndicator:setAlpha( 0 )
		Background:setAlpha( 0 )
		Text:setAlpha( 1 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 0 )
			end,
			LoseFocus = function ()
				self.resetProperties()
				self:setupElementClipCounter( 3 )
				local BackgroundFrame2 = function ( Background, event )
					if not event.interrupted then
						Background:beginAnimation( "keyframe", 150, false, false, CoD.TweenType.Linear )
					end
					Background:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( Background, event )
					else
						Background:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Background:completeAnimation()
				self.Background:setAlpha( 1 )
				BackgroundFrame2( Background, {} )
				local TextFrame2 = function ( Text, event )
					if not event.interrupted then
						Text:beginAnimation( "keyframe", 150, false, false, CoD.TweenType.Linear )
					end
					Text:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( Text, event )
					else
						Text:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Text:completeAnimation()
				self.Text:setAlpha( 1 )
				TextFrame2( Text, {} )
				local SelectionIndicatorFrame2 = function ( SelectionIndicator, event )
					if not event.interrupted then
						SelectionIndicator:beginAnimation( "keyframe", 150, false, false, CoD.TweenType.Linear )
					end
					SelectionIndicator:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( SelectionIndicator, event )
					else
						SelectionIndicator:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				SelectionIndicator:completeAnimation()
				self.SelectionIndicator:setAlpha( 1 )
				SelectionIndicatorFrame2( SelectionIndicator, {} )
			end,
			GainFocus = function ()
				self.resetProperties()
				self:setupElementClipCounter( 2 )
				local BackgroundFrame2 = function ( Background, event )
					if not event.interrupted then
						Background:beginAnimation( "keyframe", 150, false, false, CoD.TweenType.Linear )
					end
					Background:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( Background, event )
					else
						Background:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Background:completeAnimation()
				self.Background:setAlpha( 0 )
				BackgroundFrame2( Background, {} )
				local SelectionIndicatorFrame2 = function ( SelectionIndicator, event )
					if not event.interrupted then
						SelectionIndicator:beginAnimation( "keyframe", 150, false, false, CoD.TweenType.Linear )
					end
					SelectionIndicator:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( SelectionIndicator, event )
					else
						SelectionIndicator:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				SelectionIndicator:completeAnimation()
				self.SelectionIndicator:setAlpha( 0 )
				SelectionIndicatorFrame2( SelectionIndicator, {} )
			end,
			Focus = function ()
				self.resetProperties()
				self:setupElementClipCounter( 2 )
				local BackgroundFrame2 = function ( Background, event )
					local BackgroundFrame3 = function ( Background, event )
						if not event.interrupted then
							Background:beginAnimation( "keyframe", 500, true, true, CoD.TweenType.Linear )
						end
						Background:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( Background, event )
						else
							Background:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						BackgroundFrame3( Background, event )
						return 
					else
						Background:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
						Background:setAlpha( 0.75 )
						Background:registerEventHandler( "transition_complete_keyframe", BackgroundFrame3 )
					end
				end
				
				Background:completeAnimation()
				self.Background:setAlpha( 1 )
				BackgroundFrame2( Background, {} )
				local TextFrame2 = function ( Text, event )
					if not event.interrupted then
						Text:beginAnimation( "keyframe", 1000, true, true, CoD.TweenType.Linear )
					end
					Text:setAlpha( 0.8 )
					if event.interrupted then
						self.clipFinished( Text, event )
					else
						Text:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Text:completeAnimation()
				self.Text:setAlpha( 0.8 )
				TextFrame2( Text, {} )
				self.nextClip = "Focus"
			end
		}
	}
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.Text:close()
		self.SelectionIndicator:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

