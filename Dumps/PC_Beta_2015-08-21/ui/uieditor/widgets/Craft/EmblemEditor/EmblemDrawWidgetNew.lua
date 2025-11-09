require( "ui.uieditor.widgets.BorderBakedBlur" )
require( "ui.uieditor.widgets.BorderBakedMask" )
require( "ui.uieditor.widgets.BorderBakedSolid" )
require( "ui.uieditor.widgets.BorderBaked" )
require( "ui.uieditor.widgets.Lobby.Common.FE_FocusBarContainer" )

CoD.EmblemDrawWidgetNew = InheritFrom( LUI.UIElement )
CoD.EmblemDrawWidgetNew.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.EmblemDrawWidgetNew )
	self.id = "EmblemDrawWidgetNew"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 500 )
	self:setTopBottom( true, false, 0, 314 )
	self:makeFocusable()
	self:setHandleMouse( true )
	self.anyChildUsesUpdateState = true
	
	local BorderBakedBlur0 = CoD.BorderBakedBlur.new( menu, controller )
	BorderBakedBlur0:setLeftRight( true, true, 0, 1 )
	BorderBakedBlur0:setTopBottom( true, true, 0, 0 )
	BorderBakedBlur0:setAlpha( 0.4 )
	self:addElement( BorderBakedBlur0 )
	self.BorderBakedBlur0 = BorderBakedBlur0
	
	local BorderBakedMask0 = CoD.BorderBakedMask.new( menu, controller )
	BorderBakedMask0:setLeftRight( true, true, 0, 1 )
	BorderBakedMask0:setTopBottom( true, true, 0, 0 )
	BorderBakedMask0:setRGB( 0, 0, 0 )
	BorderBakedMask0:setAlpha( 0 )
	self:addElement( BorderBakedMask0 )
	self.BorderBakedMask0 = BorderBakedMask0
	
	local BorderBakedSolid0 = CoD.BorderBakedSolid.new( menu, controller )
	BorderBakedSolid0:setLeftRight( true, true, 0, 1 )
	BorderBakedSolid0:setTopBottom( true, true, 0, 0 )
	BorderBakedSolid0:setAlpha( 0.5 )
	self:addElement( BorderBakedSolid0 )
	self.BorderBakedSolid0 = BorderBakedSolid0
	
	local BorderBaked0 = CoD.BorderBaked.new( menu, controller )
	BorderBaked0:setLeftRight( true, true, 0, 1 )
	BorderBaked0:setTopBottom( true, true, 0, 0 )
	BorderBaked0:setRGB( 0.91, 0.09, 0.09 )
	BorderBaked0:setAlpha( 0 )
	self:addElement( BorderBaked0 )
	self.BorderBaked0 = BorderBaked0
	
	local backgroundMask = LUI.UIImage.new()
	backgroundMask:setLeftRight( true, true, 2, -2 )
	backgroundMask:setTopBottom( true, true, 2, -2 )
	backgroundMask:setRGB( 0, 0, 0 )
	backgroundMask:setAlpha( 0 )
	self:addElement( backgroundMask )
	self.backgroundMask = backgroundMask
	
	local emblemDrawingArea = LUI.UIElement.new()
	emblemDrawingArea:setLeftRight( true, true, 0, 0 )
	emblemDrawingArea:setTopBottom( true, true, 0, 0 )
	emblemDrawingArea:subscribeToGlobalModel( controller, "Customization", "type", function ( model )
		local type = Engine.GetModelValue( model )
		if type then
			emblemDrawingArea:setupEmblem( type )
		end
	end )
	self:addElement( emblemDrawingArea )
	self.emblemDrawingArea = emblemDrawingArea
	
	local FocusBarT = CoD.FE_FocusBarContainer.new( menu, controller )
	FocusBarT:setLeftRight( true, true, -1.12, 1.38 )
	FocusBarT:setTopBottom( true, false, -1, 6 )
	FocusBarT:setAlpha( 0 )
	FocusBarT:setZoom( 1 )
	self:addElement( FocusBarT )
	self.FocusBarT = FocusBarT
	
	local FocusBarT0 = CoD.FE_FocusBarContainer.new( menu, controller )
	FocusBarT0:setLeftRight( true, true, -1.12, 1.38 )
	FocusBarT0:setTopBottom( true, false, 274, 281 )
	FocusBarT0:setAlpha( 0 )
	FocusBarT0:setZoom( 1 )
	self:addElement( FocusBarT0 )
	self.FocusBarT0 = FocusBarT0
	
	local glitch2 = LUI.UIImage.new()
	glitch2:setLeftRight( true, true, 5.5, -6.5 )
	glitch2:setTopBottom( false, true, -9.5, 5.5 )
	glitch2:setRGB( 1, 0.15, 0 )
	glitch2:setAlpha( 0 )
	glitch2:setImage( RegisterImage( "uie_t7_effect_glitches_menu10" ) )
	glitch2:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( glitch2 )
	self.glitch2 = glitch2
	
	local glitch = LUI.UIImage.new()
	glitch:setLeftRight( true, true, 4, -4 )
	glitch:setTopBottom( true, false, -6, 7.5 )
	glitch:setRGB( 1, 0.09, 0 )
	glitch:setAlpha( 0 )
	glitch:setImage( RegisterImage( "uie_t7_effect_glitches_menu10" ) )
	glitch:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( glitch )
	self.glitch = glitch
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 10 )
				BorderBakedBlur0:completeAnimation()
				self.BorderBakedBlur0:setAlpha( 0.4 )
				self.clipFinished( BorderBakedBlur0, {} )
				BorderBakedMask0:completeAnimation()
				self.BorderBakedMask0:setAlpha( 0 )
				self.BorderBakedMask0:setZoom( 0 )
				self.clipFinished( BorderBakedMask0, {} )
				BorderBakedSolid0:completeAnimation()
				self.BorderBakedSolid0:setAlpha( 0.5 )
				self.BorderBakedSolid0:setZoom( 0 )
				self.clipFinished( BorderBakedSolid0, {} )
				BorderBaked0:completeAnimation()
				self.BorderBaked0:setRGB( 1, 1, 1 )
				self.BorderBaked0:setAlpha( 0 )
				self.BorderBaked0:setZoom( 0 )
				self.clipFinished( BorderBaked0, {} )
				backgroundMask:completeAnimation()
				self.backgroundMask:setLeftRight( true, true, 2.5, -1.5 )
				self.backgroundMask:setTopBottom( true, true, 2, -2 )
				self.backgroundMask:setRGB( 0, 0, 0 )
				self.backgroundMask:setAlpha( 0 )
				self.clipFinished( backgroundMask, {} )
				emblemDrawingArea:completeAnimation()
				self.emblemDrawingArea:setLeftRight( true, true, 10, -10 )
				self.emblemDrawingArea:setTopBottom( true, true, 10, -10 )
				self.emblemDrawingArea:setAlpha( 1 )
				self.clipFinished( emblemDrawingArea, {} )
				FocusBarT:completeAnimation()
				self.FocusBarT:setAlpha( 0 )
				self.clipFinished( FocusBarT, {} )
				FocusBarT0:completeAnimation()
				self.FocusBarT0:setAlpha( 0 )
				self.clipFinished( FocusBarT0, {} )
				glitch2:completeAnimation()
				self.glitch2:setAlpha( 0 )
				self.clipFinished( glitch2, {} )
				glitch:completeAnimation()
				self.glitch:setAlpha( 0 )
				self.clipFinished( glitch, {} )
			end,
			Focus = function ()
				self:setupElementClipCounter( 0 )
			end
		},
		EmptySlot = {
			DefaultClip = function ()
				self:setupElementClipCounter( 3 )
				BorderBakedBlur0:completeAnimation()
				self.BorderBakedBlur0:setAlpha( 0 )
				self.clipFinished( BorderBakedBlur0, {} )
				BorderBakedSolid0:completeAnimation()
				self.BorderBakedSolid0:setAlpha( 0 )
				self.clipFinished( BorderBakedSolid0, {} )
				emblemDrawingArea:completeAnimation()
				self.emblemDrawingArea:setAlpha( 0 )
				self.clipFinished( emblemDrawingArea, {} )
			end
		}
	}
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.BorderBakedBlur0:close()
		element.BorderBakedMask0:close()
		element.BorderBakedSolid0:close()
		element.BorderBaked0:close()
		element.FocusBarT:close()
		element.FocusBarT0:close()
		element.emblemDrawingArea:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

