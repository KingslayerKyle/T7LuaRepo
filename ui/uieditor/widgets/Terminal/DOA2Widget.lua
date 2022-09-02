-- 2eba02379c504df6dd3228ba111a008f
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.Terminal.FocusWidget_BG" )

CoD.DOA2Widget = InheritFrom( LUI.UIElement )
CoD.DOA2Widget.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.DOA2Widget )
	self.id = "DOA2Widget"
	self.soundSet = "none"
	self:setLeftRight( true, false, 0, 216 )
	self:setTopBottom( true, false, 0, 157 )
	self:makeFocusable()
	self:setHandleMouse( true )
	self.anyChildUsesUpdateState = true
	
	local FocusWidgetBG = CoD.FocusWidget_BG.new( menu, controller )
	FocusWidgetBG:setLeftRight( true, true, -3, -77 )
	FocusWidgetBG:setTopBottom( true, false, 132, 154 )
	FocusWidgetBG:setAlpha( 0 )
	self:addElement( FocusWidgetBG )
	self.FocusWidgetBG = FocusWidgetBG
	
	local Image0 = LUI.UIImage.new()
	Image0:setLeftRight( true, false, 1, 216 )
	Image0:setTopBottom( true, false, 0, 128 )
	Image0:setImage( RegisterImage( "uie_t7_menu_cp_front_end_mapvote_doa_bo3" ) )
	self:addElement( Image0 )
	self.Image0 = Image0
	
	local DeadOps = LUI.UITightText.new()
	DeadOps:setLeftRight( true, false, 4.79, 100.79 )
	DeadOps:setTopBottom( true, false, 134, 152 )
	DeadOps:setText( Engine.Localize( "MENU_DOA2_TITLE" ) )
	DeadOps:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	self:addElement( DeadOps )
	self.DeadOps = DeadOps
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )

				FocusWidgetBG:completeAnimation()
				self.FocusWidgetBG:setAlpha( 0 )
				self.clipFinished( FocusWidgetBG, {} )
			end,
			GainFocus = function ()
				self:setupElementClipCounter( 1 )

				local FocusWidgetBGFrame2 = function ( FocusWidgetBG, event )
					if not event.interrupted then
						FocusWidgetBG:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
					end
					FocusWidgetBG:setLeftRight( true, true, 7, -77 )
					FocusWidgetBG:setTopBottom( true, false, 126, 148 )
					FocusWidgetBG:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( FocusWidgetBG, event )
					else
						FocusWidgetBG:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				FocusWidgetBG:completeAnimation()
				self.FocusWidgetBG:setLeftRight( true, true, 7, -77 )
				self.FocusWidgetBG:setTopBottom( true, false, 126, 148 )
				self.FocusWidgetBG:setAlpha( 0 )
				FocusWidgetBGFrame2( FocusWidgetBG, {} )
			end,
			Focus = function ()
				self:setupElementClipCounter( 1 )

				FocusWidgetBG:completeAnimation()
				self.FocusWidgetBG:setLeftRight( true, true, -3, -77 )
				self.FocusWidgetBG:setTopBottom( true, false, 132, 154 )
				self.FocusWidgetBG:setAlpha( 1 )
				self.clipFinished( FocusWidgetBG, {} )
			end,
			LoseFocus = function ()
				self:setupElementClipCounter( 1 )

				local FocusWidgetBGFrame2 = function ( FocusWidgetBG, event )
					if not event.interrupted then
						FocusWidgetBG:beginAnimation( "keyframe", 119, false, false, CoD.TweenType.Linear )
					end
					FocusWidgetBG:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( FocusWidgetBG, event )
					else
						FocusWidgetBG:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				FocusWidgetBG:completeAnimation()
				self.FocusWidgetBG:setAlpha( 1 )
				FocusWidgetBGFrame2( FocusWidgetBG, {} )
			end
		}
	}

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.FocusWidgetBG:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

