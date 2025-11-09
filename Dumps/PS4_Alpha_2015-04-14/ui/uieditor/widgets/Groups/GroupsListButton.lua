require( "ui.uieditor.widgets.button_internal" )
require( "ui.uieditor.widgets.Border" )

CoD.GroupsListButton = InheritFrom( LUI.UIElement )
CoD.GroupsListButton.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.GroupsListButton )
	self.id = "GroupsListButton"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 360 )
	self:setTopBottom( true, false, 0, 35 )
	self:makeFocusable()
	self:setHandleMouse( true )
	self.anyChildUsesUpdateState = true
	
	local Background = LUI.UIImage.new()
	Background:setLeftRight( true, false, 15, 360 )
	Background:setTopBottom( true, false, 0, 35 )
	Background:setRGB( 0.11, 0.14, 0.2 )
	Background:setAlpha( 0 )
	Background:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( Background )
	self.Background = Background
	
	local Text = CoD.button_internal.new( menu, controller )
	Text:setLeftRight( true, false, 30, 360 )
	Text:setTopBottom( true, false, 0, 35 )
	Text:setRGB( 0.91, 0.7, 0.19 )
	Text:linkToElementModel( self, "displayText", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			Text.Text0:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( Text )
	self.Text = Text
	
	local SelectionIndicator = CoD.Border.new( menu, controller )
	SelectionIndicator:setLeftRight( true, false, 8, 12 )
	SelectionIndicator:setTopBottom( true, false, 0, 35 )
	SelectionIndicator:setRGB( 1, 0.41, 0 )
	SelectionIndicator:setAlpha( 0 )
	self:addElement( SelectionIndicator )
	self.SelectionIndicator = SelectionIndicator
	
	local SelectedIcon = LUI.UIImage.new()
	SelectedIcon:setLeftRight( true, false, 322, 338 )
	SelectedIcon:setTopBottom( true, false, 9.5, 25.5 )
	SelectedIcon:setRGB( 0.55, 0.77, 0.25 )
	SelectedIcon:setImage( RegisterImage( "uie_t7_hud_cac_equipped_16" ) )
	SelectedIcon:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( SelectedIcon )
	self.SelectedIcon = SelectedIcon
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 4 )
				Background:completeAnimation()
				self.Background:setRGB( 0.11, 0.14, 0.2 )
				self.Background:setAlpha( 0 )
				self.clipFinished( Background, {} )
				Text:completeAnimation()
				self.Text:setLeftRight( true, false, 30, 360 )
				self.Text:setTopBottom( true, false, 0, 35 )
				self.Text:setRGB( 1, 1, 1 )
				self.Text:setAlpha( 1 )
				self.clipFinished( Text, {} )
				SelectionIndicator:completeAnimation()
				self.SelectionIndicator:setAlpha( 0 )
				self.clipFinished( SelectionIndicator, {} )
				SelectedIcon:completeAnimation()
				self.SelectedIcon:setRGB( 0.55, 0.77, 0.25 )
				self.SelectedIcon:setAlpha( 0 )
				self.clipFinished( SelectedIcon, {} )
			end,
			LoseFocus = function ()
				self:setupElementClipCounter( 4 )
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
				SelectedIcon:completeAnimation()
				self.SelectedIcon:setAlpha( 0 )
				self.clipFinished( SelectedIcon, {} )
			end,
			GainFocus = function ()
				self:setupElementClipCounter( 3 )
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
				SelectedIcon:completeAnimation()
				self.SelectedIcon:setAlpha( 0 )
				self.clipFinished( SelectedIcon, {} )
			end,
			Focus = function ()
				self:setupElementClipCounter( 3 )
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
					Text:setRGB( 1, 1, 1 )
					Text:setAlpha( 0.8 )
					if event.interrupted then
						self.clipFinished( Text, event )
					else
						Text:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Text:completeAnimation()
				self.Text:setRGB( 1, 1, 1 )
				self.Text:setAlpha( 0.8 )
				TextFrame2( Text, {} )
				SelectedIcon:completeAnimation()
				self.SelectedIcon:setAlpha( 0 )
				self.clipFinished( SelectedIcon, {} )
				self.nextClip = "Focus"
			end
		},
		WithSelectedIcon = {
			DefaultClip = function ()
				self:setupElementClipCounter( 4 )
				Background:completeAnimation()
				self.Background:setRGB( 0.11, 0.14, 0.2 )
				self.Background:setAlpha( 0 )
				self.clipFinished( Background, {} )
				Text:completeAnimation()
				self.Text:setLeftRight( true, false, 30, 360 )
				self.Text:setTopBottom( true, false, 0, 35 )
				self.Text:setRGB( 1, 1, 1 )
				self.Text:setAlpha( 1 )
				self.clipFinished( Text, {} )
				SelectionIndicator:completeAnimation()
				self.SelectionIndicator:setAlpha( 0 )
				self.clipFinished( SelectionIndicator, {} )
				SelectedIcon:completeAnimation()
				self.SelectedIcon:setRGB( 0.55, 0.77, 0.25 )
				self.SelectedIcon:setAlpha( 1 )
				self.clipFinished( SelectedIcon, {} )
			end,
			LoseFocus = function ()
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
		},
		Header = {
			DefaultClip = function ()
				self:setupElementClipCounter( 4 )
				Background:completeAnimation()
				self.Background:setAlpha( 0 )
				self.clipFinished( Background, {} )
				Text:completeAnimation()
				self.Text:setRGB( 0.91, 0.7, 0.19 )
				self.clipFinished( Text, {} )
				SelectionIndicator:completeAnimation()
				self.SelectionIndicator:setAlpha( 0 )
				self.clipFinished( SelectionIndicator, {} )
				SelectedIcon:completeAnimation()
				self.SelectedIcon:setAlpha( 0 )
				self.clipFinished( SelectedIcon, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "WithSelectedIcon",
			condition = function ( menu, element, event )
				return DoesGroupListHaveSelectedIcon( element )
			end
		},
		{
			stateName = "Header",
			condition = function ( menu, element, event )
				return IsGroupListHeader( element )
			end
		}
	} )
	self.close = function ( self )
		self.Text:close()
		self.SelectionIndicator:close()
		CoD.GroupsListButton.super.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

