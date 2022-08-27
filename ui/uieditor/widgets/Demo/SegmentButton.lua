-- 15001bef2fbd1e308cfd49cba548d96f
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.CAC.cac_ButtonBoxLrgInactive" )
require( "ui.uieditor.widgets.CAC.cac_ButtonBoxLrgInactiveDiags" )
require( "ui.uieditor.widgets.HelperWidgets.TextWithBg" )
require( "ui.uieditor.widgets.Lobby.Common.FE_FocusBarContainer" )

CoD.SegmentButton = InheritFrom( LUI.UIElement )
CoD.SegmentButton.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.SegmentButton )
	self.id = "SegmentButton"
	self.soundSet = "ChooseDecal"
	self:setLeftRight( true, false, 0, 214 )
	self:setTopBottom( true, false, 0, 120 )
	self:makeFocusable()
	self:setHandleMouse( true )
	self.anyChildUsesUpdateState = true
	
	local BoxButtonLrgInactive0 = CoD.cac_ButtonBoxLrgInactive.new( menu, controller )
	BoxButtonLrgInactive0:setLeftRight( true, true, -2, 2 )
	BoxButtonLrgInactive0:setTopBottom( true, true, -2, 2 )
	BoxButtonLrgInactive0:setRGB( 0.87, 0.97, 1 )
	BoxButtonLrgInactive0:setAlpha( 0.7 )
	self:addElement( BoxButtonLrgInactive0 )
	self.BoxButtonLrgInactive0 = BoxButtonLrgInactive0
	
	local bg = LUI.UIImage.new()
	bg:setLeftRight( true, true, 2, -2 )
	bg:setTopBottom( true, true, 2, -2 )
	bg:setRGB( ColorSet.Orange.r, ColorSet.Orange.g, ColorSet.Orange.b )
	bg:setAlpha( 0 )
	self:addElement( bg )
	self.bg = bg
	
	local BoxButtonLrgInactiveDiag = CoD.cac_ButtonBoxLrgInactiveDiags.new( menu, controller )
	BoxButtonLrgInactiveDiag:setLeftRight( true, true, 0, -1 )
	BoxButtonLrgInactiveDiag:setTopBottom( true, true, 0, -1 )
	BoxButtonLrgInactiveDiag:setRGB( ColorSet.Disabled.r, ColorSet.Disabled.g, ColorSet.Disabled.b )
	self:addElement( BoxButtonLrgInactiveDiag )
	self.BoxButtonLrgInactiveDiag = BoxButtonLrgInactiveDiag
	
	local ImageViewer = LUI.UIElement.new()
	ImageViewer:setLeftRight( true, true, 1, -2 )
	ImageViewer:setTopBottom( true, true, 1, -2.5 )
	ImageViewer:linkToElementModel( self, "segmentNumber", true, function ( model )
		local segmentNumber = Engine.GetModelValue( model )
		if segmentNumber then
			ImageViewer:setupImageViewer( GetImageViewerParams( "UI_SCREENSHOT_TYPE_THUMBNAIL", segmentNumber ) )
		end
	end )
	self:addElement( ImageViewer )
	self.ImageViewer = ImageViewer
	
	local durationText = CoD.TextWithBg.new( menu, controller )
	durationText:setLeftRight( false, true, -45.5, -2 )
	durationText:setTopBottom( true, false, 4, 22 )
	durationText.Bg:setAlpha( 0.5 )
	durationText.Text:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	durationText.Text:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	self:addElement( durationText )
	self.durationText = durationText
	
	local segmentName = CoD.TextWithBg.new( menu, controller )
	segmentName:setLeftRight( true, true, 2, -2 )
	segmentName:setTopBottom( false, true, -23, -3 )
	segmentName.Bg:setAlpha( 0.5 )
	segmentName.Text:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	segmentName.Text:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	self:addElement( segmentName )
	self.segmentName = segmentName
	
	local segmentNumber = CoD.TextWithBg.new( menu, controller )
	segmentNumber:setLeftRight( true, false, 2, 27.5 )
	segmentNumber:setTopBottom( true, false, 4, 22 )
	segmentNumber.Bg:setRGB( 1, 1, 1 )
	segmentNumber.Bg:setAlpha( 0.75 )
	segmentNumber.Text:setRGB( ColorSet.BadgeText.r, ColorSet.BadgeText.g, ColorSet.BadgeText.b )
	segmentNumber.Text:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	segmentNumber.Text:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	self:addElement( segmentNumber )
	self.segmentNumber = segmentNumber
	
	local FocusBarT = CoD.FE_FocusBarContainer.new( menu, controller )
	FocusBarT:setLeftRight( true, true, 0, 0 )
	FocusBarT:setTopBottom( true, false, -1, 3 )
	FocusBarT:setAlpha( 0 )
	FocusBarT:setZoom( 1 )
	self:addElement( FocusBarT )
	self.FocusBarT = FocusBarT
	
	local FocusBarB = CoD.FE_FocusBarContainer.new( menu, controller )
	FocusBarB:setLeftRight( true, true, 0, 0 )
	FocusBarB:setTopBottom( false, true, -3, 1 )
	FocusBarB:setAlpha( 0 )
	FocusBarB:setZoom( 1 )
	self:addElement( FocusBarB )
	self.FocusBarB = FocusBarB
	
	self.bg:linkToElementModel( self, "img", true, function ( model )
		local img = Engine.GetModelValue( model )
		if img then
			bg:setImage( RegisterImage( img ) )
		end
	end )
	self.durationText:linkToElementModel( self, "duration", true, function ( model )
		local duration = Engine.GetModelValue( model )
		if duration then
			durationText.Text:setText( Engine.Localize( duration ) )
		end
	end )
	self.segmentName:linkToElementModel( self, "name", true, function ( model )
		local name = Engine.GetModelValue( model )
		if name then
			segmentName.Text:setText( Engine.Localize( name ) )
		end
	end )
	self.segmentNumber:linkToElementModel( self, "segmentNumber", true, function ( model )
		local _segmentNumber = Engine.GetModelValue( model )
		if _segmentNumber then
			segmentNumber.Text:setText( Engine.Localize( _segmentNumber ) )
		end
	end )
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 8 )
				BoxButtonLrgInactive0:completeAnimation()
				self.BoxButtonLrgInactive0:setAlpha( 0.4 )
				self.clipFinished( BoxButtonLrgInactive0, {} )
				bg:completeAnimation()
				self.bg:setRGB( ColorSet.WaypointNeutral.r, ColorSet.WaypointNeutral.g, ColorSet.WaypointNeutral.b )
				self.bg:setAlpha( 0.4 )
				self.clipFinished( bg, {} )
				BoxButtonLrgInactiveDiag:completeAnimation()
				self.BoxButtonLrgInactiveDiag:setRGB( 1, 1, 1 )
				self.BoxButtonLrgInactiveDiag:setAlpha( 0 )
				self.clipFinished( BoxButtonLrgInactiveDiag, {} )
				ImageViewer:completeAnimation()
				self.ImageViewer:setAlpha( 1 )
				self.clipFinished( ImageViewer, {} )
				durationText:completeAnimation()
				self.durationText:setAlpha( 1 )
				self.clipFinished( durationText, {} )
				segmentName:completeAnimation()
				self.segmentName:setAlpha( 1 )
				self.clipFinished( segmentName, {} )
				FocusBarT:completeAnimation()
				self.FocusBarT:setAlpha( 0 )
				self.clipFinished( FocusBarT, {} )
				FocusBarB:completeAnimation()
				self.FocusBarB:setAlpha( 0 )
				self.clipFinished( FocusBarB, {} )
			end,
			Focus = function ()
				self:setupElementClipCounter( 5 )
				BoxButtonLrgInactive0:completeAnimation()
				self.BoxButtonLrgInactive0:setAlpha( 0.7 )
				self.clipFinished( BoxButtonLrgInactive0, {} )
				bg:completeAnimation()
				self.bg:setRGB( ColorSet.WaypointNeutral.r, ColorSet.WaypointNeutral.g, ColorSet.WaypointNeutral.b )
				self.bg:setAlpha( 1 )
				self.clipFinished( bg, {} )
				BoxButtonLrgInactiveDiag:completeAnimation()
				self.BoxButtonLrgInactiveDiag:setRGB( 1, 1, 1 )
				self.clipFinished( BoxButtonLrgInactiveDiag, {} )
				FocusBarT:completeAnimation()
				self.FocusBarT:setLeftRight( true, true, 0, 0 )
				self.FocusBarT:setTopBottom( true, false, -1, 3 )
				self.FocusBarT:setAlpha( 1 )
				self.clipFinished( FocusBarT, {} )
				FocusBarB:completeAnimation()
				self.FocusBarB:setLeftRight( true, true, 0, 0 )
				self.FocusBarB:setTopBottom( false, true, -3, 1 )
				self.FocusBarB:setAlpha( 1 )
				self.clipFinished( FocusBarB, {} )
			end
		},
		EmptyState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 7 )
				bg:completeAnimation()
				self.bg:setRGB( ColorSet.WaypointNeutral.r, ColorSet.WaypointNeutral.g, ColorSet.WaypointNeutral.b )
				self.bg:setAlpha( 0 )
				self.clipFinished( bg, {} )
				BoxButtonLrgInactiveDiag:completeAnimation()
				self.BoxButtonLrgInactiveDiag:setRGB( 1, 1, 1 )
				self.BoxButtonLrgInactiveDiag:setAlpha( 0 )
				self.clipFinished( BoxButtonLrgInactiveDiag, {} )
				ImageViewer:completeAnimation()
				self.ImageViewer:setAlpha( 0 )
				self.clipFinished( ImageViewer, {} )
				durationText:completeAnimation()
				self.durationText:setAlpha( 0 )
				self.clipFinished( durationText, {} )
				segmentName:completeAnimation()
				self.segmentName:setAlpha( 0 )
				self.clipFinished( segmentName, {} )
				FocusBarT:completeAnimation()
				self.FocusBarT:setAlpha( 0 )
				self.clipFinished( FocusBarT, {} )
				FocusBarB:completeAnimation()
				self.FocusBarB:setAlpha( 0 )
				self.clipFinished( FocusBarB, {} )
			end
		},
		SelectedState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 7 )
				bg:completeAnimation()
				self.bg:setRGB( ColorSet.Orange.r, ColorSet.Orange.g, ColorSet.Orange.b )
				self.bg:setAlpha( 0.4 )
				self.clipFinished( bg, {} )
				BoxButtonLrgInactiveDiag:completeAnimation()
				self.BoxButtonLrgInactiveDiag:setRGB( 1, 1, 1 )
				self.BoxButtonLrgInactiveDiag:setAlpha( 0 )
				self.clipFinished( BoxButtonLrgInactiveDiag, {} )
				ImageViewer:completeAnimation()
				self.ImageViewer:setAlpha( 1 )
				self.clipFinished( ImageViewer, {} )
				durationText:completeAnimation()
				self.durationText:setAlpha( 1 )
				self.clipFinished( durationText, {} )
				segmentName:completeAnimation()
				self.segmentName:setAlpha( 1 )
				self.clipFinished( segmentName, {} )
				FocusBarT:completeAnimation()
				self.FocusBarT:setAlpha( 0 )
				self.clipFinished( FocusBarT, {} )
				FocusBarB:completeAnimation()
				self.FocusBarB:setAlpha( 0 )
				self.clipFinished( FocusBarB, {} )
			end,
			Focus = function ()
				self:setupElementClipCounter( 4 )
				bg:completeAnimation()
				self.bg:setRGB( ColorSet.Orange.r, ColorSet.Orange.g, ColorSet.Orange.b )
				self.bg:setAlpha( 0.4 )
				self.clipFinished( bg, {} )
				BoxButtonLrgInactiveDiag:completeAnimation()
				self.BoxButtonLrgInactiveDiag:setRGB( 1, 1, 1 )
				self.clipFinished( BoxButtonLrgInactiveDiag, {} )
				FocusBarT:completeAnimation()
				self.FocusBarT:setAlpha( 0 )
				self.clipFinished( FocusBarT, {} )
				FocusBarB:completeAnimation()
				self.FocusBarB:setAlpha( 0 )
				self.clipFinished( FocusBarB, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "EmptyState",
			condition = function ( menu, element, event )
				return IsDisabled( element, controller )
			end
		},
		{
			stateName = "SelectedState",
			condition = function ( menu, element, event )
				return IsSegmentInSelectedState( element, controller )
			end
		}
	} )
	self:linkToElementModel( self, "disabled", true, function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "disabled"
		} )
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.BoxButtonLrgInactive0:close()
		element.BoxButtonLrgInactiveDiag:close()
		element.durationText:close()
		element.segmentName:close()
		element.segmentNumber:close()
		element.FocusBarT:close()
		element.FocusBarB:close()
		element.bg:close()
		element.ImageViewer:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

