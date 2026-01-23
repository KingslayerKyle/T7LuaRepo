require( "ui.uieditor.widgets.CPLevels.ChyronText.ChyronScrollingText" )
require( "ui.uieditor.widgets.CPLevels.ChyronText.ChyronFlashLine" )
require( "ui.uieditor.widgets.StartGameFlow.LoadingScreenTalkerWidgetCPZM" )

local f0_local0, f0_local1, f0_local2, f0_local3 = nil
local f0_local4 = function ( f1_arg0, f1_arg1 )
	for f1_local0 = 1, #f1_arg0.slideQueue, 1 do
		local f1_local3 = f1_arg0.slideQueue[f1_local0]
		f1_local3.element:playClip( "FadeOut" )
		f1_local3.element = nil
	end
	f1_arg0:close()
end

local f0_local5 = function ( f2_arg0, f2_arg1 )
	for f2_local0 = 1, #f2_arg0.slideQueue, 1 do
		local f2_local3 = f2_arg0.slideQueue[f2_local0]
		if f2_local3.removePunctuation then
			local f2_local4 = string.sub( f2_local3.word, 1, -3 ) .. string.sub( f2_local3.word, -1, -1 )
			if f2_local3.removeStartPunctuation then
				f2_local4 = string.sub( f2_local4, 3 )
			end
			f2_local3.element.Text:setText( f2_local4 )
			f2_local3.element.Text2:setText( f2_local4 )
		end
		f2_local3.element:beginAnimation( "keyframe", 400, false, true, CoD.TweenType.Linear )
		Engine.PlaySound( "uin_chyron_move_left_all" )
		f2_local3.element:setLeftRight( true, false, f2_local3.keepLeft, f2_local3.keepLeft + f2_local3.right - f2_local3.left )
	end
	f2_arg0.Chyron:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Linear )
	f2_arg0.Chyron:setAlpha( 0 )
	f2_arg0:addElement( LUI.UITimer.new( 3000, "fade_out_start", true ) )
end

