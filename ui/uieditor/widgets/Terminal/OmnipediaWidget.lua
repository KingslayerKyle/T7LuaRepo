-- a415aa6ea413f59cec385ff36aa627a8
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.Terminal.Frame_line" )
require( "ui.uieditor.widgets.Terminal.Frame_lineVertical" )
require( "ui.uieditor.widgets.Terminal.BookmarkItem" )

local f0_local0 = function ( f1_arg0, f1_arg1, f1_arg2 )
	CoD.PCUtil.SetupFakeMouse( f1_arg0, f1_arg2, f1_arg1 )
	f1_arg0:registerEventHandler( "mouseenter", function ( element, event )
		HideMouseCursor( f1_arg2 )
		if f1_arg0.bookMarkMode then
			f1_arg0.mouseCursor:show()
		end
		f1_arg0.mouseInside = true
	end )
	f1_arg0:registerEventHandler( "mouseleave", function ( element, event )
		ShowMouseCursor( f1_arg2 )
		f1_arg0.mouseCursor:hide()
		f1_arg0.BinaryHTML0:hideCursor()
		f1_arg0.mouseInside = nil
	end )
	CoD.Menu.AddButtonCallbackFunction( f1_arg2, f1_arg0, f1_arg1, Enum.LUIButton.LUI_KEY_PCKEY_MWHEELUP, "MWHEELUP", function ( f4_arg0, f4_arg1, f4_arg2, f4_arg3 )
		f1_arg0.BinaryHTML0:scrollPage( -25 )
	end )
	CoD.Menu.AddButtonCallbackFunction( f1_arg2, f1_arg0, f1_arg1, Enum.LUIButton.LUI_KEY_PCKEY_MWHEELDOWN, "MWHEELDOWN", function ( f5_arg0, f5_arg1, f5_arg2, f5_arg3 )
		f1_arg0.BinaryHTML0:scrollPage( 25 )
	end )
end

local PostLoadFunc = function ( self, controller, menu )
	if CoD.isPC then
		f0_local0( self, controller, menu )
	end
	self.BookMarkOpen = function ()
		if CoD.isPC then
			self.bookMarkMode = true
			self.BinaryHTML0:hideCursor()
			if self.mouseInside then
				self.mouseCursor:show()
			end
		end
	end
	
	self.BookMarkClose = function ()
		if CoD.isPC then
			self.bookMarkMode = nil
			self.mouseCursor:hide()
		end
	end
	
end

