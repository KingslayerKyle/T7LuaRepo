require( "ui.uieditor.widgets.Lobby.Common.FE_TitleNumBrdr" )

CoD.FirstTimeBrightnessListWidget = InheritFrom( LUI.UIElement )
CoD.FirstTimeBrightnessListWidget.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.FirstTimeBrightnessListWidget )
	self.id = "FirstTimeBrightnessListWidget"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 10 )
	self:setTopBottom( true, false, 0, 20 )
	self:makeFocusable()
	self:setHandleMouse( true )
	
	local Pip = LUI.UIImage.new()
	Pip:setLeftRight( true, false, 0, 10 )
	Pip:setTopBottom( true, false, 0, 20 )
	Pip:setAlpha( 0 )
	self:addElement( Pip )
	self.Pip = Pip
	
	local PipTop = LUI.UIImage.new()
	PipTop:setLeftRight( true, false, 0, 10 )
	PipTop:setTopBottom( true, false, -3, 0 )
	PipTop:setRGB( ColorSet.FocusColor.r, ColorSet.FocusColor.g, ColorSet.FocusColor.b )
	PipTop:setAlpha( 0 )
	self:addElement( PipTop )
	self.PipTop = PipTop
	
	local PipBottom = LUI.UIImage.new()
	PipBottom:setLeftRight( true, false, 0, 10 )
	PipBottom:setTopBottom( true, false, 20, 23 )
	PipBottom:setRGB( ColorSet.FocusColor.r, ColorSet.FocusColor.g, ColorSet.FocusColor.b )
	PipBottom:setAlpha( 0 )
	self:addElement( PipBottom )
	self.PipBottom = PipBottom
	
	local PipBlack = LUI.UIImage.new()
	PipBlack:setLeftRight( true, false, 1, 9 )
	PipBlack:setTopBottom( true, false, 1.25, 18.75 )
	PipBlack:setRGB( 0, 0, 0 )
	self:addElement( PipBlack )
	self.PipBlack = PipBlack
	
	local FETitleNumBrdr0 = CoD.FE_TitleNumBrdr.new( menu, controller )
	FETitleNumBrdr0:setLeftRight( true, true, 0, 0 )
	FETitleNumBrdr0:setTopBottom( false, false, -10, 10 )
	self:addElement( FETitleNumBrdr0 )
	self.FETitleNumBrdr0 = FETitleNumBrdr0
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 4 )
				Pip:completeAnimation()
				self.Pip:setAlpha( 0.7 )
				self.clipFinished( Pip, {} )
				PipTop:completeAnimation()
				self.PipTop:setAlpha( 0 )
				self.clipFinished( PipTop, {} )
				PipBottom:completeAnimation()
				self.PipBottom:setAlpha( 0 )
				self.clipFinished( PipBottom, {} )
				PipBlack:completeAnimation()
				self.PipBlack:setAlpha( 0 )
				self.clipFinished( PipBlack, {} )
			end,
			Focus = function ()
				self:setupElementClipCounter( 4 )
				Pip:completeAnimation()
				self.Pip:setAlpha( 0.7 )
				self.clipFinished( Pip, {} )
				PipTop:completeAnimation()
				self.PipTop:setAlpha( 1 )
				self.clipFinished( PipTop, {} )
				PipBottom:completeAnimation()
				self.PipBottom:setAlpha( 1 )
				self.clipFinished( PipBottom, {} )
				PipBlack:completeAnimation()
				self.PipBlack:setAlpha( 0 )
				self.clipFinished( PipBlack, {} )
			end
		},
		Empty = {
			DefaultClip = function ()
				self:setupElementClipCounter( 5 )
				Pip:completeAnimation()
				self.Pip:setAlpha( 0 )
				self.clipFinished( Pip, {} )
				PipTop:completeAnimation()
				self.PipTop:setAlpha( 0 )
				self.clipFinished( PipTop, {} )
				PipBottom:completeAnimation()
				self.PipBottom:setAlpha( 0 )
				self.clipFinished( PipBottom, {} )
				PipBlack:completeAnimation()
				self.PipBlack:setAlpha( 1 )
				self.clipFinished( PipBlack, {} )
				FETitleNumBrdr0:completeAnimation()
				self.FETitleNumBrdr0:setAlpha( 1 )
				self.clipFinished( FETitleNumBrdr0, {} )
			end,
			Focus = function ()
				self:setupElementClipCounter( 4 )
				Pip:completeAnimation()
				self.Pip:setAlpha( 0.7 )
				self.clipFinished( Pip, {} )
				PipTop:completeAnimation()
				self.PipTop:setAlpha( 1 )
				self.clipFinished( PipTop, {} )
				PipBottom:completeAnimation()
				self.PipBottom:setAlpha( 1 )
				self.clipFinished( PipBottom, {} )
				PipBlack:completeAnimation()
				self.PipBlack:setAlpha( 0 )
				self.clipFinished( PipBlack, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "Empty",
			condition = function ( menu, element, event )
				return IsBrightnessSliderPipEmpty( element )
			end
		}
	} )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.FETitleNumBrdr0:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

