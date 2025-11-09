require( "ui.uieditor.widgets.Terminal.Generalframe" )
require( "ui.uieditor.widgets.Terminal.FocusWidget" )

CoD.ClanTagImageButton = InheritFrom( LUI.UIElement )
CoD.ClanTagImageButton.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.ClanTagImageButton )
	self.id = "ClanTagImageButton"
	self.soundSet = "none"
	self:setLeftRight( true, false, 0, 140 )
	self:setTopBottom( true, false, 0, 90 )
	self:makeFocusable()
	self:setHandleMouse( true )
	self.anyChildUsesUpdateState = true
	
	local Generalframe = CoD.Generalframe.new( menu, controller )
	Generalframe:setLeftRight( true, true, 0, 0 )
	Generalframe:setTopBottom( true, true, 0, 0 )
	self:addElement( Generalframe )
	self.Generalframe = Generalframe
	
	local FocusWidget = CoD.FocusWidget.new( menu, controller )
	FocusWidget:setLeftRight( true, true, -8, 8 )
	FocusWidget:setTopBottom( true, false, 0, 20 )
	FocusWidget:setAlpha( 0 )
	FocusWidget.Name:setText( Engine.Localize( "MENU_EMBLEMS_CAPS" ) )
	self:addElement( FocusWidget )
	self.FocusWidget = FocusWidget
	
	local TextBox = LUI.UIText.new()
	TextBox:setLeftRight( true, true, 0, 0 )
	TextBox:setTopBottom( false, false, -12.5, 12.5 )
	TextBox:setTTF( "fonts/default.ttf" )
	TextBox:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	TextBox:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	TextBox:subscribeToGlobalModel( controller, "PerController", "clanTag", function ( model )
		local clanTag = Engine.GetModelValue( model )
		if clanTag then
			TextBox:setText( Engine.Localize( StringAsClanTag( clanTag ) ) )
		end
	end )
	self:addElement( TextBox )
	self.TextBox = TextBox
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				FocusWidget:completeAnimation()
				self.FocusWidget:setAlpha( 0 )
				self.clipFinished( FocusWidget, {} )
			end,
			GainFocus = function ()
				self:setupElementClipCounter( 3 )
				local GeneralframeFrame2 = function ( Generalframe, event )
					if not event.interrupted then
						Generalframe:beginAnimation( "keyframe", 180, false, false, CoD.TweenType.Linear )
					end
					Generalframe:setLeftRight( true, true, 0, 0 )
					Generalframe:setTopBottom( true, true, 15, 15 )
					if event.interrupted then
						self.clipFinished( Generalframe, event )
					else
						Generalframe:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Generalframe:completeAnimation()
				self.Generalframe:setLeftRight( true, true, 0, 0 )
				self.Generalframe:setTopBottom( true, true, 0, 0 )
				GeneralframeFrame2( Generalframe, {} )
				local FocusWidgetFrame2 = function ( FocusWidget, event )
					if not event.interrupted then
						FocusWidget:beginAnimation( "keyframe", 180, false, false, CoD.TweenType.Linear )
					end
					FocusWidget:setLeftRight( true, true, -8, 8 )
					FocusWidget:setTopBottom( true, false, -10, 10 )
					FocusWidget:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( FocusWidget, event )
					else
						FocusWidget:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				FocusWidget:completeAnimation()
				self.FocusWidget:setLeftRight( true, true, -8, 8 )
				self.FocusWidget:setTopBottom( true, false, 0, 20 )
				self.FocusWidget:setAlpha( 0 )
				FocusWidgetFrame2( FocusWidget, {} )
				local TextBoxFrame2 = function ( TextBox, event )
					if not event.interrupted then
						TextBox:beginAnimation( "keyframe", 180, false, false, CoD.TweenType.Linear )
					end
					TextBox:setLeftRight( true, true, 0, 0 )
					TextBox:setTopBottom( false, false, 2.5, 27.5 )
					if event.interrupted then
						self.clipFinished( TextBox, event )
					else
						TextBox:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				TextBox:completeAnimation()
				self.TextBox:setLeftRight( true, true, 0, 0 )
				self.TextBox:setTopBottom( false, false, -12.5, 12.5 )
				TextBoxFrame2( TextBox, {} )
			end,
			Focus = function ()
				self:setupElementClipCounter( 3 )
				Generalframe:completeAnimation()
				self.Generalframe:setLeftRight( true, true, 0, 0 )
				self.Generalframe:setTopBottom( true, true, 15, 15 )
				self.clipFinished( Generalframe, {} )
				FocusWidget:completeAnimation()
				self.FocusWidget:setLeftRight( true, true, -8, 8 )
				self.FocusWidget:setTopBottom( true, false, -10, 10 )
				self.FocusWidget:setAlpha( 1 )
				self.clipFinished( FocusWidget, {} )
				TextBox:completeAnimation()
				self.TextBox:setLeftRight( true, true, 0, 0 )
				self.TextBox:setTopBottom( false, false, 2.5, 27.5 )
				self.clipFinished( TextBox, {} )
			end,
			LoseFocus = function ()
				self:setupElementClipCounter( 3 )
				local GeneralframeFrame2 = function ( Generalframe, event )
					if not event.interrupted then
						Generalframe:beginAnimation( "keyframe", 180, false, false, CoD.TweenType.Linear )
					end
					Generalframe:setLeftRight( true, true, 0, 0 )
					Generalframe:setTopBottom( true, true, 0, 0 )
					if event.interrupted then
						self.clipFinished( Generalframe, event )
					else
						Generalframe:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Generalframe:completeAnimation()
				self.Generalframe:setLeftRight( true, true, 0, 0 )
				self.Generalframe:setTopBottom( true, true, 15, 15 )
				GeneralframeFrame2( Generalframe, {} )
				local FocusWidgetFrame2 = function ( FocusWidget, event )
					if not event.interrupted then
						FocusWidget:beginAnimation( "keyframe", 180, false, false, CoD.TweenType.Linear )
					end
					FocusWidget:setLeftRight( true, true, -8, 8 )
					FocusWidget:setTopBottom( true, false, 0, 20 )
					FocusWidget:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( FocusWidget, event )
					else
						FocusWidget:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				FocusWidget:completeAnimation()
				self.FocusWidget:setLeftRight( true, true, -8, 8 )
				self.FocusWidget:setTopBottom( true, false, -10, 10 )
				self.FocusWidget:setAlpha( 1 )
				FocusWidgetFrame2( FocusWidget, {} )
				local TextBoxFrame2 = function ( TextBox, event )
					if not event.interrupted then
						TextBox:beginAnimation( "keyframe", 180, false, false, CoD.TweenType.Linear )
					end
					TextBox:setLeftRight( true, true, 0, 0 )
					TextBox:setTopBottom( false, false, -12.5, 12.5 )
					if event.interrupted then
						self.clipFinished( TextBox, event )
					else
						TextBox:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				TextBox:completeAnimation()
				self.TextBox:setLeftRight( true, true, 0, 0 )
				self.TextBox:setTopBottom( false, false, 2.5, 27.5 )
				TextBoxFrame2( TextBox, {} )
			end
		},
		Disabled = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )
			end,
			Focus = function ()
				self:setupElementClipCounter( 0 )
			end
		}
	}
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.Generalframe:close()
		element.FocusWidget:close()
		element.TextBox:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

