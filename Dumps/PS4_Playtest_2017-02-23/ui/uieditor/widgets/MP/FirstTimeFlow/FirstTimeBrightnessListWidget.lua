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
	self:setLeftRight( 0, 0, 0, 15 )
	self:setTopBottom( 0, 0, 0, 30 )
	self:makeFocusable()
	self:setHandleMouse( true )
	
	local Pip = LUI.UIImage.new()
	Pip:setLeftRight( 0, 0, 0, 15 )
	Pip:setTopBottom( 0, 0, 0, 30 )
	Pip:setAlpha( 0 )
	self:addElement( Pip )
	self.Pip = Pip
	
	local PipTop = LUI.UIImage.new()
	PipTop:setLeftRight( 0, 0, 0, 15 )
	PipTop:setTopBottom( 0, 0, -4, 0 )
	PipTop:setRGB( ColorSet.FocusColor.r, ColorSet.FocusColor.g, ColorSet.FocusColor.b )
	PipTop:setAlpha( 0 )
	self:addElement( PipTop )
	self.PipTop = PipTop
	
	local PipBottom = LUI.UIImage.new()
	PipBottom:setLeftRight( 0, 0, 0, 15 )
	PipBottom:setTopBottom( 0, 0, 30, 34 )
	PipBottom:setRGB( ColorSet.FocusColor.r, ColorSet.FocusColor.g, ColorSet.FocusColor.b )
	PipBottom:setAlpha( 0 )
	self:addElement( PipBottom )
	self.PipBottom = PipBottom
	
	local PipBlack = LUI.UIImage.new()
	PipBlack:setLeftRight( 0, 0, 2, 14 )
	PipBlack:setTopBottom( 0, 0, 2, 28 )
	PipBlack:setRGB( 0, 0, 0 )
	self:addElement( PipBlack )
	self.PipBlack = PipBlack
	
	local FETitleNumBrdr0 = CoD.FE_TitleNumBrdr.new( menu, controller )
	FETitleNumBrdr0:setLeftRight( 0, 1, 0, 0 )
	FETitleNumBrdr0:setTopBottom( 0.5, 0.5, -15, 15 )
	self:addElement( FETitleNumBrdr0 )
	self.FETitleNumBrdr0 = FETitleNumBrdr0
	
	self.resetProperties = function ()
		Pip:completeAnimation()
		PipBlack:completeAnimation()
		PipTop:completeAnimation()
		PipBottom:completeAnimation()
		Pip:setAlpha( 0 )
		PipBlack:setAlpha( 1 )
		PipTop:setAlpha( 0 )
		PipBottom:setAlpha( 0 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 2 )
				Pip:completeAnimation()
				self.Pip:setAlpha( 0.7 )
				self.clipFinished( Pip, {} )
				PipBlack:completeAnimation()
				self.PipBlack:setAlpha( 0 )
				self.clipFinished( PipBlack, {} )
			end,
			Focus = function ()
				self.resetProperties()
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
				self.resetProperties()
				self:setupElementClipCounter( 0 )
			end,
			Focus = function ()
				self.resetProperties()
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
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.FETitleNumBrdr0:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

