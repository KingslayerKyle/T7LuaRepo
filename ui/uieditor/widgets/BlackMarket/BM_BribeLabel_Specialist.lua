-- 3124f82126d8738760c729e0e3f38b14
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.BlackMarket.BM_BribeLabel_Backing" )

CoD.BM_BribeLabel_Specialist = InheritFrom( LUI.UIElement )
CoD.BM_BribeLabel_Specialist.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( true )
	self:setClass( CoD.BM_BribeLabel_Specialist )
	self.id = "BM_BribeLabel_Specialist"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 300 )
	self:setTopBottom( true, false, 0, 56 )
	self.anyChildUsesUpdateState = true
	
	local BMBribeLabelBacking = CoD.BM_BribeLabel_Backing.new( menu, controller )
	BMBribeLabelBacking:setLeftRight( true, true, 0, 0 )
	BMBribeLabelBacking:setTopBottom( true, true, 0, 0 )
	self:addElement( BMBribeLabelBacking )
	self.BMBribeLabelBacking = BMBribeLabelBacking
	
	local Text = LUI.UIText.new()
	Text:setLeftRight( true, true, 80, -37.5 )
	Text:setTopBottom( false, false, -3.5, 10.5 )
	Text:setRGB( 0, 0, 0 )
	Text:setText( Engine.Localize( "CONTRACT_BM_BRIBE_ACTIVE" ) )
	Text:setTTF( "fonts/FoundryGridnik-Medium.ttf" )
	Text:setLetterSpacing( -0.2 )
	Text:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_RIGHT )
	Text:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	Text:registerEventHandler( "menu_loaded", function ( element, event )
		local f2_local0 = nil
		SetupAutoHorizontalAlignArabicText( element )
		if not f2_local0 then
			f2_local0 = element:dispatchEventToChildren( event )
		end
		return f2_local0
	end )
	LUI.OverrideFunction_CallOriginalFirst( Text, "setText", function ( element, controller )
		ScaleWidgetToLabelRightAligned( self, element, 50 )
	end )
	self:addElement( Text )
	self.Text = Text
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				BMBribeLabelBacking:completeAnimation()
				self.BMBribeLabelBacking:setAlpha( 0 )
				self.clipFinished( BMBribeLabelBacking, {} )
				Text:completeAnimation()
				self.Text:setAlpha( 0 )
				self.clipFinished( Text, {} )
			end,
			Visible = function ()
				self:setupElementClipCounter( 2 )
				local BMBribeLabelBackingFrame2 = function ( BMBribeLabelBacking, event )
					if not event.interrupted then
						BMBribeLabelBacking:beginAnimation( "keyframe", 300, true, false, CoD.TweenType.Bounce )
					end
					BMBribeLabelBacking:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( BMBribeLabelBacking, event )
					else
						BMBribeLabelBacking:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				BMBribeLabelBacking:completeAnimation()
				self.BMBribeLabelBacking:setAlpha( 0 )
				BMBribeLabelBackingFrame2( BMBribeLabelBacking, {} )
				local TextFrame2 = function ( Text, event )
					if not event.interrupted then
						Text:beginAnimation( "keyframe", 300, true, false, CoD.TweenType.Bounce )
					end
					Text:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( Text, event )
					else
						Text:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Text:completeAnimation()
				self.Text:setAlpha( 0 )
				TextFrame2( Text, {} )
			end
		},
		Visible = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				BMBribeLabelBacking:completeAnimation()
				self.BMBribeLabelBacking:setAlpha( 1 )
				self.clipFinished( BMBribeLabelBacking, {} )
				Text:completeAnimation()
				self.Text:setAlpha( 1 )
				self.clipFinished( Text, {} )
			end,
			DefaultState = function ()
				self:setupElementClipCounter( 2 )
				local BMBribeLabelBackingFrame2 = function ( BMBribeLabelBacking, event )
					if not event.interrupted then
						BMBribeLabelBacking:beginAnimation( "keyframe", 300, true, false, CoD.TweenType.Bounce )
					end
					BMBribeLabelBacking:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( BMBribeLabelBacking, event )
					else
						BMBribeLabelBacking:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				BMBribeLabelBacking:completeAnimation()
				self.BMBribeLabelBacking:setAlpha( 1 )
				BMBribeLabelBackingFrame2( BMBribeLabelBacking, {} )
				local TextFrame2 = function ( Text, event )
					if not event.interrupted then
						Text:beginAnimation( "keyframe", 300, true, false, CoD.TweenType.Bounce )
					end
					Text:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( Text, event )
					else
						Text:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Text:completeAnimation()
				self.Text:setAlpha( 1 )
				TextFrame2( Text, {} )
			end
		}
	}
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.BMBribeLabelBacking:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

