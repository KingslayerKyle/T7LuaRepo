require( "ui.uieditor.widgets.Terminal.Frame_line" )
require( "ui.uieditor.widgets.Terminal.Frame_lineVertical" )

CoD.Doa2VideoWidget = InheritFrom( LUI.UIElement )
CoD.Doa2VideoWidget.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.Doa2VideoWidget )
	self.id = "Doa2VideoWidget"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 900 )
	self:setTopBottom( true, false, 0, 600 )
	
	local blackleftBG = LUI.UIImage.new()
	blackleftBG:setLeftRight( true, true, 0, 0 )
	blackleftBG:setTopBottom( false, true, -600, 0 )
	blackleftBG:setRGB( 0, 0, 0 )
	blackleftBG:setAlpha( 1 )
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
	
	local frameTopLeft1 = LUI.UIImage.new()
	frameTopLeft1:setLeftRight( true, false, 14.29, 215.29 )
	frameTopLeft1:setTopBottom( true, false, 30.5, 37.5 )
	frameTopLeft1:setImage( RegisterImage( "uie_t7_menu_cp_datavault_frame_medbar" ) )
	self:addElement( frameTopLeft1 )
	self.frameTopLeft1 = frameTopLeft1
	
	local Frameline00 = CoD.Frame_line.new( menu, controller )
	Frameline00:setLeftRight( true, false, 206.52, 890.65 )
	Frameline00:setTopBottom( true, false, 541.36, 548.36 )
	self:addElement( Frameline00 )
	self.Frameline00 = Frameline00
	
	local frameTopLeft10 = LUI.UIImage.new()
	frameTopLeft10:setLeftRight( true, false, 12.57, 213.57 )
	frameTopLeft10:setTopBottom( true, false, 541.36, 548.36 )
	frameTopLeft10:setImage( RegisterImage( "uie_t7_menu_cp_datavault_frame_medbar" ) )
	self:addElement( frameTopLeft10 )
	self.frameTopLeft10 = frameTopLeft10
	
	local FramelineVertical000 = CoD.Frame_lineVertical.new( menu, controller )
	FramelineVertical000:setLeftRight( true, false, 13.91, 20.49 )
	FramelineVertical000:setTopBottom( true, false, 31.5, 555.11 )
	self:addElement( FramelineVertical000 )
	self.FramelineVertical000 = FramelineVertical000
	
	local Frameline000 = CoD.Frame_line.new( menu, controller )
	Frameline000:setLeftRight( true, false, 111.79, 815.23 )
	Frameline000:setTopBottom( true, false, 536.6, 543.6 )
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
	dot1100:setLeftRight( true, false, 107.56, 114.56 )
	dot1100:setTopBottom( true, false, 536.36, 543.36 )
	dot1100:setImage( RegisterImage( "uie_t7_menu_cp_datavault_dot" ) )
	self:addElement( dot1100 )
	self.dot1100 = dot1100
	
	local doubleline = LUI.UIImage.new()
	doubleline:setLeftRight( true, false, 530.65, 887.65 )
	doubleline:setTopBottom( true, false, 541.36, 548.36 )
	doubleline:setImage( RegisterImage( "uie_t7_menu_cp_datavault_frame_doubleline" ) )
	self:addElement( doubleline )
	self.doubleline = doubleline
	
	local FrameTopLeft001 = LUI.UIImage.new()
	FrameTopLeft001:setLeftRight( true, false, 15.5, 21.5 )
	FrameTopLeft001:setTopBottom( true, false, 423, 435 )
	FrameTopLeft001:setImage( RegisterImage( "uie_t7_menu_cp_datavault_frame_smallbar" ) )
	self:addElement( FrameTopLeft001 )
	self.FrameTopLeft001 = FrameTopLeft001
	
	local FrameTopLeft0000 = LUI.UIImage.new()
	FrameTopLeft0000:setLeftRight( true, false, 84, 90 )
	FrameTopLeft0000:setTopBottom( true, false, 540, 552 )
	FrameTopLeft0000:setImage( RegisterImage( "uie_t7_menu_cp_datavault_frame_smallbar" ) )
	self:addElement( FrameTopLeft0000 )
	self.FrameTopLeft0000 = FrameTopLeft0000
	
	local fluff200 = LUI.UIImage.new()
	fluff200:setLeftRight( true, false, 109.79, 180.79 )
	fluff200:setTopBottom( true, false, 541.5, 547.42 )
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
	Frameline0000:setLeftRight( true, false, 109.79, 889.65 )
	Frameline0000:setTopBottom( true, false, 536.36, 543.36 )
	self:addElement( Frameline0000 )
	self.Frameline0000 = Frameline0000
	
	local Frameline0001 = CoD.Frame_line.new( menu, controller )
	Frameline0001:setLeftRight( true, false, 109.79, 889.65 )
	Frameline0001:setTopBottom( true, false, 536.36, 543.36 )
	self:addElement( Frameline0001 )
	self.Frameline0001 = Frameline0001
	
	local Frameline0002 = CoD.Frame_line.new( menu, controller )
	Frameline0002:setLeftRight( true, false, 109.79, 889.37 )
	Frameline0002:setTopBottom( true, false, 536.36, 543.36 )
	self:addElement( Frameline0002 )
	self.Frameline0002 = Frameline0002
	
	local Frameline001 = CoD.Frame_line.new( menu, controller )
	Frameline001:setLeftRight( true, false, 206.52, 890.65 )
	Frameline001:setTopBottom( true, false, 541.36, 548.36 )
	self:addElement( Frameline001 )
	self.Frameline001 = Frameline001
	
	local Frameline002 = CoD.Frame_line.new( menu, controller )
	Frameline002:setLeftRight( true, false, 206.52, 890.65 )
	Frameline002:setTopBottom( true, false, 541.36, 548.36 )
	self:addElement( Frameline002 )
	self.Frameline002 = Frameline002
	
	local FramelineVertical0000 = CoD.Frame_lineVertical.new( menu, controller )
	FramelineVertical0000:setLeftRight( true, false, 13.91, 20.49 )
	FramelineVertical0000:setTopBottom( true, false, 31.5, 555.11 )
	self:addElement( FramelineVertical0000 )
	self.FramelineVertical0000 = FramelineVertical0000
	
	local FramelineVertical0001 = CoD.Frame_lineVertical.new( menu, controller )
	FramelineVertical0001:setLeftRight( true, false, 14.43, 21 )
	FramelineVertical0001:setTopBottom( true, false, 28.4, 552 )
	self:addElement( FramelineVertical0001 )
	self.FramelineVertical0001 = FramelineVertical0001
	
	local cross = LUI.UIImage.new()
	cross:setLeftRight( true, false, 110.27, 116.27 )
	cross:setTopBottom( true, false, 31, 37 )
	cross:setImage( RegisterImage( "uie_t7_menu_cp_datavault_cross" ) )
	self:addElement( cross )
	self.cross = cross
	
	local Movie0 = LUI.UIImage.new()
	Movie0:setLeftRight( true, false, 21.5, 881.37 )
	Movie0:setTopBottom( true, false, 38.5, 536.36 )
	Movie0:setupMoviePlayback( "cp_doa_bo3_titlescreen;cp_doa_bo3_titlescreen;cp_doa_bo3_titlescreen" )
	Movie0:registerEventHandler( "menu_opened", function ( element, event )
		local f2_local0 = nil
		SendMenuResponse( self, "PersonalDataVaultMenu", "doa2", controller )
		if not f2_local0 then
			f2_local0 = element:dispatchEventToChildren( event )
		end
		return f2_local0
	end )
	self:addElement( Movie0 )
	self.Movie0 = Movie0
	
	local Movie00 = LUI.UIImage.new()
	Movie00:setLeftRight( true, false, 21.5, 881.37 )
	Movie00:setTopBottom( true, false, 38.5, 536.36 )
	Movie00:setupMoviePlayback( "cp_doa_bo3_titlescreen" )
	Movie00:registerEventHandler( "menu_opened", function ( element, event )
		local f3_local0 = nil
		SendMenuResponse( self, "PersonalDataVaultMenu", "doa2", controller )
		if not f3_local0 then
			f3_local0 = element:dispatchEventToChildren( event )
		end
		return f3_local0
	end )
	self:addElement( Movie00 )
	self.Movie00 = Movie00
	
	local Movie01 = LUI.UIImage.new()
	Movie01:setLeftRight( true, false, 21.5, 881.37 )
	Movie01:setTopBottom( true, false, 38.5, 536.36 )
	Movie01:setupMoviePlayback( "cp_doa_bo3_titlescreen" )
	Movie01:registerEventHandler( "menu_opened", function ( element, event )
		local f4_local0 = nil
		SendMenuResponse( self, "PersonalDataVaultMenu", "doa2", controller )
		if not f4_local0 then
			f4_local0 = element:dispatchEventToChildren( event )
		end
		return f4_local0
	end )
	self:addElement( Movie01 )
	self.Movie01 = Movie01
	
	menu:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, nil, function ( element, menu, controller, model )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
		return true
	end, false )
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
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

