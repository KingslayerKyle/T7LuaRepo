-- 5b18def414b47242b46e63b8e2eea04f
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.MPHudWidgets.OutOfBounds.outofbounds_VignetteContainer" )
require( "ui.uieditor.widgets.MPHudWidgets.OutOfBounds.outofbounds_scrollbarwidget" )
require( "ui.uieditor.widgets.MPHudWidgets.OutOfBounds.outofbounds_arrowswidget" )
require( "ui.uieditor.widgets.MPHudWidgets.OutOfBounds.outofbounds_sidebar" )
require( "ui.uieditor.widgets.MPHudWidgets.OutOfBounds.outofbounds_timerwidget" )
require( "ui.uieditor.widgets.MPHudWidgets.OutOfBounds.outofbounds_timerframedots" )
require( "ui.uieditor.widgets.MPHudWidgets.OutOfBounds.outofbounds_warningboxwidget" )
require( "ui.uieditor.widgets.MPHudWidgets.OutOfBounds.outofbounds_dotblinkwidget" )

CoD.OutOfBounds = InheritFrom( LUI.UIElement )
CoD.OutOfBounds.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.OutOfBounds )
	self.id = "OutOfBounds"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 1280 )
	self:setTopBottom( true, false, 0, 720 )
	self.anyChildUsesUpdateState = true
	
	local outofboundsVignetteContainer = CoD.outofbounds_VignetteContainer.new( menu, controller )
	outofboundsVignetteContainer:setLeftRight( true, true, 2.5, 2.5 )
	outofboundsVignetteContainer:setTopBottom( true, true, 0, 0 )
	outofboundsVignetteContainer:setScale( 1.2 )
	self:addElement( outofboundsVignetteContainer )
	self.outofboundsVignetteContainer = outofboundsVignetteContainer
	
	local Timer = LUI.UITightText.new()
	Timer:setLeftRight( false, false, -51.5, 55.5 )
	Timer:setTopBottom( false, false, -108, -60 )
	Timer:setAlpha( 0 )
	Timer:setTTF( "fonts/FoundryGridnik-Bold.ttf" )
	Timer:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "uie_aberration_no_blur" ) )
	Timer:setShaderVector( 0, 0.1, 0, 0, 0 )
	Timer:setShaderVector( 1, 0, 0, 0, 0 )
	Timer:setShaderVector( 2, 0, 0, 0, 0 )
	Timer:setShaderVector( 3, 0, 0, 0, 0 )
	Timer:setShaderVector( 4, 0, 0, 0, 0 )
	Timer:subscribeToGlobalModel( controller, "HUDItems", "outOfBoundsEndTime", function ( model )
		local outOfBoundsEndTime = Engine.GetModelValue( model )
		if outOfBoundsEndTime then
			Timer:setupEndTimer( outOfBoundsEndTime )
		end
	end )
	self:addElement( Timer )
	self.Timer = Timer
	
	local outofboundsscrollbarwidget = CoD.outofbounds_scrollbarwidget.new( menu, controller )
	outofboundsscrollbarwidget:setLeftRight( false, false, 54.5, 302.88 )
	outofboundsscrollbarwidget:setTopBottom( false, false, -101.06, -61 )
	self:addElement( outofboundsscrollbarwidget )
	self.outofboundsscrollbarwidget = outofboundsscrollbarwidget
	
	local outofboundsscrollbarwidget0 = CoD.outofbounds_scrollbarwidget.new( menu, controller )
	outofboundsscrollbarwidget0:setLeftRight( false, false, -300.88, -52.5 )
	outofboundsscrollbarwidget0:setTopBottom( false, false, -101.06, -61 )
	outofboundsscrollbarwidget0:setYRot( 180 )
	self:addElement( outofboundsscrollbarwidget0 )
	self.outofboundsscrollbarwidget0 = outofboundsscrollbarwidget0
	
	local outofboundsscrollbarwidget1 = CoD.outofbounds_scrollbarwidget.new( menu, controller )
	outofboundsscrollbarwidget1:setLeftRight( false, false, 53.5, 301.88 )
	outofboundsscrollbarwidget1:setTopBottom( false, false, 55.94, 96 )
	outofboundsscrollbarwidget1:setYRot( 180 )
	self:addElement( outofboundsscrollbarwidget1 )
	self.outofboundsscrollbarwidget1 = outofboundsscrollbarwidget1
	
	local outofboundsscrollbarwidget2 = CoD.outofbounds_scrollbarwidget.new( menu, controller )
	outofboundsscrollbarwidget2:setLeftRight( false, false, -299.88, -51.5 )
	outofboundsscrollbarwidget2:setTopBottom( false, false, 55.94, 96 )
	self:addElement( outofboundsscrollbarwidget2 )
	self.outofboundsscrollbarwidget2 = outofboundsscrollbarwidget2
	
	local outofboundsarrowswidget1 = CoD.outofbounds_arrowswidget.new( menu, controller )
	outofboundsarrowswidget1:setLeftRight( false, false, 295.88, 415.1 )
	outofboundsarrowswidget1:setTopBottom( false, false, -113, 105 )
	outofboundsarrowswidget1:setAlpha( 0.4 )
	outofboundsarrowswidget1:setZoom( -30 )
	self:addElement( outofboundsarrowswidget1 )
	self.outofboundsarrowswidget1 = outofboundsarrowswidget1
	
	local outofboundsarrowswidget = CoD.outofbounds_arrowswidget.new( menu, controller )
	outofboundsarrowswidget:setLeftRight( false, false, 295.88, 415.1 )
	outofboundsarrowswidget:setTopBottom( false, false, -113, 105 )
	self:addElement( outofboundsarrowswidget )
	self.outofboundsarrowswidget = outofboundsarrowswidget
	
	local outofboundsarrowswidget00 = CoD.outofbounds_arrowswidget.new( menu, controller )
	outofboundsarrowswidget00:setLeftRight( false, false, -411.93, -292.72 )
	outofboundsarrowswidget00:setTopBottom( false, false, -113, 105 )
	outofboundsarrowswidget00:setAlpha( 0.4 )
	outofboundsarrowswidget00:setYRot( 180 )
	outofboundsarrowswidget00:setZoom( -30 )
	self:addElement( outofboundsarrowswidget00 )
	self.outofboundsarrowswidget00 = outofboundsarrowswidget00
	
	local outofboundsarrowswidget0 = CoD.outofbounds_arrowswidget.new( menu, controller )
	outofboundsarrowswidget0:setLeftRight( false, false, -411.93, -292.72 )
	outofboundsarrowswidget0:setTopBottom( false, false, -113, 105 )
	outofboundsarrowswidget0:setYRot( 180 )
	self:addElement( outofboundsarrowswidget0 )
	self.outofboundsarrowswidget0 = outofboundsarrowswidget0
	
	local outofboundssidebar = CoD.outofbounds_sidebar.new( menu, controller )
	outofboundssidebar:setLeftRight( false, false, 391.58, 654.83 )
	outofboundssidebar:setTopBottom( false, false, -17.31, 13.5 )
	self:addElement( outofboundssidebar )
	self.outofboundssidebar = outofboundssidebar
	
	local outofboundssidebar0 = CoD.outofbounds_sidebar.new( menu, controller )
	outofboundssidebar0:setLeftRight( false, false, -649.67, -386.42 )
	outofboundssidebar0:setTopBottom( false, false, -17.31, 13.5 )
	self:addElement( outofboundssidebar0 )
	self.outofboundssidebar0 = outofboundssidebar0
	
	local outofboundstimerwidget = CoD.outofbounds_timerwidget.new( menu, controller )
	outofboundstimerwidget:setLeftRight( false, false, -51.5, 55.5 )
	outofboundstimerwidget:setTopBottom( false, false, -108, -60 )
	self:addElement( outofboundstimerwidget )
	self.outofboundstimerwidget = outofboundstimerwidget
	
	local outofboundstimerframedots = CoD.outofbounds_timerframedots.new( menu, controller )
	outofboundstimerframedots:setLeftRight( false, false, -53.5, 58.5 )
	outofboundstimerframedots:setTopBottom( false, false, -108, -63 )
	self:addElement( outofboundstimerframedots )
	self.outofboundstimerframedots = outofboundstimerframedots
	
	local outofboundswarningboxwidget = CoD.outofbounds_warningboxwidget.new( menu, controller )
	outofboundswarningboxwidget:setLeftRight( false, false, -331.38, 333.38 )
	outofboundswarningboxwidget:setTopBottom( false, false, -97.23, 92.23 )
	self:addElement( outofboundswarningboxwidget )
	self.outofboundswarningboxwidget = outofboundswarningboxwidget
	
	local outofboundsdotblinkwidget = CoD.outofbounds_dotblinkwidget.new( menu, controller )
	outofboundsdotblinkwidget:setLeftRight( false, false, -2.5, 5.5 )
	outofboundsdotblinkwidget:setTopBottom( false, false, -172, -164 )
	self:addElement( outofboundsdotblinkwidget )
	self.outofboundsdotblinkwidget = outofboundsdotblinkwidget
	
	local outofboundsdotblinkwidget0 = CoD.outofbounds_dotblinkwidget.new( menu, controller )
	outofboundsdotblinkwidget0:setLeftRight( false, false, -2.5, 5.5 )
	outofboundsdotblinkwidget0:setTopBottom( false, false, 137, 145 )
	self:addElement( outofboundsdotblinkwidget0 )
	self.outofboundsdotblinkwidget0 = outofboundsdotblinkwidget0
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 17 )

				outofboundsVignetteContainer:completeAnimation()
				self.outofboundsVignetteContainer:setRGB( 0, 0, 0 )
				self.outofboundsVignetteContainer:setAlpha( 0 )
				self.outofboundsVignetteContainer:setScale( 1.2 )
				self.clipFinished( outofboundsVignetteContainer, {} )

				Timer:completeAnimation()
				self.Timer:setAlpha( 0 )
				self.clipFinished( Timer, {} )

				outofboundsscrollbarwidget:completeAnimation()
				self.outofboundsscrollbarwidget:setAlpha( 0 )
				self.clipFinished( outofboundsscrollbarwidget, {} )

				outofboundsscrollbarwidget0:completeAnimation()
				self.outofboundsscrollbarwidget0:setAlpha( 0 )
				self.clipFinished( outofboundsscrollbarwidget0, {} )

				outofboundsscrollbarwidget1:completeAnimation()
				self.outofboundsscrollbarwidget1:setAlpha( 0 )
				self.clipFinished( outofboundsscrollbarwidget1, {} )

				outofboundsscrollbarwidget2:completeAnimation()
				self.outofboundsscrollbarwidget2:setAlpha( 0 )
				self.clipFinished( outofboundsscrollbarwidget2, {} )

				outofboundsarrowswidget1:completeAnimation()
				self.outofboundsarrowswidget1:setAlpha( 0 )
				self.clipFinished( outofboundsarrowswidget1, {} )

				outofboundsarrowswidget:completeAnimation()
				self.outofboundsarrowswidget:setAlpha( 0 )
				self.clipFinished( outofboundsarrowswidget, {} )

				outofboundsarrowswidget00:completeAnimation()
				self.outofboundsarrowswidget00:setAlpha( 0 )
				self.clipFinished( outofboundsarrowswidget00, {} )

				outofboundsarrowswidget0:completeAnimation()
				self.outofboundsarrowswidget0:setAlpha( 0 )
				self.clipFinished( outofboundsarrowswidget0, {} )

				outofboundssidebar:completeAnimation()
				self.outofboundssidebar:setAlpha( 0 )
				self.clipFinished( outofboundssidebar, {} )

				outofboundssidebar0:completeAnimation()
				self.outofboundssidebar0:setAlpha( 0 )
				self.clipFinished( outofboundssidebar0, {} )

				outofboundstimerwidget:completeAnimation()
				self.outofboundstimerwidget:setLeftRight( false, false, -51.5, 55.5 )
				self.outofboundstimerwidget:setTopBottom( false, false, -108, -60 )
				self.outofboundstimerwidget:setAlpha( 0 )
				self.clipFinished( outofboundstimerwidget, {} )

				outofboundstimerframedots:completeAnimation()
				self.outofboundstimerframedots:setAlpha( 0 )
				self.clipFinished( outofboundstimerframedots, {} )

				outofboundswarningboxwidget:completeAnimation()
				self.outofboundswarningboxwidget:setAlpha( 0 )
				self.clipFinished( outofboundswarningboxwidget, {} )

				outofboundsdotblinkwidget:completeAnimation()
				self.outofboundsdotblinkwidget:setLeftRight( false, false, -2.5, 5.5 )
				self.outofboundsdotblinkwidget:setTopBottom( false, false, -172, -164 )
				self.outofboundsdotblinkwidget:setAlpha( 0 )
				self.clipFinished( outofboundsdotblinkwidget, {} )

				outofboundsdotblinkwidget0:completeAnimation()
				self.outofboundsdotblinkwidget0:setLeftRight( false, false, -2.5, 5.5 )
				self.outofboundsdotblinkwidget0:setTopBottom( false, false, 137, 145 )
				self.outofboundsdotblinkwidget0:setAlpha( 0 )
				self.clipFinished( outofboundsdotblinkwidget0, {} )
			end
		},
		IsOutOfBounds = {
			DefaultClip = function ()
				self:setupElementClipCounter( 17 )

				outofboundsVignetteContainer:completeAnimation()
				self.outofboundsVignetteContainer:setLeftRight( true, true, 0, 0 )
				self.outofboundsVignetteContainer:setTopBottom( true, true, 0, 0 )
				self.outofboundsVignetteContainer:setRGB( 1, 1, 1 )
				self.outofboundsVignetteContainer:setAlpha( 1 )
				self.outofboundsVignetteContainer:setScale( 1.2 )
				self.clipFinished( outofboundsVignetteContainer, {} )

				Timer:completeAnimation()
				self.Timer:setLeftRight( false, false, -51.5, 55.5 )
				self.Timer:setTopBottom( false, false, -108, -60 )
				self.Timer:setAlpha( 0 )
				self.clipFinished( Timer, {} )

				outofboundsscrollbarwidget:completeAnimation()
				self.outofboundsscrollbarwidget:setLeftRight( false, false, 54.5, 302.88 )
				self.outofboundsscrollbarwidget:setTopBottom( false, false, -101.06, -61 )
				self.outofboundsscrollbarwidget:setAlpha( 1 )
				self.clipFinished( outofboundsscrollbarwidget, {} )

				outofboundsscrollbarwidget0:completeAnimation()
				self.outofboundsscrollbarwidget0:setLeftRight( false, false, -300.88, -52.5 )
				self.outofboundsscrollbarwidget0:setTopBottom( false, false, -101.06, -61 )
				self.outofboundsscrollbarwidget0:setAlpha( 1 )
				self.clipFinished( outofboundsscrollbarwidget0, {} )

				outofboundsscrollbarwidget1:completeAnimation()
				self.outofboundsscrollbarwidget1:setLeftRight( false, false, 53.5, 301.88 )
				self.outofboundsscrollbarwidget1:setTopBottom( false, false, 55.94, 96 )
				self.outofboundsscrollbarwidget1:setAlpha( 1 )
				self.clipFinished( outofboundsscrollbarwidget1, {} )

				outofboundsscrollbarwidget2:completeAnimation()
				self.outofboundsscrollbarwidget2:setLeftRight( false, false, -299.88, -51.5 )
				self.outofboundsscrollbarwidget2:setTopBottom( false, false, 55.94, 96 )
				self.outofboundsscrollbarwidget2:setAlpha( 1 )
				self.clipFinished( outofboundsscrollbarwidget2, {} )

				outofboundsarrowswidget1:completeAnimation()
				self.outofboundsarrowswidget1:setLeftRight( false, false, 295.88, 415.1 )
				self.outofboundsarrowswidget1:setTopBottom( false, false, -113, 105 )
				self.outofboundsarrowswidget1:setAlpha( 0.4 )
				self.outofboundsarrowswidget1:setZoom( -30 )
				self.clipFinished( outofboundsarrowswidget1, {} )

				outofboundsarrowswidget:completeAnimation()
				self.outofboundsarrowswidget:setLeftRight( false, false, 295.88, 415.1 )
				self.outofboundsarrowswidget:setTopBottom( false, false, -113, 105 )
				self.outofboundsarrowswidget:setAlpha( 1 )
				self.clipFinished( outofboundsarrowswidget, {} )

				outofboundsarrowswidget00:completeAnimation()
				self.outofboundsarrowswidget00:setLeftRight( false, false, -411.93, -292.72 )
				self.outofboundsarrowswidget00:setTopBottom( false, false, -113, 105 )
				self.outofboundsarrowswidget00:setAlpha( 0.4 )
				self.outofboundsarrowswidget00:setZoom( -30 )
				self.clipFinished( outofboundsarrowswidget00, {} )

				outofboundsarrowswidget0:completeAnimation()
				self.outofboundsarrowswidget0:setLeftRight( false, false, -411.93, -292.72 )
				self.outofboundsarrowswidget0:setTopBottom( false, false, -113, 105 )
				self.outofboundsarrowswidget0:setAlpha( 1 )
				self.clipFinished( outofboundsarrowswidget0, {} )

				outofboundssidebar:completeAnimation()
				self.outofboundssidebar:setLeftRight( false, false, 391.58, 654.83 )
				self.outofboundssidebar:setTopBottom( false, false, -17.31, 13.5 )
				self.outofboundssidebar:setAlpha( 1 )
				self.clipFinished( outofboundssidebar, {} )

				outofboundssidebar0:completeAnimation()
				self.outofboundssidebar0:setLeftRight( false, false, -649.67, -386.42 )
				self.outofboundssidebar0:setTopBottom( false, false, -17.31, 13.5 )
				self.outofboundssidebar0:setAlpha( 1 )
				self.clipFinished( outofboundssidebar0, {} )

				outofboundstimerwidget:completeAnimation()
				self.outofboundstimerwidget:setLeftRight( false, false, -51.5, 55.5 )
				self.outofboundstimerwidget:setTopBottom( false, false, -108, -60 )
				self.outofboundstimerwidget:setAlpha( 1 )
				self.clipFinished( outofboundstimerwidget, {} )

				outofboundstimerframedots:completeAnimation()
				self.outofboundstimerframedots:setAlpha( 1 )
				self.clipFinished( outofboundstimerframedots, {} )

				outofboundswarningboxwidget:completeAnimation()
				self.outofboundswarningboxwidget:setLeftRight( false, false, -331.38, 333.38 )
				self.outofboundswarningboxwidget:setTopBottom( false, false, -97.23, 92.23 )
				self.outofboundswarningboxwidget:setAlpha( 1 )
				self.clipFinished( outofboundswarningboxwidget, {} )

				outofboundsdotblinkwidget:completeAnimation()
				self.outofboundsdotblinkwidget:setLeftRight( false, false, -2.5, 5.5 )
				self.outofboundsdotblinkwidget:setTopBottom( false, false, -172, -164 )
				self.outofboundsdotblinkwidget:setAlpha( 1 )
				self.clipFinished( outofboundsdotblinkwidget, {} )

				outofboundsdotblinkwidget0:completeAnimation()
				self.outofboundsdotblinkwidget0:setLeftRight( false, false, -2.5, 5.5 )
				self.outofboundsdotblinkwidget0:setTopBottom( false, false, 137, 145 )
				self.outofboundsdotblinkwidget0:setAlpha( 1 )
				self.clipFinished( outofboundsdotblinkwidget0, {} )
			end
		}
	}

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.outofboundsVignetteContainer:close()
		element.outofboundsscrollbarwidget:close()
		element.outofboundsscrollbarwidget0:close()
		element.outofboundsscrollbarwidget1:close()
		element.outofboundsscrollbarwidget2:close()
		element.outofboundsarrowswidget1:close()
		element.outofboundsarrowswidget:close()
		element.outofboundsarrowswidget00:close()
		element.outofboundsarrowswidget0:close()
		element.outofboundssidebar:close()
		element.outofboundssidebar0:close()
		element.outofboundstimerwidget:close()
		element.outofboundstimerframedots:close()
		element.outofboundswarningboxwidget:close()
		element.outofboundsdotblinkwidget:close()
		element.outofboundsdotblinkwidget0:close()
		element.Timer:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