CoD.OmnipediaWidget = InheritFrom( LUI.UIElement )
CoD.OmnipediaWidget.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.OmnipediaWidget )
	self.id = "OmnipediaWidget"
	self.soundSet = "Omnipedia"
	self:setLeftRight( true, false, 0, 900 )
	self:setTopBottom( true, false, 0, 600 )
	self.anyChildUsesUpdateState = true
	
	local blackleftBG = LUI.UIImage.new()
	blackleftBG:setLeftRight( true, true, 0, 0 )
	blackleftBG:setTopBottom( false, true, -600, 0 )
	blackleftBG:setRGB( 0, 0, 0 )
	self:addElement( blackleftBG )
	self.blackleftBG = blackleftBG
	
	local BinaryHTML0 = LUI.UIElement.new()
	BinaryHTML0:setLeftRight( true, false, 21.37, 879 )
	BinaryHTML0:setTopBottom( true, false, 40, 538 )
	BinaryHTML0:setAlpha( 0.15 )
	BinaryHTML0:setupBinaryHTML( "home.htm" )
	BinaryHTML0:setUseStencil( false )
	self:addElement( BinaryHTML0 )
	self.BinaryHTML0 = BinaryHTML0
	
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
	
	local frameTopLeft1 = LUI.UIImage.new()
	frameTopLeft1:setLeftRight( true, false, 14.29, 215.29 )
	frameTopLeft1:setTopBottom( true, false, 30.5, 37.5 )
	frameTopLeft1:setImage( RegisterImage( "uie_t7_menu_cp_datavault_frame_medbar" ) )
	self:addElement( frameTopLeft1 )
	self.frameTopLeft1 = frameTopLeft1
	
	local Frameline00 = CoD.Frame_line.new( menu, controller )
	Frameline00:setLeftRight( true, false, 208.23, 892.37 )
	Frameline00:setTopBottom( true, false, 546.5, 553.5 )
	self:addElement( Frameline00 )
	self.Frameline00 = Frameline00
	
	local frameTopLeft10 = LUI.UIImage.new()
	frameTopLeft10:setLeftRight( true, false, 14.29, 215.29 )
	frameTopLeft10:setTopBottom( true, false, 546.5, 553.5 )
	frameTopLeft10:setImage( RegisterImage( "uie_t7_menu_cp_datavault_frame_medbar" ) )
	self:addElement( frameTopLeft10 )
	self.frameTopLeft10 = frameTopLeft10
	
	local FramelineVertical000 = CoD.Frame_lineVertical.new( menu, controller )
	FramelineVertical000:setLeftRight( true, false, 14.29, 20.86 )
	FramelineVertical000:setTopBottom( true, false, 31, 554.61 )
	self:addElement( FramelineVertical000 )
	self.FramelineVertical000 = FramelineVertical000
	
	local Frameline000 = CoD.Frame_line.new( menu, controller )
	Frameline000:setLeftRight( true, false, 111, 891 )
	Frameline000:setTopBottom( true, false, 541.75, 548.75 )
	self:addElement( Frameline000 )
	self.Frameline000 = Frameline000
	
	local dot1 = LUI.UIImage.new()
	dot1:setLeftRight( true, false, 121, 129 )
	dot1:setTopBottom( true, false, 30.5, 38.5 )
	dot1:setImage( RegisterImage( "uie_t7_menu_cp_datavault_dot" ) )
	self:addElement( dot1 )
	self.dot1 = dot1
	
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
	
	local dot1100 = LUI.UIImage.new()
	dot1100:setLeftRight( true, false, 109.27, 116.27 )
	dot1100:setTopBottom( true, false, 541.5, 548.5 )
	dot1100:setImage( RegisterImage( "uie_t7_menu_cp_datavault_dot" ) )
	self:addElement( dot1100 )
	self.dot1100 = dot1100
	
	local doubleline = LUI.UIImage.new()
	doubleline:setLeftRight( true, false, 532.37, 889.37 )
	doubleline:setTopBottom( true, false, 546.5, 553.5 )
	doubleline:setImage( RegisterImage( "uie_t7_menu_cp_datavault_frame_doubleline" ) )
	self:addElement( doubleline )
	self.doubleline = doubleline
	
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
	Frameline002:setLeftRight( true, false, 18.09, 702.22 )
	Frameline002:setTopBottom( true, false, 545, 552 )
	self:addElement( Frameline002 )
	self.Frameline002 = Frameline002
	
	local FramelineVertical0000 = CoD.Frame_lineVertical.new( menu, controller )
	FramelineVertical0000:setLeftRight( true, false, 14.29, 20.86 )
	FramelineVertical0000:setTopBottom( true, false, 31, 554.61 )
	self:addElement( FramelineVertical0000 )
	self.FramelineVertical0000 = FramelineVertical0000
	
	local FramelineVertical0001 = CoD.Frame_lineVertical.new( menu, controller )
	FramelineVertical0001:setLeftRight( true, false, 14.8, 21.37 )
	FramelineVertical0001:setTopBottom( true, false, 27.9, 551.5 )
	self:addElement( FramelineVertical0001 )
	self.FramelineVertical0001 = FramelineVertical0001
	
	local cross = LUI.UIImage.new()
	cross:setLeftRight( true, false, 110.27, 116.27 )
	cross:setTopBottom( true, false, 31, 37 )
	cross:setImage( RegisterImage( "uie_t7_menu_cp_datavault_cross" ) )
	self:addElement( cross )
	self.cross = cross
	
	local BookmarksList = LUI.UIList.new( menu, controller, 2, 0, nil, false, false, 0, 0, false, false )
	BookmarksList:makeFocusable()
	BookmarksList:setLeftRight( true, false, 31, 871 )
	BookmarksList:setTopBottom( true, false, 388.5, 521.5 )
	BookmarksList:setAlpha( 0 )
	BookmarksList:setDataSource( "BookmarksList" )
	BookmarksList:setWidgetType( CoD.BookmarkItem )
	BookmarksList:setVerticalCount( 5 )
	self:addElement( BookmarksList )
	self.BookmarksList = BookmarksList
	
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
				self:setupElementClipCounter( 28 )
				BinaryHTML0:completeAnimation()
				self.BinaryHTML0:setLeftRight( true, false, 21.37, 879 )
				self.BinaryHTML0:setTopBottom( true, false, 40, 538 )
				self.clipFinished( BinaryHTML0, {} )
				Frameline0:completeAnimation()
				self.Frameline0:setLeftRight( true, false, 171.85, 891.37 )
				self.Frameline0:setTopBottom( true, false, 30.5, 37.5 )
				self.clipFinished( Frameline0, {} )
				FramelineVertical00:completeAnimation()
				self.FramelineVertical00:setLeftRight( true, false, 882.7, 889.27 )
				self.FramelineVertical00:setTopBottom( true, false, 29, 548.75 )
				self.clipFinished( FramelineVertical00, {} )
				frameTopLeft1:completeAnimation()
				self.frameTopLeft1:setLeftRight( true, false, 14.29, 215.29 )
				self.frameTopLeft1:setTopBottom( true, false, 30.5, 37.5 )
				self.clipFinished( frameTopLeft1, {} )
				Frameline00:completeAnimation()
				self.Frameline00:setLeftRight( true, false, 208.23, 892.37 )
				self.Frameline00:setTopBottom( true, false, 546.5, 553.5 )
				self.clipFinished( Frameline00, {} )
				frameTopLeft10:completeAnimation()
				self.frameTopLeft10:setLeftRight( true, false, 14.29, 215.29 )
				self.frameTopLeft10:setTopBottom( true, false, 546.5, 553.5 )
				self.clipFinished( frameTopLeft10, {} )
				FramelineVertical000:completeAnimation()
				self.FramelineVertical000:setLeftRight( true, false, 14.29, 20.86 )
				self.FramelineVertical000:setTopBottom( true, false, 31, 554.61 )
				self.clipFinished( FramelineVertical000, {} )
				Frameline000:completeAnimation()
				self.Frameline000:setLeftRight( true, false, 113.5, 816.94 )
				self.Frameline000:setTopBottom( true, false, 541.75, 548.75 )
				self.clipFinished( Frameline000, {} )
				dot1:completeAnimation()
				self.dot1:setLeftRight( true, false, 121, 129 )
				self.dot1:setTopBottom( true, false, 30.5, 38.5 )
				self.clipFinished( dot1, {} )
				dot11:completeAnimation()
				self.dot11:setLeftRight( true, false, 881.37, 889.37 )
				self.dot11:setTopBottom( true, false, 30.5, 38.5 )
				self.clipFinished( dot11, {} )
				dot110:completeAnimation()
				self.dot110:setLeftRight( true, false, 881.37, 888.37 )
				self.dot110:setTopBottom( true, false, 541.5, 548.5 )
				self.clipFinished( dot110, {} )
				dot1100:completeAnimation()
				self.dot1100:setLeftRight( true, false, 109.27, 116.27 )
				self.dot1100:setTopBottom( true, false, 541.5, 548.5 )
				self.clipFinished( dot1100, {} )
				doubleline:completeAnimation()
				self.doubleline:setLeftRight( true, false, 532.37, 889.37 )
				self.doubleline:setTopBottom( true, false, 546.5, 553.5 )
				self.clipFinished( doubleline, {} )
				fluff200:completeAnimation()
				self.fluff200:setLeftRight( true, false, 111.5, 182.5 )
				self.fluff200:setTopBottom( true, false, 546.65, 552.57 )
				self.clipFinished( fluff200, {} )
				Frameline01:completeAnimation()
				self.Frameline01:setLeftRight( true, false, 171.85, 891.37 )
				self.Frameline01:setTopBottom( true, false, 30.5, 37.5 )
				self.clipFinished( Frameline01, {} )
				Frameline010:completeAnimation()
				self.Frameline010:setLeftRight( true, false, 171.85, 891.37 )
				self.Frameline010:setTopBottom( true, false, 30.5, 37.5 )
				self.clipFinished( Frameline010, {} )
				Frameline011:completeAnimation()
				self.Frameline011:setLeftRight( true, false, 171.85, 891.37 )
				self.Frameline011:setTopBottom( true, false, 30.5, 37.5 )
				self.clipFinished( Frameline011, {} )
				FramelineVertical001:completeAnimation()
				self.FramelineVertical001:setLeftRight( true, false, 882.7, 889.27 )
				self.FramelineVertical001:setTopBottom( true, false, 29, 548.75 )
				self.clipFinished( FramelineVertical001, {} )
				FramelineVertical002:completeAnimation()
				self.FramelineVertical002:setLeftRight( true, false, 882.7, 889.27 )
				self.FramelineVertical002:setTopBottom( true, false, 29, 548.75 )
				self.clipFinished( FramelineVertical002, {} )
				FramelineVertical003:completeAnimation()
				self.FramelineVertical003:setLeftRight( true, false, 882.7, 889.27 )
				self.FramelineVertical003:setTopBottom( true, false, 29, 548.75 )
				self.clipFinished( FramelineVertical003, {} )
				Frameline0000:completeAnimation()
				self.Frameline0000:setLeftRight( true, false, 111.5, 891.37 )
				self.Frameline0000:setTopBottom( true, false, 541.5, 548.5 )
				self.clipFinished( Frameline0000, {} )
				Frameline0001:completeAnimation()
				self.Frameline0001:setLeftRight( true, false, 111.5, 891.37 )
				self.Frameline0001:setTopBottom( true, false, 541.5, 548.5 )
				self.clipFinished( Frameline0001, {} )
				Frameline0002:completeAnimation()
				self.Frameline0002:setLeftRight( true, false, 21.37, 891.08 )
				self.Frameline0002:setTopBottom( true, false, 541.5, 548.5 )
				self.clipFinished( Frameline0002, {} )
				Frameline001:completeAnimation()
				self.Frameline001:setLeftRight( true, false, 208.23, 892.37 )
				self.Frameline001:setTopBottom( true, false, 546.5, 553.5 )
				self.clipFinished( Frameline001, {} )
				Frameline002:completeAnimation()
				self.Frameline002:setLeftRight( true, false, 208.23, 892.37 )
				self.Frameline002:setTopBottom( true, false, 546.5, 553.5 )
				self.clipFinished( Frameline002, {} )
				FramelineVertical0000:completeAnimation()
				self.FramelineVertical0000:setLeftRight( true, false, 14.29, 20.86 )
				self.FramelineVertical0000:setTopBottom( true, false, 31, 554.61 )
				self.clipFinished( FramelineVertical0000, {} )
				FramelineVertical0001:completeAnimation()
				self.FramelineVertical0001:setLeftRight( true, false, 14.8, 21.37 )
				self.FramelineVertical0001:setTopBottom( true, false, 27.9, 551.5 )
				self.clipFinished( FramelineVertical0001, {} )
				cross:completeAnimation()
				self.cross:setLeftRight( true, false, 110.27, 116.27 )
				self.cross:setTopBottom( true, false, 31, 37 )
				self.clipFinished( cross, {} )
			end,
			BookMark_Nav = function ()
				self:setupElementClipCounter( 4 )
				local BinaryHTML0Frame2 = function ( BinaryHTML0, event )
					if not event.interrupted then
						BinaryHTML0:beginAnimation( "keyframe", 310, false, false, CoD.TweenType.Linear )
					end
					BinaryHTML0:setLeftRight( true, false, 21.37, 879 )
					BinaryHTML0:setTopBottom( true, false, 40, 388.5 )
					if event.interrupted then
						self.clipFinished( BinaryHTML0, event )
					else
						BinaryHTML0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				BinaryHTML0:completeAnimation()
				self.BinaryHTML0:setLeftRight( true, false, 21.37, 879 )
				self.BinaryHTML0:setTopBottom( true, false, 40, 541.5 )
				BinaryHTML0Frame2( BinaryHTML0, {} )
				local Frameline000Frame2 = function ( Frameline000, event )
					if not event.interrupted then
						Frameline000:beginAnimation( "keyframe", 310, false, false, CoD.TweenType.Linear )
					end
					Frameline000:setLeftRight( true, false, 129, 832.44 )
					Frameline000:setTopBottom( true, false, 388.5, 395.5 )
					if event.interrupted then
						self.clipFinished( Frameline000, event )
					else
						Frameline000:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Frameline000:completeAnimation()
				self.Frameline000:setLeftRight( true, false, 129.62, 833.06 )
				self.Frameline000:setTopBottom( true, false, 546.11, 553.11 )
				Frameline000Frame2( Frameline000, {} )
				local Frameline0002Frame2 = function ( Frameline0002, event )
					if not event.interrupted then
						Frameline0002:beginAnimation( "keyframe", 310, false, false, CoD.TweenType.Linear )
					end
					Frameline0002:setLeftRight( true, false, 105.79, 885.37 )
					Frameline0002:setTopBottom( true, false, 388.5, 395.5 )
					if event.interrupted then
						self.clipFinished( Frameline0002, event )
					else
						Frameline0002:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Frameline0002:completeAnimation()
				self.Frameline0002:setLeftRight( true, false, 106.4, 885.99 )
				self.Frameline0002:setTopBottom( true, false, 546.11, 553.11 )
				Frameline0002Frame2( Frameline0002, {} )
				local f11_local3 = function ( f15_arg0, f15_arg1 )
					if not f15_arg1.interrupted then
						f15_arg0:beginAnimation( "keyframe", 159, false, false, CoD.TweenType.Linear )
					end
					f15_arg0:setLeftRight( true, false, 31, 870 )
					f15_arg0:setTopBottom( true, false, 412.5, 548.5 )
					f15_arg0:setAlpha( 1 )
					if f15_arg1.interrupted then
						self.clipFinished( f15_arg0, f15_arg1 )
					else
						f15_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				BookmarksList:beginAnimation( "keyframe", 310, false, false, CoD.TweenType.Linear )
				BookmarksList:setLeftRight( true, false, 31, 870 )
				BookmarksList:setTopBottom( true, false, 412.5, 548.5 )
				BookmarksList:setAlpha( 0 )
				BookmarksList:registerEventHandler( "transition_complete_keyframe", f11_local3 )
			end,
			BookMark_Close = function ()
				self:setupElementClipCounter( 4 )
				local f16_local0 = function ( f17_arg0, f17_arg1 )
					if not f17_arg1.interrupted then
						f17_arg0:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
					end
					f17_arg0:setLeftRight( true, false, 21.37, 879 )
					f17_arg0:setTopBottom( true, false, 40, 541.5 )
					if f17_arg1.interrupted then
						self.clipFinished( f17_arg0, f17_arg1 )
					else
						f17_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				BinaryHTML0:beginAnimation( "keyframe", 170, false, false, CoD.TweenType.Linear )
				BinaryHTML0:setLeftRight( true, false, 21.37, 879 )
				BinaryHTML0:setTopBottom( true, false, 40, 388.5 )
				BinaryHTML0:registerEventHandler( "transition_complete_keyframe", f16_local0 )
				local f16_local1 = function ( f18_arg0, f18_arg1 )
					if not f18_arg1.interrupted then
						f18_arg0:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
					end
					f18_arg0:setLeftRight( true, false, 129.62, 833.06 )
					f18_arg0:setTopBottom( true, false, 546.11, 553.11 )
					if f18_arg1.interrupted then
						self.clipFinished( f18_arg0, f18_arg1 )
					else
						f18_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Frameline000:beginAnimation( "keyframe", 170, false, false, CoD.TweenType.Linear )
				Frameline000:setLeftRight( true, false, 129, 832.44 )
				Frameline000:setTopBottom( true, false, 388.5, 395.5 )
				Frameline000:registerEventHandler( "transition_complete_keyframe", f16_local1 )
				local f16_local2 = function ( f19_arg0, f19_arg1 )
					if not f19_arg1.interrupted then
						f19_arg0:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
					end
					f19_arg0:setLeftRight( true, false, 106.4, 885.99 )
					f19_arg0:setTopBottom( true, false, 546.11, 553.11 )
					if f19_arg1.interrupted then
						self.clipFinished( f19_arg0, f19_arg1 )
					else
						f19_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Frameline0002:beginAnimation( "keyframe", 170, false, false, CoD.TweenType.Linear )
				Frameline0002:setLeftRight( true, false, 105.79, 885.37 )
				Frameline0002:setTopBottom( true, false, 388.5, 395.5 )
				Frameline0002:registerEventHandler( "transition_complete_keyframe", f16_local2 )
				local BookmarksListFrame2 = function ( BookmarksList, event )
					local BookmarksListFrame3 = function ( BookmarksList, event )
						if not event.interrupted then
							BookmarksList:beginAnimation( "keyframe", 310, false, false, CoD.TweenType.Linear )
						end
						BookmarksList:setLeftRight( true, false, 31, 870 )
						BookmarksList:setTopBottom( true, false, 412, 548.5 )
						BookmarksList:setAlpha( 0 )
						if event.interrupted then
							self.clipFinished( BookmarksList, event )
						else
							BookmarksList:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						BookmarksListFrame3( BookmarksList, event )
						return 
					else
						BookmarksList:beginAnimation( "keyframe", 159, false, false, CoD.TweenType.Linear )
						BookmarksList:setAlpha( 0 )
						BookmarksList:registerEventHandler( "transition_complete_keyframe", BookmarksListFrame3 )
					end
				end
				
				BookmarksList:completeAnimation()
				self.BookmarksList:setLeftRight( true, false, 31, 870 )
				self.BookmarksList:setTopBottom( true, false, 412, 548.5 )
				self.BookmarksList:setAlpha( 1 )
				BookmarksListFrame2( BookmarksList, {} )
			end,
			Over = function ()
				self:setupElementClipCounter( 0 )
			end
		},
		Closed_Nav = {
			DefaultClip = function ()
				self:setupElementClipCounter( 10 )
				BinaryHTML0:completeAnimation()
				self.BinaryHTML0:setLeftRight( true, false, 47.14, 879 )
				self.BinaryHTML0:setTopBottom( true, false, 40, 538 )
				self.clipFinished( BinaryHTML0, {} )
				FramelineVertical000:completeAnimation()
				self.FramelineVertical000:setLeftRight( true, false, 37.7, 44.27 )
				self.FramelineVertical000:setTopBottom( true, false, 31.5, 555.11 )
				self.clipFinished( FramelineVertical000, {} )
				Frameline000:completeAnimation()
				self.Frameline000:setLeftRight( true, false, 38.27, 816.94 )
				self.Frameline000:setTopBottom( true, false, 541.75, 548.75 )
				self.clipFinished( Frameline000, {} )
				dot1100:completeAnimation()
				self.dot1100:setLeftRight( true, false, 38.37, 45.37 )
				self.dot1100:setTopBottom( true, false, 541.5, 548.5 )
				self.clipFinished( dot1100, {} )
				Frameline0000:completeAnimation()
				self.Frameline0000:setLeftRight( true, false, 41.27, 891.37 )
				self.Frameline0000:setTopBottom( true, false, 541.5, 548.5 )
				self.clipFinished( Frameline0000, {} )
				Frameline0001:completeAnimation()
				self.Frameline0001:setLeftRight( true, false, 41.27, 891.37 )
				self.Frameline0001:setTopBottom( true, false, 541.5, 548.5 )
				self.clipFinished( Frameline0001, {} )
				Frameline0002:completeAnimation()
				self.Frameline0002:setLeftRight( true, false, 40.99, 891.08 )
				self.Frameline0002:setTopBottom( true, false, 541.5, 548.5 )
				self.clipFinished( Frameline0002, {} )
				FramelineVertical0000:completeAnimation()
				self.FramelineVertical0000:setLeftRight( true, false, 37.7, 44.27 )
				self.FramelineVertical0000:setTopBottom( true, false, 31.5, 555.11 )
				self.clipFinished( FramelineVertical0000, {} )
				FramelineVertical0001:completeAnimation()
				self.FramelineVertical0001:setLeftRight( true, false, 38.21, 44.79 )
				self.FramelineVertical0001:setTopBottom( true, false, 28.4, 552 )
				self.clipFinished( FramelineVertical0001, {} )
				cross:completeAnimation()
				self.cross:setLeftRight( true, false, 38.27, 44.27 )
				self.cross:setTopBottom( true, false, 31, 37 )
				self.clipFinished( cross, {} )
			end,
			DefaultState = function ()
				self:setupElementClipCounter( 0 )
			end,
			Bookmark_Nav = function ()
				self:setupElementClipCounter( 0 )
			end
		},
		Bookmark_Nav = {
			DefaultClip = function ()
				self:setupElementClipCounter( 29 )
				BinaryHTML0:completeAnimation()
				self.BinaryHTML0:setLeftRight( true, false, 171.85, 879 )
				self.BinaryHTML0:setTopBottom( true, false, 40, 538 )
				self.clipFinished( BinaryHTML0, {} )
				Frameline0:completeAnimation()
				self.Frameline0:setLeftRight( true, false, 171.85, 891.37 )
				self.Frameline0:setTopBottom( true, false, 30.5, 37.5 )
				self.clipFinished( Frameline0, {} )
				FramelineVertical00:completeAnimation()
				self.FramelineVertical00:setLeftRight( true, false, 882.7, 889.27 )
				self.FramelineVertical00:setTopBottom( true, false, 29, 548.75 )
				self.clipFinished( FramelineVertical00, {} )
				frameTopLeft1:completeAnimation()
				self.frameTopLeft1:setLeftRight( true, false, 14.29, 215.29 )
				self.frameTopLeft1:setTopBottom( true, false, 30.5, 37.5 )
				self.clipFinished( frameTopLeft1, {} )
				Frameline00:completeAnimation()
				self.Frameline00:setLeftRight( true, false, 208.23, 892.37 )
				self.Frameline00:setTopBottom( true, false, 546.5, 553.5 )
				self.clipFinished( Frameline00, {} )
				frameTopLeft10:completeAnimation()
				self.frameTopLeft10:setLeftRight( true, false, 14.29, 215.29 )
				self.frameTopLeft10:setTopBottom( true, false, 546.5, 553.5 )
				self.clipFinished( frameTopLeft10, {} )
				FramelineVertical000:completeAnimation()
				self.FramelineVertical000:setLeftRight( true, false, 162.7, 169.27 )
				self.FramelineVertical000:setTopBottom( true, false, 31.5, 555.11 )
				self.clipFinished( FramelineVertical000, {} )
				Frameline000:completeAnimation()
				self.Frameline000:setLeftRight( true, false, 113.5, 816.94 )
				self.Frameline000:setTopBottom( true, false, 541.75, 548.75 )
				self.clipFinished( Frameline000, {} )
				dot1:completeAnimation()
				self.dot1:setLeftRight( true, false, 173, 181 )
				self.dot1:setTopBottom( true, false, 30.5, 38.5 )
				self.clipFinished( dot1, {} )
				dot10:completeAnimation()
				self.dot10:setLeftRight( true, false, 168, 176 )
				self.dot10:setTopBottom( true, false, 30.5, 38.5 )
				self.clipFinished( dot10, {} )
				dot11:completeAnimation()
				self.dot11:setLeftRight( true, false, 881.37, 889.37 )
				self.dot11:setTopBottom( true, false, 30.5, 38.5 )
				self.clipFinished( dot11, {} )
				dot110:completeAnimation()
				self.dot110:setLeftRight( true, false, 881.37, 888.37 )
				self.dot110:setTopBottom( true, false, 541.5, 548.5 )
				self.clipFinished( dot110, {} )
				dot1100:completeAnimation()
				self.dot1100:setLeftRight( true, false, 109.27, 116.27 )
				self.dot1100:setTopBottom( true, false, 541.5, 548.5 )
				self.clipFinished( dot1100, {} )
				doubleline:completeAnimation()
				self.doubleline:setLeftRight( true, false, 532.37, 889.37 )
				self.doubleline:setTopBottom( true, false, 546.5, 553.5 )
				self.clipFinished( doubleline, {} )
				fluff200:completeAnimation()
				self.fluff200:setLeftRight( true, false, 111.5, 182.5 )
				self.fluff200:setTopBottom( true, false, 546.65, 552.57 )
				self.clipFinished( fluff200, {} )
				Frameline01:completeAnimation()
				self.Frameline01:setLeftRight( true, false, 171.85, 891.37 )
				self.Frameline01:setTopBottom( true, false, 30.5, 37.5 )
				self.clipFinished( Frameline01, {} )
				Frameline010:completeAnimation()
				self.Frameline010:setLeftRight( true, false, 171.85, 891.37 )
				self.Frameline010:setTopBottom( true, false, 30.5, 37.5 )
				self.clipFinished( Frameline010, {} )
				Frameline011:completeAnimation()
				self.Frameline011:setLeftRight( true, false, 171.85, 891.37 )
				self.Frameline011:setTopBottom( true, false, 30.5, 37.5 )
				self.clipFinished( Frameline011, {} )
				FramelineVertical001:completeAnimation()
				self.FramelineVertical001:setLeftRight( true, false, 882.7, 889.27 )
				self.FramelineVertical001:setTopBottom( true, false, 29, 548.75 )
				self.clipFinished( FramelineVertical001, {} )
				FramelineVertical002:completeAnimation()
				self.FramelineVertical002:setLeftRight( true, false, 882.7, 889.27 )
				self.FramelineVertical002:setTopBottom( true, false, 29, 548.75 )
				self.clipFinished( FramelineVertical002, {} )
				FramelineVertical003:completeAnimation()
				self.FramelineVertical003:setLeftRight( true, false, 882.7, 889.27 )
				self.FramelineVertical003:setTopBottom( true, false, 29, 548.75 )
				self.clipFinished( FramelineVertical003, {} )
				Frameline0000:completeAnimation()
				self.Frameline0000:setLeftRight( true, false, 111.5, 891.37 )
				self.Frameline0000:setTopBottom( true, false, 541.5, 548.5 )
				self.clipFinished( Frameline0000, {} )
				Frameline0001:completeAnimation()
				self.Frameline0001:setLeftRight( true, false, 111.5, 891.37 )
				self.Frameline0001:setTopBottom( true, false, 541.5, 548.5 )
				self.clipFinished( Frameline0001, {} )
				Frameline0002:completeAnimation()
				self.Frameline0002:setLeftRight( true, false, 111.5, 891.08 )
				self.Frameline0002:setTopBottom( true, false, 541.5, 548.5 )
				self.clipFinished( Frameline0002, {} )
				Frameline001:completeAnimation()
				self.Frameline001:setLeftRight( true, false, 208.23, 892.37 )
				self.Frameline001:setTopBottom( true, false, 546.5, 553.5 )
				self.clipFinished( Frameline001, {} )
				Frameline002:completeAnimation()
				self.Frameline002:setLeftRight( true, false, 208.23, 892.37 )
				self.Frameline002:setTopBottom( true, false, 546.5, 553.5 )
				self.clipFinished( Frameline002, {} )
				FramelineVertical0000:completeAnimation()
				self.FramelineVertical0000:setLeftRight( true, false, 162.7, 169.27 )
				self.FramelineVertical0000:setTopBottom( true, false, 31.5, 555.11 )
				self.clipFinished( FramelineVertical0000, {} )
				FramelineVertical0001:completeAnimation()
				self.FramelineVertical0001:setLeftRight( true, false, 162.21, 168.79 )
				self.FramelineVertical0001:setTopBottom( true, false, 28.4, 552 )
				self.clipFinished( FramelineVertical0001, {} )
				cross:completeAnimation()
				self.cross:setLeftRight( true, false, 162.27, 168.27 )
				self.cross:setTopBottom( true, false, 31, 37 )
				self.clipFinished( cross, {} )
			end,
			DefaultState = function ()
				self:setupElementClipCounter( 0 )
			end,
			Closed_Nav = function ()
				self:setupElementClipCounter( 0 )
			end
		}
	}
	BookmarksList.id = "BookmarksList"
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.Frameline0:close()
		element.FramelineVertical00:close()
		element.Frameline00:close()
		element.FramelineVertical000:close()
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
		element.FramelineVertical0000:close()
		element.FramelineVertical0001:close()
		element.BookmarksList:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

