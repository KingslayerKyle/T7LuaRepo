-- 4768a011ee1f5d02657dddfbef1fa5c9
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.Terminal.Frame_line" )
require( "ui.uieditor.widgets.Terminal.Frame_lineVertical" )
require( "ui.uieditor.widgets.Terminal.GalleryItem" )
require( "ui.uieditor.widgets.Scrollbars.verticalCounter" )
require( "ui.uieditor.widgets.Terminal.DotLineDot" )

local f0_local0 = function ( f1_arg0, f1_arg1, f1_arg2 )
	CoD.PCUtil.SetupFakeMouse( f1_arg0, f1_arg2, f1_arg1 )
end

local PostLoadFunc = function ( self, controller, menu )
	self.GalleryList:registerEventHandler( "list_item_gain_focus", function ( element, event )
		local f3_local0 = Engine.GetModel( element:getModel(), "image" )
		if f3_local0 then
			self.Image0:setImage( RegisterImage( Engine.GetModelValue( f3_local0 ) ) )
		end
		return nil
	end )
	if CoD.isPC then
		f0_local0( self, controller, menu )
	end
end

CoD.GalleryViewerWidget = InheritFrom( LUI.UIElement )
CoD.GalleryViewerWidget.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.GalleryViewerWidget )
	self.id = "GalleryViewerWidget"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 900 )
	self:setTopBottom( true, false, 0, 600 )
	self:makeFocusable()
	self.onlyChildrenFocusable = true
	self.anyChildUsesUpdateState = true
	
	local blackleftBG = LUI.UIImage.new()
	blackleftBG:setLeftRight( true, true, 0, 0 )
	blackleftBG:setTopBottom( false, true, -600, 0 )
	blackleftBG:setRGB( 0, 0, 0 )
	self:addElement( blackleftBG )
	self.blackleftBG = blackleftBG
	
	local Frameline0 = CoD.Frame_line.new( menu, controller )
	Frameline0:setLeftRight( true, false, 171.85, 891.37 )
	Frameline0:setTopBottom( true, false, 30.5, 37.5 )
	self:addElement( Frameline0 )
	self.Frameline0 = Frameline0
	
	local FramelineVertical00 = CoD.Frame_lineVertical.new( menu, controller )
	FramelineVertical00:setLeftRight( true, false, 882.7, 889.27 )
	FramelineVertical00:setTopBottom( true, false, 29, 548.75 )
	self:addElement( FramelineVertical00 )
	self.FramelineVertical00 = FramelineVertical00
	
	local Frameline00 = CoD.Frame_line.new( menu, controller )
	Frameline00:setLeftRight( true, false, 208.23, 892.37 )
	Frameline00:setTopBottom( true, false, 546.5, 553.5 )
	self:addElement( Frameline00 )
	self.Frameline00 = Frameline00
	
	local Frameline000 = CoD.Frame_line.new( menu, controller )
	Frameline000:setLeftRight( true, false, 113.5, 816.94 )
	Frameline000:setTopBottom( true, false, 541.75, 548.75 )
	self:addElement( Frameline000 )
	self.Frameline000 = Frameline000
	
	local dot10 = LUI.UIImage.new()
	dot10:setLeftRight( true, false, 168, 176 )
	dot10:setTopBottom( true, false, 30.5, 38.5 )
	dot10:setImage( RegisterImage( "uie_t7_menu_cp_datavault_dot" ) )
	self:addElement( dot10 )
	self.dot10 = dot10
	
	local dot11 = LUI.UIImage.new()
	dot11:setLeftRight( true, false, 881.37, 889.37 )
	dot11:setTopBottom( true, false, 30.5, 38.5 )
	dot11:setImage( RegisterImage( "uie_t7_menu_cp_datavault_dot" ) )
	self:addElement( dot11 )
	self.dot11 = dot11
	
	local dot110 = LUI.UIImage.new()
	dot110:setLeftRight( true, false, 881.37, 888.37 )
	dot110:setTopBottom( true, false, 541.5, 548.5 )
	dot110:setImage( RegisterImage( "uie_t7_menu_cp_datavault_dot" ) )
	self:addElement( dot110 )
	self.dot110 = dot110
	
	local doubleline = LUI.UIImage.new()
	doubleline:setLeftRight( true, false, 532.37, 889.37 )
	doubleline:setTopBottom( true, false, 546.5, 553.5 )
	doubleline:setImage( RegisterImage( "uie_t7_menu_cp_datavault_frame_doubleline" ) )
	self:addElement( doubleline )
	self.doubleline = doubleline
	
	local FrameTopLeft0000 = LUI.UIImage.new()
	FrameTopLeft0000:setLeftRight( true, false, 84, 90 )
	FrameTopLeft0000:setTopBottom( true, false, 540, 552 )
	FrameTopLeft0000:setImage( RegisterImage( "uie_t7_menu_cp_datavault_frame_smallbar" ) )
	self:addElement( FrameTopLeft0000 )
	self.FrameTopLeft0000 = FrameTopLeft0000
	
	local fluff200 = LUI.UIImage.new()
	fluff200:setLeftRight( true, false, 111.5, 182.5 )
	fluff200:setTopBottom( true, false, 546.65, 552.57 )
	fluff200:setImage( RegisterImage( "uie_t7_menu_cp_datavault_lineanddot" ) )
	self:addElement( fluff200 )
	self.fluff200 = fluff200
	
	local Frameline01 = CoD.Frame_line.new( menu, controller )
	Frameline01:setLeftRight( true, false, 171.85, 891.37 )
	Frameline01:setTopBottom( true, false, 30.5, 37.5 )
	self:addElement( Frameline01 )
	self.Frameline01 = Frameline01
	
	local Frameline010 = CoD.Frame_line.new( menu, controller )
	Frameline010:setLeftRight( true, false, 171.85, 891.37 )
	Frameline010:setTopBottom( true, false, 30.5, 37.5 )
	self:addElement( Frameline010 )
	self.Frameline010 = Frameline010
	
	local Frameline011 = CoD.Frame_line.new( menu, controller )
	Frameline011:setLeftRight( true, false, 171.85, 891.37 )
	Frameline011:setTopBottom( true, false, 30.5, 37.5 )
	self:addElement( Frameline011 )
	self.Frameline011 = Frameline011
	
	local FramelineVertical001 = CoD.Frame_lineVertical.new( menu, controller )
	FramelineVertical001:setLeftRight( true, false, 882.7, 889.27 )
	FramelineVertical001:setTopBottom( true, false, 29, 548.75 )
	self:addElement( FramelineVertical001 )
	self.FramelineVertical001 = FramelineVertical001
	
	local FramelineVertical002 = CoD.Frame_lineVertical.new( menu, controller )
	FramelineVertical002:setLeftRight( true, false, 882.7, 889.27 )
	FramelineVertical002:setTopBottom( true, false, 29, 548.75 )
	self:addElement( FramelineVertical002 )
	self.FramelineVertical002 = FramelineVertical002
	
	local FramelineVertical003 = CoD.Frame_lineVertical.new( menu, controller )
	FramelineVertical003:setLeftRight( true, false, 882.7, 889.27 )
	FramelineVertical003:setTopBottom( true, false, 29, 548.75 )
	self:addElement( FramelineVertical003 )
	self.FramelineVertical003 = FramelineVertical003
	
	local Frameline0000 = CoD.Frame_line.new( menu, controller )
	Frameline0000:setLeftRight( true, false, 111.5, 891.37 )
	Frameline0000:setTopBottom( true, false, 541.5, 548.5 )
	self:addElement( Frameline0000 )
	self.Frameline0000 = Frameline0000
	
	local Frameline0001 = CoD.Frame_line.new( menu, controller )
	Frameline0001:setLeftRight( true, false, 111.5, 891.37 )
	Frameline0001:setTopBottom( true, false, 541.5, 548.5 )
	self:addElement( Frameline0001 )
	self.Frameline0001 = Frameline0001
	
	local Frameline0002 = CoD.Frame_line.new( menu, controller )
	Frameline0002:setLeftRight( true, false, 111.5, 891.08 )
	Frameline0002:setTopBottom( true, false, 541.5, 548.5 )
	self:addElement( Frameline0002 )
	self.Frameline0002 = Frameline0002
	
	local Frameline001 = CoD.Frame_line.new( menu, controller )
	Frameline001:setLeftRight( true, false, 208.23, 892.37 )
	Frameline001:setTopBottom( true, false, 546.5, 553.5 )
	self:addElement( Frameline001 )
	self.Frameline001 = Frameline001
	
	local Frameline002 = CoD.Frame_line.new( menu, controller )
	Frameline002:setLeftRight( true, false, 208.23, 892.37 )
	Frameline002:setTopBottom( true, false, 546.5, 553.5 )
	self:addElement( Frameline002 )
	self.Frameline002 = Frameline002
	
	local GalleryList = LUI.UIList.new( menu, controller, -3, 0, nil, false, false, 0, 0, false, false )
	GalleryList:makeFocusable()
	GalleryList:setLeftRight( true, false, 16.77, 136.77 )
	GalleryList:setTopBottom( true, false, 127, 504 )
	GalleryList:setDataSource( "GalleryList" )
	GalleryList:setWidgetType( CoD.GalleryItem )
	GalleryList:setVerticalCount( 17 )
	GalleryList:setSpacing( -3 )
	GalleryList:setVerticalCounter( CoD.verticalCounter )
	self:addElement( GalleryList )
	self.GalleryList = GalleryList
	
	local Image0 = LUI.UIImage.new()
	Image0:setLeftRight( true, false, 151.17, 875.37 )
	Image0:setTopBottom( true, false, 85.19, 492.56 )
	self:addElement( Image0 )
	self.Image0 = Image0
	
	local dot11000 = LUI.UIImage.new()
	dot11000:setLeftRight( true, false, 137.27, 144.27 )
	dot11000:setTopBottom( true, false, 541.5, 548.5 )
	dot11000:setImage( RegisterImage( "uie_t7_menu_cp_datavault_dot" ) )
	self:addElement( dot11000 )
	self.dot11000 = dot11000
	
	local FramelineVertical0001 = CoD.Frame_lineVertical.new( menu, controller )
	FramelineVertical0001:setLeftRight( true, false, 138.21, 144.79 )
	FramelineVertical0001:setTopBottom( true, false, 28.4, 552 )
	self:addElement( FramelineVertical0001 )
	self.FramelineVertical0001 = FramelineVertical0001
	
	local cross0 = LUI.UIImage.new()
	cross0:setLeftRight( true, false, 138.27, 144.27 )
	cross0:setTopBottom( true, false, 31, 37 )
	cross0:setImage( RegisterImage( "uie_t7_menu_cp_datavault_cross" ) )
	self:addElement( cross0 )
	self.cross0 = cross0
	
	local FramelineVertical00010 = CoD.Frame_lineVertical.new( menu, controller )
	FramelineVertical00010:setLeftRight( true, false, 138.21, 144.79 )
	FramelineVertical00010:setTopBottom( true, false, 28.4, 552 )
	self:addElement( FramelineVertical00010 )
	self.FramelineVertical00010 = FramelineVertical00010
	
	local FramelineVertical00011 = CoD.Frame_lineVertical.new( menu, controller )
	FramelineVertical00011:setLeftRight( true, false, 138.21, 144.79 )
	FramelineVertical00011:setTopBottom( true, false, 28.4, 552 )
	self:addElement( FramelineVertical00011 )
	self.FramelineVertical00011 = FramelineVertical00011
	
	local FramelineVertical00012 = CoD.Frame_lineVertical.new( menu, controller )
	FramelineVertical00012:setLeftRight( true, false, 138.21, 144.79 )
	FramelineVertical00012:setTopBottom( true, false, 28.4, 552 )
	self:addElement( FramelineVertical00012 )
	self.FramelineVertical00012 = FramelineVertical00012
	
	local frameTopLeft10 = LUI.UIImage.new()
	frameTopLeft10:setLeftRight( true, false, 9.29, 210.29 )
	frameTopLeft10:setTopBottom( true, false, 546.5, 553.5 )
	frameTopLeft10:setImage( RegisterImage( "uie_t7_menu_cp_datavault_frame_medbar" ) )
	self:addElement( frameTopLeft10 )
	self.frameTopLeft10 = frameTopLeft10
	
	local fluff2000 = LUI.UIImage.new()
	fluff2000:setLeftRight( true, false, 67.5, 138.5 )
	fluff2000:setTopBottom( true, false, 546.65, 552.57 )
	fluff2000:setImage( RegisterImage( "uie_t7_menu_cp_datavault_lineanddot" ) )
	self:addElement( fluff2000 )
	self.fluff2000 = fluff2000
	
	local frameTopLeft1 = LUI.UIImage.new()
	frameTopLeft1:setLeftRight( true, false, 10.29, 211.29 )
	frameTopLeft1:setTopBottom( true, false, 30.5, 37.5 )
	frameTopLeft1:setImage( RegisterImage( "uie_t7_menu_cp_datavault_frame_medbar" ) )
	self:addElement( frameTopLeft1 )
	self.frameTopLeft1 = frameTopLeft1
	
	local smallbar = LUI.UIImage.new()
	smallbar:setLeftRight( true, false, 11.27, 17.82 )
	smallbar:setTopBottom( true, false, 31.4, 44.5 )
	smallbar:setImage( RegisterImage( "uie_t7_menu_cp_datavault_frame_smallbar" ) )
	self:addElement( smallbar )
	self.smallbar = smallbar
	
	local smallbar0 = LUI.UIImage.new()
	smallbar0:setLeftRight( true, false, 74.27, 80.82 )
	smallbar0:setTopBottom( true, false, 31.4, 44.5 )
	smallbar0:setImage( RegisterImage( "uie_t7_menu_cp_datavault_frame_smallbar" ) )
	self:addElement( smallbar0 )
	self.smallbar0 = smallbar0
	
	local dot100 = LUI.UIImage.new()
	dot100:setLeftRight( true, false, 11.27, 17.82 )
	dot100:setTopBottom( true, false, 93.5, 100.06 )
	dot100:setImage( RegisterImage( "uie_t7_menu_cp_datavault_dot" ) )
	self:addElement( dot100 )
	self.dot100 = dot100
	
	local dot1000 = LUI.UIImage.new()
	dot1000:setLeftRight( true, false, 74.27, 80.82 )
	dot1000:setTopBottom( true, false, 93.5, 100.06 )
	dot1000:setImage( RegisterImage( "uie_t7_menu_cp_datavault_dot" ) )
	self:addElement( dot1000 )
	self.dot1000 = dot1000
	
	local lines = LUI.UIImage.new()
	lines:setLeftRight( true, false, 12.27, 136.77 )
	lines:setTopBottom( true, false, 529.78, 548.51 )
	lines:setImage( RegisterImage( "uie_t7_menu_cp_datavault_fluff03" ) )
	self:addElement( lines )
	self.lines = lines
	
	local DotLineDot0 = CoD.DotLineDot.new( menu, controller )
	DotLineDot0:setLeftRight( true, false, 12.27, 138.77 )
	DotLineDot0:setTopBottom( true, false, 113.72, 119.72 )
	self:addElement( DotLineDot0 )
	self.DotLineDot0 = DotLineDot0
	
	local Logo = LUI.UIImage.new()
	Logo:setLeftRight( false, false, -426.73, -382.45 )
	Logo:setTopBottom( false, false, -255.5, -211.22 )
	Logo:setAlpha( 0.85 )
	Logo:setImage( RegisterImage( "uie_t7_menu_cp_datavault_logobig" ) )
	self:addElement( Logo )
	self.Logo = Logo
	
	local mouseCursor = LUI.UIImage.new()
	mouseCursor:setLeftRight( true, false, 0, 16 )
	mouseCursor:setTopBottom( true, false, 0, 16 )
	mouseCursor:setAlpha( 0 )
	mouseCursor:setImage( RegisterImage( "uie_t7_menu_cp_datavault_cursor_16x16" ) )
	self:addElement( mouseCursor )
	self.mouseCursor = mouseCursor
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				mouseCursor:completeAnimation()
				self.mouseCursor:setAlpha( 0 )
				self.clipFinished( mouseCursor, {} )
			end,
			Over = function ()
				self:setupElementClipCounter( 1 )
				mouseCursor:completeAnimation()
				self.mouseCursor:setAlpha( 1 )
				self.clipFinished( mouseCursor, {} )
			end
		}
	}
	GalleryList.id = "GalleryList"
	self:registerEventHandler( "gain_focus", function ( element, event )
		if element.m_focusable and element.GalleryList:processEvent( event ) then
			return true
		else
			return LUI.UIElement.gainFocus( element, event )
		end
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.Frameline0:close()
		element.FramelineVertical00:close()
		element.Frameline00:close()
		element.Frameline000:close()
		element.Frameline01:close()
		element.Frameline010:close()
		element.Frameline011:close()
		element.FramelineVertical001:close()
		element.FramelineVertical002:close()
		element.FramelineVertical003:close()
		element.Frameline0000:close()
		element.Frameline0001:close()
		element.Frameline0002:close()
		element.Frameline001:close()
		element.Frameline002:close()
		element.GalleryList:close()
		element.FramelineVertical0001:close()
		element.FramelineVertical00010:close()
		element.FramelineVertical00011:close()
		element.FramelineVertical00012:close()
		element.DotLineDot0:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

