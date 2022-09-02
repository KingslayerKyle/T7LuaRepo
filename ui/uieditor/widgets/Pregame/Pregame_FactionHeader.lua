-- 57cb5b442eeff628c1160fbceb826f02
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.HUD.PrematchCountdown.PrematchCountdown_IconGlowPanel" )
require( "ui.uieditor.widgets.StartGameFlow.TeamIconAndNameWidget" )
require( "ui.uieditor.widgets.StartGameFlow.TeamIconAndNameWidgetForCodCaster" )
require( "ui.uieditor.widgets.StartGameFlow.LoadingScreenVSCirclePnl" )
require( "ui.uieditor.widgets.StartGameFlow.LoadingScreenFactionIcon" )

CoD.Pregame_FactionHeader = InheritFrom( LUI.UIElement )
CoD.Pregame_FactionHeader.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.Pregame_FactionHeader )
	self.id = "Pregame_FactionHeader"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 1357 )
	self:setTopBottom( true, false, 0, 159 )
	self.anyChildUsesUpdateState = true
	
	local VSglow = CoD.PrematchCountdown_IconGlowPanel.new( menu, controller )
	VSglow:setLeftRight( false, false, -267.75, 219.75 )
	VSglow:setTopBottom( false, false, -79.38, 79.38 )
	VSglow:setAlpha( 0.53 )
	self:addElement( VSglow )
	self.VSglow = VSglow
	
	local Team2Line = LUI.UIImage.new()
	Team2Line:setLeftRight( true, true, 7, -48 )
	Team2Line:setTopBottom( false, false, 40.4, 48.4 )
	Team2Line:setAlpha( 0.2 )
	Team2Line:setImage( RegisterImage( "uie_t7_menu_cac_tabline" ) )
	Team2Line:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Team2Line )
	self.Team2Line = Team2Line
	
	local Team2IconAndNameWidget = CoD.TeamIconAndNameWidget.new( menu, controller )
	Team2IconAndNameWidget:setLeftRight( false, false, -39.63, 325.13 )
	Team2IconAndNameWidget:setTopBottom( true, false, 32.88, 117.88 )
	Team2IconAndNameWidget.LoadingScreenFactionBoxPnl:setYRot( 180 )
	self:addElement( Team2IconAndNameWidget )
	self.Team2IconAndNameWidget = Team2IconAndNameWidget
	
	local Team1IconAndNameWidget = CoD.TeamIconAndNameWidget.new( menu, controller )
	Team1IconAndNameWidget:setLeftRight( false, false, -367, 33 )
	Team1IconAndNameWidget:setTopBottom( true, false, 32.88, 117.88 )
	self:addElement( Team1IconAndNameWidget )
	self.Team1IconAndNameWidget = Team1IconAndNameWidget
	
	local FrameForCodCasterLeft = CoD.TeamIconAndNameWidgetForCodCaster.new( menu, controller )
	FrameForCodCasterLeft:setLeftRight( true, false, 212.5, 677.5 )
	FrameForCodCasterLeft:setTopBottom( true, false, 31.88, 116.88 )
	FrameForCodCasterLeft:setAlpha( 0 )
	self:addElement( FrameForCodCasterLeft )
	self.FrameForCodCasterLeft = FrameForCodCasterLeft
	
	local FrameForCodCasterRight = CoD.TeamIconAndNameWidgetForCodCaster.new( menu, controller )
	FrameForCodCasterRight:setLeftRight( true, false, 640.5, 1105.5 )
	FrameForCodCasterRight:setTopBottom( true, false, 32.78, 117.78 )
	FrameForCodCasterRight:setAlpha( 0 )
	FrameForCodCasterRight.PanelLine:setYRot( 180 )
	self:addElement( FrameForCodCasterRight )
	self.FrameForCodCasterRight = FrameForCodCasterRight
	
	local FrameForCodCasterLeft0 = CoD.TeamIconAndNameWidgetForCodCaster.new( menu, controller )
	FrameForCodCasterLeft0:setLeftRight( true, false, 211.63, 676.63 )
	FrameForCodCasterLeft0:setTopBottom( true, false, 30.97, 115.97 )
	FrameForCodCasterLeft0:setAlpha( 0 )
	FrameForCodCasterLeft0.ColorPanelLine1:setAlpha( 0.4 )
	FrameForCodCasterLeft0:subscribeToGlobalModel( controller, "LoadingScreenTeamInfo", "team1FactionColor", function ( model )
		local team1FactionColor = Engine.GetModelValue( model )
		if team1FactionColor then
			FrameForCodCasterLeft0.ColorPanelLine1:setRGB( team1FactionColor )
		end
	end )
	self:addElement( FrameForCodCasterLeft0 )
	self.FrameForCodCasterLeft0 = FrameForCodCasterLeft0
	
	local FrameForCodCasterRight0 = CoD.TeamIconAndNameWidgetForCodCaster.new( menu, controller )
	FrameForCodCasterRight0:setLeftRight( true, false, 640.63, 1105.63 )
	FrameForCodCasterRight0:setTopBottom( true, false, 31.88, 116.88 )
	FrameForCodCasterRight0:setAlpha( 0 )
	FrameForCodCasterRight0.PanelLine:setYRot( 180 )
	FrameForCodCasterRight0.ColorPanelLine1:setAlpha( 0.4 )
	FrameForCodCasterRight0.ColorPanelLine1:setYRot( 180 )
	FrameForCodCasterRight0:subscribeToGlobalModel( controller, "LoadingScreenTeamInfo", "team2FactionColor", function ( model )
		local team2FactionColor = Engine.GetModelValue( model )
		if team2FactionColor then
			FrameForCodCasterRight0.ColorPanelLine1:setRGB( team2FactionColor )
		end
	end )
	self:addElement( FrameForCodCasterRight0 )
	self.FrameForCodCasterRight0 = FrameForCodCasterRight0
	
	local AxisColors = LUI.UIImage.new()
	AxisColors:setLeftRight( true, false, 689.5, 993.25 )
	AxisColors:setTopBottom( true, false, 52.9, 55.34 )
	AxisColors:subscribeToGlobalModel( controller, "LoadingScreenTeamInfo", "team2FactionColor", function ( model )
		local team2FactionColor = Engine.GetModelValue( model )
		if team2FactionColor then
			AxisColors:setRGB( team2FactionColor )
		end
	end )
	self:addElement( AxisColors )
	self.AxisColors = AxisColors
	
	local AlliesColors = LUI.UIImage.new()
	AlliesColors:setLeftRight( true, false, 321.25, 623 )
	AlliesColors:setTopBottom( true, false, 52.9, 55.34 )
	AlliesColors:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_nineslice_normal" ) )
	AlliesColors:setShaderVector( 0, 0.15, 0.24, 0, 0 )
	AlliesColors:subscribeToGlobalModel( controller, "LoadingScreenTeamInfo", "team1FactionColor", function ( model )
		local team1FactionColor = Engine.GetModelValue( model )
		if team1FactionColor then
			AlliesColors:setRGB( team1FactionColor )
		end
	end )
	self:addElement( AlliesColors )
	self.AlliesColors = AlliesColors
	
	local LoadingScreenVSCirclePnl = CoD.LoadingScreenVSCirclePnl.new( menu, controller )
	LoadingScreenVSCirclePnl:setLeftRight( true, false, 610.5, 700.5 )
	LoadingScreenVSCirclePnl:setTopBottom( true, false, 27.9, 117.78 )
	LoadingScreenVSCirclePnl:setAlpha( 0.5 )
	self:addElement( LoadingScreenVSCirclePnl )
	self.LoadingScreenVSCirclePnl = LoadingScreenVSCirclePnl
	
	local VSlineR = LUI.UIImage.new()
	VSlineR:setLeftRight( false, true, -668.5, 0 )
	VSlineR:setTopBottom( false, false, -10.47, -2.47 )
	VSlineR:setAlpha( 0.3 )
	VSlineR:setImage( RegisterImage( "uie_t7_menu_cac_tabline" ) )
	VSlineR:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( VSlineR )
	self.VSlineR = VSlineR
	
	local VSlineL = LUI.UIImage.new()
	VSlineL:setLeftRight( true, false, 0, 623 )
	VSlineL:setTopBottom( false, false, -10.47, -2.47 )
	VSlineL:setAlpha( 0.3 )
	VSlineL:setImage( RegisterImage( "uie_t7_menu_cac_tabline" ) )
	VSlineL:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( VSlineL )
	self.VSlineL = VSlineL
	
	local VScircle = LUI.UIImage.new()
	VScircle:setLeftRight( false, false, -57, 13 )
	VScircle:setTopBottom( false, false, -40.5, 27.56 )
	VScircle:setImage( RegisterImage( "uie_t7_menu_frontend_titlebackcircle" ) )
	VScircle:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( VScircle )
	self.VScircle = VScircle
	
	local VSlabel = LUI.UIText.new()
	VSlabel:setLeftRight( false, false, -103, 57 )
	VSlabel:setTopBottom( true, false, 55.88, 94.88 )
	VSlabel:setText( Engine.Localize( "VS" ) )
	VSlabel:setTTF( "fonts/FoundryGridnik-Bold.ttf" )
	VSlabel:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	VSlabel:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( VSlabel )
	self.VSlabel = VSlabel
	
	local Team1Line = LUI.UIImage.new()
	Team1Line:setLeftRight( true, true, 7, -48 )
	Team1Line:setTopBottom( false, false, -59.37, -51.37 )
	Team1Line:setAlpha( 0.2 )
	Team1Line:setImage( RegisterImage( "uie_t7_menu_cac_tabline" ) )
	Team1Line:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Team1Line )
	self.Team1Line = Team1Line
	
	local LoadingScreenFactionIcon0 = CoD.LoadingScreenFactionIcon.new( menu, controller )
	LoadingScreenFactionIcon0:setLeftRight( false, false, 10, 147.75 )
	LoadingScreenFactionIcon0:setTopBottom( false, false, -75.47, 62.28 )
	LoadingScreenFactionIcon0:subscribeToGlobalModel( controller, "LoadingScreenTeamInfo", "team2FactionIcon", function ( model )
		local team2FactionIcon = Engine.GetModelValue( model )
		if team2FactionIcon then
			LoadingScreenFactionIcon0.FactionIconSolid:setImage( RegisterImage( team2FactionIcon ) )
		end
	end )
	LoadingScreenFactionIcon0:subscribeToGlobalModel( controller, "LoadingScreenTeamInfo", "team2FactionIcon", function ( model )
		local team2FactionIcon = Engine.GetModelValue( model )
		if team2FactionIcon then
			LoadingScreenFactionIcon0.FactionIcon:setImage( RegisterImage( team2FactionIcon ) )
		end
	end )
	self:addElement( LoadingScreenFactionIcon0 )
	self.LoadingScreenFactionIcon0 = LoadingScreenFactionIcon0
	
	local LoadingScreenFactionIcon = CoD.LoadingScreenFactionIcon.new( menu, controller )
	LoadingScreenFactionIcon:setLeftRight( false, false, -191.13, -53.38 )
	LoadingScreenFactionIcon:setTopBottom( false, false, -75.47, 62.28 )
	LoadingScreenFactionIcon:subscribeToGlobalModel( controller, "LoadingScreenTeamInfo", "team1FactionIcon", function ( model )
		local team1FactionIcon = Engine.GetModelValue( model )
		if team1FactionIcon then
			LoadingScreenFactionIcon.FactionIconSolid:setImage( RegisterImage( team1FactionIcon ) )
		end
	end )
	LoadingScreenFactionIcon:subscribeToGlobalModel( controller, "LoadingScreenTeamInfo", "team1FactionIcon", function ( model )
		local team1FactionIcon = Engine.GetModelValue( model )
		if team1FactionIcon then
			LoadingScreenFactionIcon.FactionIcon:setImage( RegisterImage( team1FactionIcon ) )
		end
	end )
	self:addElement( LoadingScreenFactionIcon )
	self.LoadingScreenFactionIcon = LoadingScreenFactionIcon
	
	local FactionNameCDP = LUI.UIText.new()
	FactionNameCDP:setLeftRight( false, false, 57, 349.38 )
	FactionNameCDP:setTopBottom( true, false, 62.9, 82.9 )
	FactionNameCDP:setTTF( "fonts/FoundryGridnik-Bold.ttf" )
	FactionNameCDP:setLetterSpacing( 2.5 )
	FactionNameCDP:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	FactionNameCDP:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	FactionNameCDP:subscribeToGlobalModel( controller, "LoadingScreenTeamInfo", "team2FactionName", function ( model )
		local team2FactionName = Engine.GetModelValue( model )
		if team2FactionName then
			FactionNameCDP:setText( Engine.Localize( team2FactionName ) )
		end
	end )
	self:addElement( FactionNameCDP )
	self.FactionNameCDP = FactionNameCDP
	
	local FactionNameBlackOps = LUI.UIText.new()
	FactionNameBlackOps:setLeftRight( false, false, -394.38, -102 )
	FactionNameBlackOps:setTopBottom( true, false, 62.9, 82.9 )
	FactionNameBlackOps:setTTF( "fonts/FoundryGridnik-Bold.ttf" )
	FactionNameBlackOps:setLetterSpacing( 2.5 )
	FactionNameBlackOps:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	FactionNameBlackOps:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	FactionNameBlackOps:subscribeToGlobalModel( controller, "LoadingScreenTeamInfo", "team1FactionName", function ( model )
		local team1FactionName = Engine.GetModelValue( model )
		if team1FactionName then
			FactionNameBlackOps:setText( Engine.Localize( team1FactionName ) )
		end
	end )
	self:addElement( FactionNameBlackOps )
	self.FactionNameBlackOps = FactionNameBlackOps
	
	local FactionNameRightCodCaster = LUI.UIText.new()
	FactionNameRightCodCaster:setLeftRight( false, false, 103, 423 )
	FactionNameRightCodCaster:setTopBottom( true, false, 62.34, 81.34 )
	FactionNameRightCodCaster:setAlpha( 0 )
	FactionNameRightCodCaster:setTTF( "fonts/FoundryGridnik-Bold.ttf" )
	FactionNameRightCodCaster:setLetterSpacing( 2.5 )
	FactionNameRightCodCaster:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	FactionNameRightCodCaster:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	FactionNameRightCodCaster:subscribeToGlobalModel( controller, "LoadingScreenTeamInfo", "team2FactionName", function ( model )
		local team2FactionName = Engine.GetModelValue( model )
		if team2FactionName then
			FactionNameRightCodCaster:setText( Engine.Localize( team2FactionName ) )
		end
	end )
	self:addElement( FactionNameRightCodCaster )
	self.FactionNameRightCodCaster = FactionNameRightCodCaster
	
	local FactionNameLeftCodCaster = LUI.UIText.new()
	FactionNameLeftCodCaster:setLeftRight( false, false, -459, -139 )
	FactionNameLeftCodCaster:setTopBottom( true, false, 63.34, 82.34 )
	FactionNameLeftCodCaster:setAlpha( 0 )
	FactionNameLeftCodCaster:setTTF( "fonts/FoundryGridnik-Bold.ttf" )
	FactionNameLeftCodCaster:setLetterSpacing( 2.5 )
	FactionNameLeftCodCaster:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	FactionNameLeftCodCaster:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	FactionNameLeftCodCaster:subscribeToGlobalModel( controller, "LoadingScreenTeamInfo", "team1FactionName", function ( model )
		local team1FactionName = Engine.GetModelValue( model )
		if team1FactionName then
			FactionNameLeftCodCaster:setText( Engine.Localize( team1FactionName ) )
		end
	end )
	self:addElement( FactionNameLeftCodCaster )
	self.FactionNameLeftCodCaster = FactionNameLeftCodCaster
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 17 )

				Team2IconAndNameWidget:completeAnimation()
				self.Team2IconAndNameWidget:setAlpha( 1 )
				self.clipFinished( Team2IconAndNameWidget, {} )

				Team1IconAndNameWidget:completeAnimation()
				self.Team1IconAndNameWidget:setAlpha( 1 )
				self.clipFinished( Team1IconAndNameWidget, {} )

				FrameForCodCasterLeft:completeAnimation()
				self.FrameForCodCasterLeft:setAlpha( 0 )
				self.clipFinished( FrameForCodCasterLeft, {} )

				FrameForCodCasterRight:completeAnimation()
				self.FrameForCodCasterRight:setAlpha( 0 )
				self.clipFinished( FrameForCodCasterRight, {} )

				FrameForCodCasterLeft0:completeAnimation()
				self.FrameForCodCasterLeft0:setLeftRight( true, false, 314.5, 640.5 )
				self.FrameForCodCasterLeft0:setTopBottom( true, false, 31.97, 116.97 )
				self.FrameForCodCasterLeft0:setAlpha( 1 )
				self.clipFinished( FrameForCodCasterLeft0, {} )

				FrameForCodCasterRight0:completeAnimation()
				self.FrameForCodCasterRight0:setLeftRight( true, false, 654.5, 1008.5 )
				self.FrameForCodCasterRight0:setTopBottom( true, false, 32.78, 117.78 )
				self.FrameForCodCasterRight0:setAlpha( 1 )
				self.clipFinished( FrameForCodCasterRight0, {} )

				AxisColors:completeAnimation()
				self.AxisColors:setLeftRight( true, false, 689.5, 993.25 )
				self.AxisColors:setTopBottom( true, false, 52.9, 55.34 )
				self.clipFinished( AxisColors, {} )

				AlliesColors:completeAnimation()
				self.AlliesColors:setLeftRight( true, false, 321.25, 623 )
				self.AlliesColors:setTopBottom( true, false, 52.9, 55.34 )
				self.clipFinished( AlliesColors, {} )

				LoadingScreenVSCirclePnl:completeAnimation()
				self.LoadingScreenVSCirclePnl:setAlpha( 0.5 )
				self.clipFinished( LoadingScreenVSCirclePnl, {} )

				VScircle:completeAnimation()
				self.VScircle:setAlpha( 1 )
				self.clipFinished( VScircle, {} )

				VSlabel:completeAnimation()
				self.VSlabel:setAlpha( 1 )
				self.clipFinished( VSlabel, {} )

				LoadingScreenFactionIcon0:completeAnimation()
				self.LoadingScreenFactionIcon0:setLeftRight( false, false, 10, 147.75 )
				self.LoadingScreenFactionIcon0:setTopBottom( false, false, -75.47, 62.28 )
				self.LoadingScreenFactionIcon0:setAlpha( 1 )
				self.clipFinished( LoadingScreenFactionIcon0, {} )

				LoadingScreenFactionIcon:completeAnimation()
				self.LoadingScreenFactionIcon:setLeftRight( false, false, -191.13, -53.38 )
				self.LoadingScreenFactionIcon:setTopBottom( false, false, -75.47, 62.28 )
				self.LoadingScreenFactionIcon:setAlpha( 1 )
				self.clipFinished( LoadingScreenFactionIcon, {} )

				FactionNameCDP:completeAnimation()
				self.FactionNameCDP:setAlpha( 1 )
				self.clipFinished( FactionNameCDP, {} )

				FactionNameBlackOps:completeAnimation()
				self.FactionNameBlackOps:setAlpha( 1 )
				self.clipFinished( FactionNameBlackOps, {} )

				FactionNameRightCodCaster:completeAnimation()
				self.FactionNameRightCodCaster:setAlpha( 0 )
				self.clipFinished( FactionNameRightCodCaster, {} )

				FactionNameLeftCodCaster:completeAnimation()
				self.FactionNameLeftCodCaster:setAlpha( 0 )
				self.clipFinished( FactionNameLeftCodCaster, {} )
			end,
			StartLoading = function ()
				self:setupElementClipCounter( 17 )

				local VSglowFrame2 = function ( VSglow, event )
					local VSglowFrame3 = function ( VSglow, event )
						if not event.interrupted then
							VSglow:beginAnimation( "keyframe", 309, false, false, CoD.TweenType.Linear )
						end
						VSglow:setAlpha( 0.53 )
						if event.interrupted then
							self.clipFinished( VSglow, event )
						else
							VSglow:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						VSglowFrame3( VSglow, event )
						return 
					else
						VSglow:beginAnimation( "keyframe", 1480, false, false, CoD.TweenType.Linear )
						VSglow:registerEventHandler( "transition_complete_keyframe", VSglowFrame3 )
					end
				end
				
				VSglow:completeAnimation()
				self.VSglow:setAlpha( 0 )
				VSglowFrame2( VSglow, {} )
				local Team2LineFrame2 = function ( Team2Line, event )
					local Team2LineFrame3 = function ( Team2Line, event )
						if not event.interrupted then
							Team2Line:beginAnimation( "keyframe", 219, false, false, CoD.TweenType.Linear )
						end
						Team2Line:setAlpha( 0.2 )
						if event.interrupted then
							self.clipFinished( Team2Line, event )
						else
							Team2Line:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						Team2LineFrame3( Team2Line, event )
						return 
					else
						Team2Line:beginAnimation( "keyframe", 1700, false, false, CoD.TweenType.Linear )
						Team2Line:registerEventHandler( "transition_complete_keyframe", Team2LineFrame3 )
					end
				end
				
				Team2Line:completeAnimation()
				self.Team2Line:setAlpha( 0 )
				Team2LineFrame2( Team2Line, {} )
				local Team2IconAndNameWidgetFrame2 = function ( Team2IconAndNameWidget, event )
					local Team2IconAndNameWidgetFrame3 = function ( Team2IconAndNameWidget, event )
						if not event.interrupted then
							Team2IconAndNameWidget:beginAnimation( "keyframe", 199, false, false, CoD.TweenType.Bounce )
						end
						Team2IconAndNameWidget:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( Team2IconAndNameWidget, event )
						else
							Team2IconAndNameWidget:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						Team2IconAndNameWidgetFrame3( Team2IconAndNameWidget, event )
						return 
					else
						Team2IconAndNameWidget:beginAnimation( "keyframe", 1700, false, false, CoD.TweenType.Linear )
						Team2IconAndNameWidget:registerEventHandler( "transition_complete_keyframe", Team2IconAndNameWidgetFrame3 )
					end
				end
				
				Team2IconAndNameWidget:completeAnimation()
				self.Team2IconAndNameWidget:setAlpha( 0 )
				Team2IconAndNameWidgetFrame2( Team2IconAndNameWidget, {} )
				local Team1IconAndNameWidgetFrame2 = function ( Team1IconAndNameWidget, event )
					local Team1IconAndNameWidgetFrame3 = function ( Team1IconAndNameWidget, event )
						if not event.interrupted then
							Team1IconAndNameWidget:beginAnimation( "keyframe", 199, false, false, CoD.TweenType.Bounce )
						end
						Team1IconAndNameWidget:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( Team1IconAndNameWidget, event )
						else
							Team1IconAndNameWidget:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						Team1IconAndNameWidgetFrame3( Team1IconAndNameWidget, event )
						return 
					else
						Team1IconAndNameWidget:beginAnimation( "keyframe", 1700, false, false, CoD.TweenType.Linear )
						Team1IconAndNameWidget:registerEventHandler( "transition_complete_keyframe", Team1IconAndNameWidgetFrame3 )
					end
				end
				
				Team1IconAndNameWidget:completeAnimation()
				self.Team1IconAndNameWidget:setAlpha( 0 )
				Team1IconAndNameWidgetFrame2( Team1IconAndNameWidget, {} )

				FrameForCodCasterLeft:completeAnimation()
				self.FrameForCodCasterLeft:setAlpha( 0 )
				self.clipFinished( FrameForCodCasterLeft, {} )

				FrameForCodCasterRight:completeAnimation()
				self.FrameForCodCasterRight:setAlpha( 0 )
				self.clipFinished( FrameForCodCasterRight, {} )
				local LoadingScreenVSCirclePnlFrame2 = function ( LoadingScreenVSCirclePnl, event )
					local LoadingScreenVSCirclePnlFrame3 = function ( LoadingScreenVSCirclePnl, event )
						if not event.interrupted then
							LoadingScreenVSCirclePnl:beginAnimation( "keyframe", 199, false, false, CoD.TweenType.Bounce )
						end
						LoadingScreenVSCirclePnl:setAlpha( 0.5 )
						if event.interrupted then
							self.clipFinished( LoadingScreenVSCirclePnl, event )
						else
							LoadingScreenVSCirclePnl:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						LoadingScreenVSCirclePnlFrame3( LoadingScreenVSCirclePnl, event )
						return 
					else
						LoadingScreenVSCirclePnl:beginAnimation( "keyframe", 1700, false, false, CoD.TweenType.Linear )
						LoadingScreenVSCirclePnl:registerEventHandler( "transition_complete_keyframe", LoadingScreenVSCirclePnlFrame3 )
					end
				end
				
				LoadingScreenVSCirclePnl:completeAnimation()
				self.LoadingScreenVSCirclePnl:setAlpha( 0 )
				LoadingScreenVSCirclePnlFrame2( LoadingScreenVSCirclePnl, {} )
				local VSlineRFrame2 = function ( VSlineR, event )
					local VSlineRFrame3 = function ( VSlineR, event )
						if not event.interrupted then
							VSlineR:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
						end
						VSlineR:setLeftRight( false, true, -609.5, 59 )
						VSlineR:setTopBottom( false, false, 2.53, 10.53 )
						VSlineR:setAlpha( 0.2 )
						if event.interrupted then
							self.clipFinished( VSlineR, event )
						else
							VSlineR:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						VSlineRFrame3( VSlineR, event )
						return 
					else
						VSlineR:beginAnimation( "keyframe", 1639, false, false, CoD.TweenType.Linear )
						VSlineR:registerEventHandler( "transition_complete_keyframe", VSlineRFrame3 )
					end
				end
				
				VSlineR:completeAnimation()
				self.VSlineR:setLeftRight( false, true, -609.5, 59 )
				self.VSlineR:setTopBottom( false, false, 2.53, 10.53 )
				self.VSlineR:setAlpha( 0 )
				VSlineRFrame2( VSlineR, {} )
				local VSlineLFrame2 = function ( VSlineL, event )
					local VSlineLFrame3 = function ( VSlineL, event )
						if not event.interrupted then
							VSlineL:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
						end
						VSlineL:setLeftRight( true, false, -18, 605 )
						VSlineL:setTopBottom( false, false, 2.53, 10.53 )
						VSlineL:setAlpha( 0.2 )
						if event.interrupted then
							self.clipFinished( VSlineL, event )
						else
							VSlineL:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						VSlineLFrame3( VSlineL, event )
						return 
					else
						VSlineL:beginAnimation( "keyframe", 1639, false, false, CoD.TweenType.Linear )
						VSlineL:registerEventHandler( "transition_complete_keyframe", VSlineLFrame3 )
					end
				end
				
				VSlineL:completeAnimation()
				self.VSlineL:setLeftRight( true, false, -18, 605 )
				self.VSlineL:setTopBottom( false, false, 2.53, 10.53 )
				self.VSlineL:setAlpha( 0 )
				VSlineLFrame2( VSlineL, {} )
				local VScircleFrame2 = function ( VScircle, event )
					local VScircleFrame3 = function ( VScircle, event )
						if not event.interrupted then
							VScircle:beginAnimation( "keyframe", 90, false, false, CoD.TweenType.Bounce )
						end
						VScircle:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( VScircle, event )
						else
							VScircle:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						VScircleFrame3( VScircle, event )
						return 
					else
						VScircle:beginAnimation( "keyframe", 1679, false, false, CoD.TweenType.Linear )
						VScircle:registerEventHandler( "transition_complete_keyframe", VScircleFrame3 )
					end
				end
				
				VScircle:completeAnimation()
				self.VScircle:setAlpha( 0 )
				VScircleFrame2( VScircle, {} )
				local VSlabelFrame2 = function ( VSlabel, event )
					local VSlabelFrame3 = function ( VSlabel, event )
						if not event.interrupted then
							VSlabel:beginAnimation( "keyframe", 80, false, false, CoD.TweenType.Linear )
						end
						VSlabel:setAlpha( 0.8 )
						if event.interrupted then
							self.clipFinished( VSlabel, event )
						else
							VSlabel:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						VSlabelFrame3( VSlabel, event )
						return 
					else
						VSlabel:beginAnimation( "keyframe", 1679, false, false, CoD.TweenType.Linear )
						VSlabel:registerEventHandler( "transition_complete_keyframe", VSlabelFrame3 )
					end
				end
				
				VSlabel:completeAnimation()
				self.VSlabel:setAlpha( 0 )
				VSlabelFrame2( VSlabel, {} )
				local Team1LineFrame2 = function ( Team1Line, event )
					local Team1LineFrame3 = function ( Team1Line, event )
						if not event.interrupted then
							Team1Line:beginAnimation( "keyframe", 269, false, false, CoD.TweenType.Linear )
						end
						Team1Line:setAlpha( 0.2 )
						if event.interrupted then
							self.clipFinished( Team1Line, event )
						else
							Team1Line:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						Team1LineFrame3( Team1Line, event )
						return 
					else
						Team1Line:beginAnimation( "keyframe", 1389, false, false, CoD.TweenType.Linear )
						Team1Line:registerEventHandler( "transition_complete_keyframe", Team1LineFrame3 )
					end
				end
				
				Team1Line:completeAnimation()
				self.Team1Line:setAlpha( 0 )
				Team1LineFrame2( Team1Line, {} )
				local LoadingScreenFactionIcon0Frame2 = function ( LoadingScreenFactionIcon0, event )
					local LoadingScreenFactionIcon0Frame3 = function ( LoadingScreenFactionIcon0, event )
						if not event.interrupted then
							LoadingScreenFactionIcon0:beginAnimation( "keyframe", 199, false, false, CoD.TweenType.Bounce )
						end
						LoadingScreenFactionIcon0:setLeftRight( false, false, 30.5, 168.25 )
						LoadingScreenFactionIcon0:setTopBottom( false, false, -62.35, 75.4 )
						LoadingScreenFactionIcon0:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( LoadingScreenFactionIcon0, event )
						else
							LoadingScreenFactionIcon0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						LoadingScreenFactionIcon0Frame3( LoadingScreenFactionIcon0, event )
						return 
					else
						LoadingScreenFactionIcon0:beginAnimation( "keyframe", 1700, false, false, CoD.TweenType.Linear )
						LoadingScreenFactionIcon0:registerEventHandler( "transition_complete_keyframe", LoadingScreenFactionIcon0Frame3 )
					end
				end
				
				LoadingScreenFactionIcon0:completeAnimation()
				self.LoadingScreenFactionIcon0:setLeftRight( false, false, 30.5, 168.25 )
				self.LoadingScreenFactionIcon0:setTopBottom( false, false, -62.35, 75.4 )
				self.LoadingScreenFactionIcon0:setAlpha( 0 )
				LoadingScreenFactionIcon0Frame2( LoadingScreenFactionIcon0, {} )
				local LoadingScreenFactionIconFrame2 = function ( LoadingScreenFactionIcon, event )
					local LoadingScreenFactionIconFrame3 = function ( LoadingScreenFactionIcon, event )
						if not event.interrupted then
							LoadingScreenFactionIcon:beginAnimation( "keyframe", 199, false, false, CoD.TweenType.Bounce )
						end
						LoadingScreenFactionIcon:setLeftRight( false, false, -170.63, -32.88 )
						LoadingScreenFactionIcon:setTopBottom( false, false, -62.35, 75.4 )
						LoadingScreenFactionIcon:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( LoadingScreenFactionIcon, event )
						else
							LoadingScreenFactionIcon:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						LoadingScreenFactionIconFrame3( LoadingScreenFactionIcon, event )
						return 
					else
						LoadingScreenFactionIcon:beginAnimation( "keyframe", 1700, false, false, CoD.TweenType.Linear )
						LoadingScreenFactionIcon:registerEventHandler( "transition_complete_keyframe", LoadingScreenFactionIconFrame3 )
					end
				end
				
				LoadingScreenFactionIcon:completeAnimation()
				self.LoadingScreenFactionIcon:setLeftRight( false, false, -170.63, -32.88 )
				self.LoadingScreenFactionIcon:setTopBottom( false, false, -62.35, 75.4 )
				self.LoadingScreenFactionIcon:setAlpha( 0 )
				LoadingScreenFactionIconFrame2( LoadingScreenFactionIcon, {} )
				local FactionNameCDPFrame2 = function ( FactionNameCDP, event )
					local FactionNameCDPFrame3 = function ( FactionNameCDP, event )
						if not event.interrupted then
							FactionNameCDP:beginAnimation( "keyframe", 80, false, false, CoD.TweenType.Linear )
						end
						FactionNameCDP:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( FactionNameCDP, event )
						else
							FactionNameCDP:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						FactionNameCDPFrame3( FactionNameCDP, event )
						return 
					else
						FactionNameCDP:beginAnimation( "keyframe", 1679, false, false, CoD.TweenType.Linear )
						FactionNameCDP:registerEventHandler( "transition_complete_keyframe", FactionNameCDPFrame3 )
					end
				end
				
				FactionNameCDP:completeAnimation()
				self.FactionNameCDP:setAlpha( 0 )
				FactionNameCDPFrame2( FactionNameCDP, {} )
				local FactionNameBlackOpsFrame2 = function ( FactionNameBlackOps, event )
					local FactionNameBlackOpsFrame3 = function ( FactionNameBlackOps, event )
						if not event.interrupted then
							FactionNameBlackOps:beginAnimation( "keyframe", 80, false, false, CoD.TweenType.Linear )
						end
						FactionNameBlackOps:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( FactionNameBlackOps, event )
						else
							FactionNameBlackOps:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						FactionNameBlackOpsFrame3( FactionNameBlackOps, event )
						return 
					else
						FactionNameBlackOps:beginAnimation( "keyframe", 1679, false, false, CoD.TweenType.Linear )
						FactionNameBlackOps:registerEventHandler( "transition_complete_keyframe", FactionNameBlackOpsFrame3 )
					end
				end
				
				FactionNameBlackOps:completeAnimation()
				self.FactionNameBlackOps:setAlpha( 0 )
				FactionNameBlackOpsFrame2( FactionNameBlackOps, {} )

				FactionNameLeftCodCaster:completeAnimation()
				self.FactionNameLeftCodCaster:setAlpha( 0 )
				self.clipFinished( FactionNameLeftCodCaster, {} )
			end
		},
		CodCaster = {
			DefaultClip = function ()
				self:setupElementClipCounter( 14 )

				Team2IconAndNameWidget:completeAnimation()
				self.Team2IconAndNameWidget:setAlpha( 0 )
				self.clipFinished( Team2IconAndNameWidget, {} )

				Team1IconAndNameWidget:completeAnimation()
				self.Team1IconAndNameWidget:setAlpha( 0 )
				self.clipFinished( Team1IconAndNameWidget, {} )

				FrameForCodCasterLeft:completeAnimation()
				self.FrameForCodCasterLeft:setAlpha( 1 )
				self.clipFinished( FrameForCodCasterLeft, {} )

				FrameForCodCasterRight:completeAnimation()
				self.FrameForCodCasterRight:setAlpha( 1 )
				self.clipFinished( FrameForCodCasterRight, {} )

				FrameForCodCasterLeft0:completeAnimation()
				self.FrameForCodCasterLeft0:setAlpha( 1 )
				self.clipFinished( FrameForCodCasterLeft0, {} )

				FrameForCodCasterRight0:completeAnimation()
				self.FrameForCodCasterRight0:setAlpha( 1 )
				self.clipFinished( FrameForCodCasterRight0, {} )

				AxisColors:completeAnimation()
				self.AxisColors:setLeftRight( true, false, 689.5, 1086.25 )
				self.AxisColors:setTopBottom( true, false, 52.9, 55.34 )
				self.clipFinished( AxisColors, {} )

				AlliesColors:completeAnimation()
				self.AlliesColors:setLeftRight( true, false, 226.25, 621.5 )
				self.AlliesColors:setTopBottom( true, false, 52.9, 55.34 )
				self.clipFinished( AlliesColors, {} )

				LoadingScreenFactionIcon0:completeAnimation()
				self.LoadingScreenFactionIcon0:setLeftRight( false, false, 7.13, 193.05 )
				self.LoadingScreenFactionIcon0:setTopBottom( false, false, -75.47, 62.28 )
				self.LoadingScreenFactionIcon0:setAlpha( 1 )
				self.clipFinished( LoadingScreenFactionIcon0, {} )

				LoadingScreenFactionIcon:completeAnimation()
				self.LoadingScreenFactionIcon:setLeftRight( false, false, -231.05, -50.13 )
				self.LoadingScreenFactionIcon:setTopBottom( false, false, -75.47, 62.28 )
				self.LoadingScreenFactionIcon:setAlpha( 1 )
				self.clipFinished( LoadingScreenFactionIcon, {} )

				FactionNameCDP:completeAnimation()
				self.FactionNameCDP:setAlpha( 0 )
				self.clipFinished( FactionNameCDP, {} )

				FactionNameBlackOps:completeAnimation()
				self.FactionNameBlackOps:setAlpha( 0 )
				self.clipFinished( FactionNameBlackOps, {} )

				FactionNameRightCodCaster:completeAnimation()
				self.FactionNameRightCodCaster:setAlpha( 1 )
				self.clipFinished( FactionNameRightCodCaster, {} )

				FactionNameLeftCodCaster:completeAnimation()
				self.FactionNameLeftCodCaster:setAlpha( 1 )
				self.clipFinished( FactionNameLeftCodCaster, {} )
			end
		}
	}

	self:mergeStateConditions( {
		{
			stateName = "CodCaster",
			condition = function ( menu, element, event )
				return IsCodCaster( controller )
			end
		}
	} )
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "factions.isCoDCaster" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "factions.isCoDCaster"
		} )
	end )

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.VSglow:close()
		element.Team2IconAndNameWidget:close()
		element.Team1IconAndNameWidget:close()
		element.FrameForCodCasterLeft:close()
		element.FrameForCodCasterRight:close()
		element.FrameForCodCasterLeft0:close()
		element.FrameForCodCasterRight0:close()
		element.LoadingScreenVSCirclePnl:close()
		element.LoadingScreenFactionIcon0:close()
		element.LoadingScreenFactionIcon:close()
		element.AxisColors:close()
		element.AlliesColors:close()
		element.FactionNameCDP:close()
		element.FactionNameBlackOps:close()
		element.FactionNameRightCodCaster:close()
		element.FactionNameLeftCodCaster:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