local f0_local6 = function ( f3_arg0, f3_arg1 )
	if #f3_arg0.glowQueue == 0 then
		f3_arg0._timer:close()
		f3_arg0._timer = nil
		f3_arg0:addElement( LUI.UITimer.new( 800, "slide_start", true ) )
		return 
	else
		local f3_local0 = math.random( 1, #f3_arg0.glowQueue )
		local f3_local1 = f3_arg0.glowQueue[f3_local0]
		f3_arg0.glowQueue[f3_local0] = f3_arg0.glowQueue[#f3_arg0.glowQueue]
		table.remove( f3_arg0.glowQueue )
		local f3_local2 = f3_local1.element
		Engine.PlaySound( "uin_chyron_disapear" )
		f3_local2:playClip( "Glow" )
	end
end

local f0_local7 = function ( menu, controller )
	menu._timer = LUI.UITimer.new( 500 / math.max( 1, #menu.glowQueue ), "glow_update", false )
	menu:addElement( menu._timer )
end

local f0_local8 = function ( f5_arg0, f5_arg1 )
	if f5_arg1.interrupted then
		return 
	end
	f5_arg0._updateCount = f5_arg0._updateCount + 1
	if not (f5_arg0._updateCount >= 5 and (f5_arg0._updateCount <= 5 or f5_arg0._updateCount >= 10)) or f5_arg0._updateCount > 12 and f5_arg0._updateCount < 16 then
		return 
	elseif #f5_arg0.wordsQueue == 0 then
		f5_arg0._timer:close()
		f5_arg0._timer = nil
		f5_arg0._updateCount = 0
		f5_arg0:addElement( LUI.UITimer.new( 1700, "glow_start_updates", true ) )
		return 
	elseif f5_arg0._updateCount == 10 then
		for f5_local0 = 1, 3, 1 do
			local f5_local3 = f5_local0
			f0_local8( f5_arg0, {
				controller = f5_arg1.controller
			} )
			if #f5_arg0.wordsQueue == 0 then
				return 
			end
		end
	elseif f5_arg0._updateCount == 16 then
		f0_local8( f5_arg0, {
			controller = f5_arg1.controller
		} )
		if #f5_arg0.wordsQueue == 0 then
			return 
		end
	end
	f5_arg0._skipped = 0
	local f5_local0 = CoD.ChyronElement.new( f5_arg0, f5_arg1.controller )
	local f5_local1 = math.random( 1, #f5_arg0.wordsQueue )
	local f5_local2 = f5_arg0.wordsQueue[f5_local1]
	f5_arg0.wordsQueue[f5_local1] = f5_arg0.wordsQueue[#f5_arg0.wordsQueue]
	table.remove( f5_arg0.wordsQueue )
	if f5_local2.keep then
		f5_arg0.slideQueue[#f5_arg0.slideQueue + 1] = f5_local2
		f5_arg0.slideQueue[#f5_arg0.slideQueue].element = f5_local0
	else
		f5_arg0.glowQueue[#f5_arg0.glowQueue + 1] = f5_local2
		f5_arg0.glowQueue[#f5_arg0.glowQueue].element = f5_local0
	end
	f5_local0.Text:setText( f5_local2.word )
	f5_local0.Text2:setText( f5_local2.word )
	local f5_local3 = math.random( 200, 1000 )
	Engine.PlaySound( "uin_chyron_move_left" )
	local f5_local4 = f5_local2.bottom - f5_local2.top
	f5_local0:setLeftRight( true, false, f5_local3, f5_local3 + f5_local2.right - f5_local2.left )
	f5_local0:setTopBottom( false, true, 0, f5_local4 )
	f5_local0:addElementBefore( f5_arg0.Chyron )
	f5_local0:beginAnimation( "keyframe", f0_local1 * 210 / f0_local2, false, false, CoD.TweenType.Linear )
	f5_local0:setTopBottom( false, true, -210, -210 + f5_local2.bottom - f5_local2.top )
	f5_local0.Text:setAlpha( 0 )
	f5_local0:registerEventHandler( "transition_complete_keyframe", function ( element, event )
		f5_local0:playClip( "GrowText" )
		f5_local0:beginAnimation( "keyframe", 200, false, true, CoD.TweenType.Linear )
		f5_local0:setLeftRight( true, false, f5_local2.left, f5_local2.right )
		f5_local0:setTopBottom( false, true, f5_local2.top, f5_local2.bottom )
		f5_local0:registerEventHandler( "transition_complete_keyframe", nil )
	end )
	local f5_local5 = CoD.ChyronElement.new( f5_arg0, f5_arg1.controller )
	f5_local5.Text:setText( f5_local2.word )
	f5_local5.Text2:setText( f5_local2.word )
	f5_local5:setLeftRight( true, false, f5_local3, f5_local3 + f5_local2.right - f5_local2.left )
	f5_local5:setTopBottom( false, true, 0, f5_local4 )
	f5_local5:addElementBefore( f5_arg0.Chyron )
	f5_local5:playClip( "FadeInBG" )
	f5_local5:beginAnimation( "keyframe", f0_local1 * 300 / f0_local2, false, false, CoD.TweenType.Linear )
	f5_local5:setTopBottom( false, true, -300, -300 + f5_local2.bottom - f5_local2.top )
end

local f0_local9 = function ( menu, controller )
	menu._timer = LUI.UITimer.new( f0_local3, {
		name = "chyron_update",
		controller = controller.controller
	}, false )
	menu:addElement( menu._timer )
end

local f0_local10 = function ()
	local f8_local0 = Dvar.loc_language:get()
	if f8_local0 == CoD.LANGUAGE_TRADITIONALCHINESE or f8_local0 == CoD.LANGUAGE_SIMPLIFIEDCHINESE or f8_local0 == CoD.LANGUAGE_JAPANESE or f8_local0 == CoD.LANGUAGE_FULLJAPANESE then
		return true
	else
		return false
	end
end

local PostLoadFunc = function ( f9_arg0, f9_arg1 )
	f9_arg0.linesFull = {}
	f9_arg0.linesShort = {}
	f9_arg0.wordsQueue = {}
	f9_arg0.glowQueue = {}
	f9_arg0.slideQueue = {}
	f9_arg0:setupPausableContainer()
	local f9_local0 = "[^ %-:%.,]+[%-:%.,]? ?"
	local f9_local1 = "[^ :%.,]+[:%.,]?[%.]?[%.]? ?"
	local f9_local2 = ",:%."
	for f9_local3 = 1, 5, 1 do
		local f9_local6 = Engine.GetModel( f9_arg0:getModel(), "line" .. f9_local3 .. "full" )
		local f9_local7 = Engine.GetModel( f9_arg0:getModel(), "line" .. f9_local3 .. "short" )
		local f9_local8 = f9_arg0["Line" .. f9_local3]
		f9_local8:setAlpha( 0 )
		if f9_local6 and f9_local7 then
			f9_arg0.linesFull[f9_local3] = Engine.Localize( Engine.GetModelValue( f9_local6 ) )
			f9_arg0.linesShort[f9_local3] = Engine.Localize( Engine.GetModelValue( f9_local7 ) )
			local f9_local9, f9_local10, f9_local11, f9_local12 = f9_local8:getLocalLeftRight()
			local f9_local13, f9_local14, f9_local15, f9_local16 = f9_local8:getLocalTopBottom()
			local f9_local17 = ""
			local f9_local18 = 0
			local f9_local19 = f9_local11
			local f9_local20 = {}
			local f9_local21 = string.sub( f9_arg0.linesShort[f9_local3], 2, -2 )
			for f9_local25 in string.gmatch( f9_local21, f9_local0 ) do
				f9_local20[#f9_local20 + 1] = f9_local25
			end
			f9_local22 = string.sub( f9_arg0.linesFull[f9_local3], 2, -2 )
			f9_local23 = string.gmatch( f9_local22, f9_local0 )
			f9_local24 = {}
			f9_local25 = f9_local23
			local f9_local26, f9_local27 = nil
			goto basicblock_10:
			local f9_local28 = f9_local25( f9_local26, f9_local27 )
			while f9_local28 ~= nil do
				f9_local27 = f9_local28
				table.insert( f9_local24, f9_local28 )
				f9_local28 = f9_local25( f9_local26, f9_local27 )
			end
			if f0_local10() then
				f9_local25 = string.find( f9_local22, f9_local21 )
				if f9_local25 then
					f9_local24 = {}
					table.insert( f9_local24, string.sub( f9_local22, 0, f9_local25 - 1 ) )
					table.insert( f9_local24, f9_local21 )
					table.insert( f9_local24, string.sub( f9_local22, f9_local25 + #f9_local21, #f9_local22 ) )
				end
			end
			for f9_local28, f9_local35 in pairs( f9_local24 ) do
				local f9_local31 = false
				local f9_local32 = false
				local f9_local30 = false
				local f9_local29 = f9_local35
				if string.byte( f9_local29, 1 ) == 194 and string.byte( f9_local29, 2 ) == 161 then
					f9_local29 = string.sub( f9_local29, 3 )
					f9_local30 = true
				end
				if #f9_local20 > 0 and (f9_local29 == f9_local20[1] or string.sub( f9_local29, 1, -2 ) == f9_local20[1]) then
					table.remove( f9_local20, 1 )
					f9_local31 = true
				elseif #f9_local20 > 0 and string.len( f9_local29 ) >= 3 and string.sub( f9_local29, 1, -3 ) == f9_local20[1] and string.find( f9_local2, string.sub( f9_local29, -2, -2 ) ) ~= nil then
					table.remove( f9_local20, 1 )
					f9_local31 = true
					f9_local32 = true
				end
				f9_local17 = f9_local17 .. f9_local35
				f9_local8:setText( f9_local17 )
				local f9_local33 = f9_local11 + f9_local18
				f9_local18 = f9_local8:getTextWidth()
				local f9_local34 = f9_local11 + f9_local18
				f9_arg0.wordsQueue[#f9_arg0.wordsQueue + 1] = {
					word = f9_local35,
					keepLeft = f9_local19,
					left = f9_local33,
					right = f9_local34,
					top = f9_local15,
					bottom = f9_local16,
					keep = f9_local31,
					removePunctuation = f9_local32,
					removeStartPunctuation = f9_local30
				}
				if f9_local31 then
					f9_local19 = f9_local19 + f9_local34 - f9_local33
				end
			end
		end
		f9_local0 = f9_local1
	end
	local f9_local3, f9_local4, f9_local5, f9_local36 = f9_arg0.Chyron.Chyron:getLocalTopBottom()
	f0_local2 = f9_local36 - f9_local5
	f0_local0 = math.floor( f0_local2 / 33 + 0.5 )
	f0_local3 = 80
	f0_local1 = f0_local3 * f0_local0
	f9_arg0:registerEventHandler( "chyron_update", f0_local8 )
	f9_arg0:registerEventHandler( "chyron_start_updates", f0_local9 )
	f9_arg0:registerEventHandler( "glow_update", f0_local6 )
	f9_arg0:registerEventHandler( "glow_start_updates", f0_local7 )
	f9_arg0:registerEventHandler( "slide_start", f0_local5 )
	f9_arg0:registerEventHandler( "fade_out_start", f0_local4 )
	f9_arg0._skipped = 0
	f9_arg0._sinceLastLine = 0
	f9_arg0._updateCount = 0
	f9_arg0:addElement( LUI.UITimer.new( 940, {
		name = "chyron_start_updates",
		controller = f9_arg1
	}, true ) )
	local f9_local6 = f9_arg0.close
	f9_arg0.close = function ( f10_arg0 )
		f10_arg0:playClip( "Close" )
		SendOwnMenuResponse( f10_arg0, f9_arg1, "closed" )
		f10_arg0:registerEventHandler( "clip_over", f9_local6 )
		if f10_arg0._timer ~= nil then
			f10_arg0._timer:close()
			f10_arg0._timer = nil
		end
	end
	
end

LUI.createMenu.CPChyron = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "CPChyron" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "HUD"
	self:setOwner( controller )
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, true, 0, 0 )
	self:playSound( "menu_open", controller )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "CPChyron.buttonPrompts" )
	self.anyChildUsesUpdateState = true
	
	local BG = LUI.UIImage.new()
	BG:setLeftRight( true, true, 0, 0 )
	BG:setTopBottom( true, true, 0, 0 )
	BG:setRGB( 0, 0, 0 )
	self:addElement( BG )
	self.BG = BG
	
	local Chyron = CoD.ChyronScrollingText.new( self, controller )
	Chyron:setLeftRight( true, false, 0, 1280 )
	Chyron:setTopBottom( true, false, 417, 2117 )
	self:addElement( Chyron )
	self.Chyron = Chyron
	
	local FadeOut = LUI.UIImage.new()
	FadeOut:setLeftRight( true, false, 0, 1280 )
	FadeOut:setTopBottom( true, false, 415, 587 )
	FadeOut:setRGB( 0, 0, 0 )
	FadeOut:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_edges" ) )
	FadeOut:setShaderVector( 0, 0.01, 0.01, 0.01, 1 )
	self:addElement( FadeOut )
	self.FadeOut = FadeOut
	
	local Line5 = LUI.UIText.new()
	Line5:setLeftRight( true, true, 32, -32 )
	Line5:setTopBottom( false, true, -58, -28 )
	Line5:setText( Engine.Localize( "Line 5" ) )
	Line5:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	Line5:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	Line5:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( Line5 )
	self.Line5 = Line5
	
	local Line4 = LUI.UIText.new()
	Line4:setLeftRight( true, true, 32, -32 )
	Line4:setTopBottom( false, true, -90, -60 )
	Line4:setText( Engine.Localize( "Line 4" ) )
	Line4:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	Line4:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	Line4:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( Line4 )
	self.Line4 = Line4
	
	local Line3 = LUI.UIText.new()
	Line3:setLeftRight( true, true, 32, -32 )
	Line3:setTopBottom( false, true, -122, -92 )
	Line3:setText( Engine.Localize( "Line 3" ) )
	Line3:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	Line3:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	Line3:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( Line3 )
	self.Line3 = Line3
	
	local Line2 = LUI.UIText.new()
	Line2:setLeftRight( true, true, 32, -32 )
	Line2:setTopBottom( false, true, -154, -124 )
	Line2:setText( Engine.Localize( "Line 2" ) )
	Line2:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	Line2:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	Line2:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( Line2 )
	self.Line2 = Line2
	
	local Line1 = LUI.UIText.new()
	Line1:setLeftRight( true, true, 32, -32 )
	Line1:setTopBottom( false, true, -186, -156 )
	Line1:setText( Engine.Localize( "Line 1" ) )
	Line1:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	Line1:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	Line1:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( Line1 )
	self.Line1 = Line1
	
	local ChyronFlashLine1 = CoD.ChyronFlashLine.new( self, controller )
	ChyronFlashLine1:setLeftRight( true, false, 0, 100 )
	ChyronFlashLine1:setTopBottom( true, false, 0, 1 )
	ChyronFlashLine1:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "uie_aberration_no_blur" ) )
	ChyronFlashLine1:setShaderVector( 0, 0.09, 0.49, 0, 0 )
	ChyronFlashLine1:setShaderVector( 1, 0, 0, 0, 0 )
	ChyronFlashLine1:setShaderVector( 2, 0, 0, 0, 0 )
	ChyronFlashLine1:setShaderVector( 3, 0, 0, 0, 0 )
	ChyronFlashLine1:setShaderVector( 4, 0, 0, 0, 0 )
	self:addElement( ChyronFlashLine1 )
	self.ChyronFlashLine1 = ChyronFlashLine1
	
	local ChyronFlashLine2 = CoD.ChyronFlashLine.new( self, controller )
	ChyronFlashLine2:setLeftRight( true, false, 0, 100 )
	ChyronFlashLine2:setTopBottom( true, false, 0, 1 )
	ChyronFlashLine2:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "uie_aberration_no_blur" ) )
	ChyronFlashLine2:setShaderVector( 0, 0.08, 0.88, 0, 0 )
	ChyronFlashLine2:setShaderVector( 1, 0, 0, 0, 0 )
	ChyronFlashLine2:setShaderVector( 2, 0, 0, 0, 0 )
	ChyronFlashLine2:setShaderVector( 3, 0, 0, 0, 0 )
	ChyronFlashLine2:setShaderVector( 4, 0, 0, 0, 0 )
	self:addElement( ChyronFlashLine2 )
	self.ChyronFlashLine2 = ChyronFlashLine2
	
	local ChyronFlashLine3 = CoD.ChyronFlashLine.new( self, controller )
	ChyronFlashLine3:setLeftRight( true, false, 0, 100 )
	ChyronFlashLine3:setTopBottom( true, false, 0, 1 )
	ChyronFlashLine3:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "uie_aberration_no_blur" ) )
	ChyronFlashLine3:setShaderVector( 0, 0.1, 0.61, 0, 0 )
	ChyronFlashLine3:setShaderVector( 1, 0, 0, 0, 0 )
	ChyronFlashLine3:setShaderVector( 2, 0, 0, 0, 0 )
	ChyronFlashLine3:setShaderVector( 3, 0, 0, 0, 0 )
	ChyronFlashLine3:setShaderVector( 4, 0, 0, 0, 0 )
	self:addElement( ChyronFlashLine3 )
	self.ChyronFlashLine3 = ChyronFlashLine3
	
	local ChyronFlashLine4 = CoD.ChyronFlashLine.new( self, controller )
	ChyronFlashLine4:setLeftRight( true, false, 0, 100 )
	ChyronFlashLine4:setTopBottom( true, false, 0, 1 )
	ChyronFlashLine4:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "uie_aberration_no_blur" ) )
	ChyronFlashLine4:setShaderVector( 0, 0.07, 0.38, 0, 0 )
	ChyronFlashLine4:setShaderVector( 1, 0, 0, 0, 0 )
	ChyronFlashLine4:setShaderVector( 2, 0, 0, 0, 0 )
	ChyronFlashLine4:setShaderVector( 3, 0, 0, 0, 0 )
	ChyronFlashLine4:setShaderVector( 4, 0, 0, 0, 0 )
	self:addElement( ChyronFlashLine4 )
	self.ChyronFlashLine4 = ChyronFlashLine4
	
	local Team1PlayerList = LUI.UIList.new( self, controller, 5, 0, nil, false, false, 0, 0, false, false )
	Team1PlayerList:makeFocusable()
	Team1PlayerList:setLeftRight( false, false, -576, -386 )
	Team1PlayerList:setTopBottom( true, false, 36, 123 )
	Team1PlayerList:setDataSource( "LoadingScreenPlayerListTeam1" )
	Team1PlayerList:setWidgetType( CoD.LoadingScreenTalkerWidgetCPZM )
	Team1PlayerList:setVerticalCount( 4 )
	Team1PlayerList:setSpacing( 5 )
	self:addElement( Team1PlayerList )
	self.Team1PlayerList = Team1PlayerList
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )
			end,
			Close = function ()
				self:setupElementClipCounter( 3 )
				local f13_local0 = function ( f14_arg0, f14_arg1 )
					if not f14_arg1.interrupted then
						f14_arg0:beginAnimation( "keyframe", 250, false, false, CoD.TweenType.Linear )
					end
					f14_arg0:setAlpha( 0 )
					if f14_arg1.interrupted then
						self.clipFinished( f14_arg0, f14_arg1 )
					else
						f14_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				BG:beginAnimation( "keyframe", 250, false, false, CoD.TweenType.Linear )
				BG:setAlpha( 1 )
				BG:registerEventHandler( "transition_complete_keyframe", f13_local0 )
				Chyron:completeAnimation()
				self.Chyron:setAlpha( 0 )
				self.clipFinished( Chyron, {} )
				local f13_local1 = function ( f15_arg0, f15_arg1 )
					if not f15_arg1.interrupted then
						f15_arg0:beginAnimation( "keyframe", 79, false, false, CoD.TweenType.Linear )
					end
					f15_arg0:setAlpha( 0 )
					if f15_arg1.interrupted then
						self.clipFinished( f15_arg0, f15_arg1 )
					else
						f15_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				FadeOut:beginAnimation( "keyframe", 170, false, false, CoD.TweenType.Linear )
				FadeOut:setAlpha( 1 )
				FadeOut:registerEventHandler( "transition_complete_keyframe", f13_local1 )
			end
		}
	}
	Team1PlayerList.id = "Team1PlayerList"
	self:processEvent( {
		name = "menu_loaded",
		controller = controller
	} )
	self:processEvent( {
		name = "update_state",
		menu = self
	} )
	if not self:restoreState() then
		self.Team1PlayerList:processEvent( {
			name = "gain_focus",
			controller = controller
		} )
	end
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.Chyron:close()
		element.ChyronFlashLine1:close()
		element.ChyronFlashLine2:close()
		element.ChyronFlashLine3:close()
		element.ChyronFlashLine4:close()
		element.Team1PlayerList:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "CPChyron.buttonPrompts" ) )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	
	return self
end

