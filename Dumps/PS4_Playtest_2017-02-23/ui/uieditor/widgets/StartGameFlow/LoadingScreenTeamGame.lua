require( "ui.uieditor.widgets.HUD.PrematchCountdown.PrematchCountdown_IconGlowPanel" )
require( "ui.uieditor.widgets.StartGameFlow.LoadingScreenFactionIcon" )
require( "ui.uieditor.widgets.StartGameFlow.LoadingScreenVSCirclePnl" )
require( "ui.uieditor.widgets.StartGameFlow.TeamIconAndNameWidget" )
require( "ui.uieditor.widgets.StartGameFlow.TeamIconAndNameWidgetForCodCaster" )

CoD.LoadingScreenTeamGame = InheritFrom( LUI.UIElement )
CoD.LoadingScreenTeamGame.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.LoadingScreenTeamGame )
	self.id = "LoadingScreenTeamGame"
	self.soundSet = "default"
	self:setLeftRight( 0, 0, 0, 2036 )
	self:setTopBottom( 0, 0, 0, 238 )
	self.anyChildUsesUpdateState = true
	
	local VSglow = CoD.PrematchCountdown_IconGlowPanel.new( menu, controller )
	VSglow:setLeftRight( 0.5, 0.5, -404, 327 )
	VSglow:setTopBottom( 0.5, 0.5, -119, 119 )
	VSglow:setAlpha( 0.53 )
	self:addElement( VSglow )
	self.VSglow = VSglow
	
	local LoadingScreenVSCirclePnl = CoD.LoadingScreenVSCirclePnl.new( menu, controller )
	LoadingScreenVSCirclePnl:setLeftRight( 0.5, 0.5, -103.5, 31.5 )
	LoadingScreenVSCirclePnl:setTopBottom( 0.5, 0.5, -77, 58 )
	LoadingScreenVSCirclePnl:setAlpha( 0.5 )
	self:addElement( LoadingScreenVSCirclePnl )
	self.LoadingScreenVSCirclePnl = LoadingScreenVSCirclePnl
	
	local Team2Line = LUI.UIImage.new()
	Team2Line:setLeftRight( 0, 1, -49, -17 )
	Team2Line:setTopBottom( 0.5, 0.5, 87, 99 )
	Team2Line:setAlpha( 0.2 )
	Team2Line:setImage( RegisterImage( "uie_t7_menu_cac_tabline" ) )
	Team2Line:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Team2Line )
	self.Team2Line = Team2Line
	
	local Team2IconAndNameWidget = CoD.TeamIconAndNameWidget.new( menu, controller )
	Team2IconAndNameWidget:setLeftRight( 0.5, 0.5, -61, 486 )
	Team2IconAndNameWidget:setTopBottom( 0.5, 0.5, -70, 58 )
	Team2IconAndNameWidget.LoadingScreenFactionBoxPnl:setYRot( 180 )
	self:addElement( Team2IconAndNameWidget )
	self.Team2IconAndNameWidget = Team2IconAndNameWidget
	
	local VSlineR = LUI.UIImage.new()
	VSlineR:setLeftRight( 1, 1, -1005, -2 )
	VSlineR:setTopBottom( 0.5, 0.5, -15, -3 )
	VSlineR:setAlpha( 0.3 )
	VSlineR:setImage( RegisterImage( "uie_t7_menu_cac_tabline" ) )
	VSlineR:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( VSlineR )
	self.VSlineR = VSlineR
	
	local VSlineL = LUI.UIImage.new()
	VSlineL:setLeftRight( 0, 0, -2, 932 )
	VSlineL:setTopBottom( 0.5, 0.5, -15, -3 )
	VSlineL:setAlpha( 0.3 )
	VSlineL:setImage( RegisterImage( "uie_t7_menu_cac_tabline" ) )
	VSlineL:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( VSlineL )
	self.VSlineL = VSlineL
	
	local VScircle = LUI.UIImage.new()
	VScircle:setLeftRight( 0.5, 0.5, -87, 18 )
	VScircle:setTopBottom( 0.5, 0.5, -60, 42 )
	VScircle:setImage( RegisterImage( "uie_t7_menu_frontend_titlebackcircle" ) )
	VScircle:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( VScircle )
	self.VScircle = VScircle
	
	local VSlabel = LUI.UIText.new()
	VSlabel:setLeftRight( 0.5, 0.5, -156, 84 )
	VSlabel:setTopBottom( 0.5, 0.5, -35, 23 )
	VSlabel:setText( Engine.Localize( "VS" ) )
	VSlabel:setTTF( "fonts/FoundryGridnik-Bold.ttf" )
	VSlabel:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	VSlabel:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( VSlabel )
	self.VSlabel = VSlabel
	
	local Team1Line = LUI.UIImage.new()
	Team1Line:setLeftRight( 0, 1, -49, -17 )
	Team1Line:setTopBottom( 0.5, 0.5, -116, -104 )
	Team1Line:setAlpha( 0.2 )
	Team1Line:setImage( RegisterImage( "uie_t7_menu_cac_tabline" ) )
	Team1Line:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Team1Line )
	self.Team1Line = Team1Line
	
	local Team1IconAndNameWidget = CoD.TeamIconAndNameWidget.new( menu, controller )
	Team1IconAndNameWidget:setLeftRight( 0.5, 0.5, -552, 48 )
	Team1IconAndNameWidget:setTopBottom( 0.5, 0.5, -70, 58 )
	self:addElement( Team1IconAndNameWidget )
	self.Team1IconAndNameWidget = Team1IconAndNameWidget
	
	local FrameForCodCasterRight = CoD.TeamIconAndNameWidgetForCodCaster.new( menu, controller )
	FrameForCodCasterRight:setLeftRight( 0, 0, 959, 1657 )
	FrameForCodCasterRight:setTopBottom( 0, 0, 49, 177 )
	FrameForCodCasterRight:setAlpha( 0 )
	FrameForCodCasterRight.PanelLine:setYRot( 180 )
	self:addElement( FrameForCodCasterRight )
	self.FrameForCodCasterRight = FrameForCodCasterRight
	
	local FrameForCodCasterLeft = CoD.TeamIconAndNameWidgetForCodCaster.new( menu, controller )
	FrameForCodCasterLeft:setLeftRight( 0, 0, 317, 1015 )
	FrameForCodCasterLeft:setTopBottom( 0, 0, 48, 176 )
	FrameForCodCasterLeft:setAlpha( 0 )
	self:addElement( FrameForCodCasterLeft )
	self.FrameForCodCasterLeft = FrameForCodCasterLeft
	
	local LoadingScreenFactionIcon = CoD.LoadingScreenFactionIcon.new( menu, controller )
	LoadingScreenFactionIcon:setLeftRight( 0.5, 0.5, -289, -82 )
	LoadingScreenFactionIcon:setTopBottom( 0.5, 0.5, -113, 94 )
	LoadingScreenFactionIcon:subscribeToGlobalModel( controller, "LoadingScreenTeamInfo", "team1FactionIcon", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			LoadingScreenFactionIcon.FactionIconSolid:setImage( RegisterImage( modelValue ) )
		end
	end )
	LoadingScreenFactionIcon:subscribeToGlobalModel( controller, "LoadingScreenTeamInfo", "team1FactionIcon", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			LoadingScreenFactionIcon.FactionIcon:setImage( RegisterImage( modelValue ) )
		end
	end )
	self:addElement( LoadingScreenFactionIcon )
	self.LoadingScreenFactionIcon = LoadingScreenFactionIcon
	
	local LoadingScreenFactionIcon0 = CoD.LoadingScreenFactionIcon.new( menu, controller )
	LoadingScreenFactionIcon0:setLeftRight( 0.5, 0.5, 13, 220 )
	LoadingScreenFactionIcon0:setTopBottom( 0.5, 0.5, -113, 94 )
	LoadingScreenFactionIcon0:subscribeToGlobalModel( controller, "LoadingScreenTeamInfo", "team2FactionIcon", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			LoadingScreenFactionIcon0.FactionIconSolid:setImage( RegisterImage( modelValue ) )
		end
	end )
	LoadingScreenFactionIcon0:subscribeToGlobalModel( controller, "LoadingScreenTeamInfo", "team2FactionIcon", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			LoadingScreenFactionIcon0.FactionIcon:setImage( RegisterImage( modelValue ) )
		end
	end )
	self:addElement( LoadingScreenFactionIcon0 )
	self.LoadingScreenFactionIcon0 = LoadingScreenFactionIcon0
	
	local FactionNameCDP = LUI.UIText.new()
	FactionNameCDP:setLeftRight( 0.5, 0.5, 83, 522 )
	FactionNameCDP:setTopBottom( 0.5, 0.5, -24, 6 )
	FactionNameCDP:setTTF( "fonts/FoundryGridnik-Bold.ttf" )
	FactionNameCDP:setLetterSpacing( 2.5 )
	FactionNameCDP:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	FactionNameCDP:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	FactionNameCDP:subscribeToGlobalModel( controller, "LoadingScreenTeamInfo", "team2FactionName", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			FactionNameCDP:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( FactionNameCDP )
	self.FactionNameCDP = FactionNameCDP
	
	local FactionNameBlackOps = LUI.UIText.new()
	FactionNameBlackOps:setLeftRight( 0.5, 0.5, -594, -155 )
	FactionNameBlackOps:setTopBottom( 0.5, 0.5, -24, 6 )
	FactionNameBlackOps:setTTF( "fonts/FoundryGridnik-Bold.ttf" )
	FactionNameBlackOps:setLetterSpacing( 2.5 )
	FactionNameBlackOps:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	FactionNameBlackOps:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	FactionNameBlackOps:subscribeToGlobalModel( controller, "LoadingScreenTeamInfo", "team1FactionName", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			FactionNameBlackOps:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( FactionNameBlackOps )
	self.FactionNameBlackOps = FactionNameBlackOps
	
	local FactionNameRightCodCaster = LUI.UIText.new()
	FactionNameRightCodCaster:setLeftRight( 0.5, 0.5, 152, 632 )
	FactionNameRightCodCaster:setTopBottom( 0, 0, 94, 122 )
	FactionNameRightCodCaster:setAlpha( 0 )
	FactionNameRightCodCaster:setTTF( "fonts/FoundryGridnik-Bold.ttf" )
	FactionNameRightCodCaster:setLetterSpacing( 2.5 )
	FactionNameRightCodCaster:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	FactionNameRightCodCaster:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	FactionNameRightCodCaster:subscribeToGlobalModel( controller, "LoadingScreenTeamInfo", "team2FactionName", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			FactionNameRightCodCaster:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( FactionNameRightCodCaster )
	self.FactionNameRightCodCaster = FactionNameRightCodCaster
	
	local FactionNameLeftCodCaster = LUI.UIText.new()
	FactionNameLeftCodCaster:setLeftRight( 0.5, 0.5, -690, -210 )
	FactionNameLeftCodCaster:setTopBottom( 0, 0, 96, 124 )
	FactionNameLeftCodCaster:setAlpha( 0 )
	FactionNameLeftCodCaster:setTTF( "fonts/FoundryGridnik-Bold.ttf" )
	FactionNameLeftCodCaster:setLetterSpacing( 2.5 )
	FactionNameLeftCodCaster:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	FactionNameLeftCodCaster:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	FactionNameLeftCodCaster:subscribeToGlobalModel( controller, "LoadingScreenTeamInfo", "team1FactionName", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			FactionNameLeftCodCaster:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( FactionNameLeftCodCaster )
	self.FactionNameLeftCodCaster = FactionNameLeftCodCaster
	
	self.resetProperties = function ()
		VSglow:completeAnimation()
		Team2Line:completeAnimation()
		Team2IconAndNameWidget:completeAnimation()
		VSlineR:completeAnimation()
		VSlineL:completeAnimation()
		VScircle:completeAnimation()
		VSlabel:completeAnimation()
		Team1Line:completeAnimation()
		Team1IconAndNameWidget:completeAnimation()
		LoadingScreenVSCirclePnl:completeAnimation()
		LoadingScreenFactionIcon0:completeAnimation()
		LoadingScreenFactionIcon:completeAnimation()
		FactionNameBlackOps:completeAnimation()
		FactionNameCDP:completeAnimation()
		FrameForCodCasterRight:completeAnimation()
		FrameForCodCasterLeft:completeAnimation()
		FactionNameRightCodCaster:completeAnimation()
		FactionNameLeftCodCaster:completeAnimation()
		VSglow:setAlpha( 0.53 )
		Team2Line:setAlpha( 0.2 )
		Team2IconAndNameWidget:setAlpha( 1 )
		VSlineR:setAlpha( 0.3 )
		VSlineL:setAlpha( 0.3 )
		VScircle:setAlpha( 1 )
		VSlabel:setAlpha( 1 )
		Team1Line:setAlpha( 0.2 )
		Team1IconAndNameWidget:setAlpha( 1 )
		LoadingScreenVSCirclePnl:setAlpha( 0.5 )
		LoadingScreenFactionIcon0:setAlpha( 1 )
		LoadingScreenFactionIcon:setAlpha( 1 )
		FactionNameBlackOps:setAlpha( 1 )
		FactionNameCDP:setAlpha( 1 )
		FrameForCodCasterRight:setAlpha( 0 )
		FrameForCodCasterLeft:setAlpha( 0 )
		FactionNameRightCodCaster:setAlpha( 0 )
		FactionNameLeftCodCaster:setAlpha( 0 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 2 )
				LoadingScreenFactionIcon:completeAnimation()
				self.clipFinished( LoadingScreenFactionIcon, {} )
				LoadingScreenFactionIcon0:completeAnimation()
				self.clipFinished( LoadingScreenFactionIcon0, {} )
			end,
			StartLoading = function ()
				self.resetProperties()
				self:setupElementClipCounter( 15 )
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
				local VSlineRFrame2 = function ( VSlineR, event )
					local VSlineRFrame3 = function ( VSlineR, event )
						if not event.interrupted then
							VSlineR:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
						end
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
				self.VSlineR:setAlpha( 0 )
				VSlineRFrame2( VSlineR, {} )
				local VSlineLFrame2 = function ( VSlineL, event )
					local VSlineLFrame3 = function ( VSlineL, event )
						if not event.interrupted then
							VSlineL:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
						end
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
				self.clipFinished( FrameForCodCasterLeft, {} )
				local LoadingScreenFactionIconFrame2 = function ( LoadingScreenFactionIcon, event )
					local LoadingScreenFactionIconFrame3 = function ( LoadingScreenFactionIcon, event )
						if not event.interrupted then
							LoadingScreenFactionIcon:beginAnimation( "keyframe", 199, false, false, CoD.TweenType.Bounce )
						end
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
				self.LoadingScreenFactionIcon:setAlpha( 0 )
				LoadingScreenFactionIconFrame2( LoadingScreenFactionIcon, {} )
				local LoadingScreenFactionIcon0Frame2 = function ( LoadingScreenFactionIcon0, event )
					local LoadingScreenFactionIcon0Frame3 = function ( LoadingScreenFactionIcon0, event )
						if not event.interrupted then
							LoadingScreenFactionIcon0:beginAnimation( "keyframe", 199, false, false, CoD.TweenType.Bounce )
						end
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
				self.LoadingScreenFactionIcon0:setAlpha( 0 )
				LoadingScreenFactionIcon0Frame2( LoadingScreenFactionIcon0, {} )
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
			end
		},
		CodCaster = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 10 )
				Team2IconAndNameWidget:completeAnimation()
				self.Team2IconAndNameWidget:setAlpha( 0 )
				self.clipFinished( Team2IconAndNameWidget, {} )
				Team1IconAndNameWidget:completeAnimation()
				self.Team1IconAndNameWidget:setAlpha( 0 )
				self.clipFinished( Team1IconAndNameWidget, {} )
				FrameForCodCasterRight:completeAnimation()
				self.FrameForCodCasterRight:setAlpha( 1 )
				self.clipFinished( FrameForCodCasterRight, {} )
				FrameForCodCasterLeft:completeAnimation()
				self.FrameForCodCasterLeft:setAlpha( 1 )
				self.clipFinished( FrameForCodCasterLeft, {} )
				LoadingScreenFactionIcon:completeAnimation()
				self.clipFinished( LoadingScreenFactionIcon, {} )
				LoadingScreenFactionIcon0:completeAnimation()
				self.clipFinished( LoadingScreenFactionIcon0, {} )
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
		},
		Demo = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 2 )
				LoadingScreenFactionIcon:completeAnimation()
				self.clipFinished( LoadingScreenFactionIcon, {} )
				LoadingScreenFactionIcon0:completeAnimation()
				self.clipFinished( LoadingScreenFactionIcon0, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "CodCaster",
			condition = function ( menu, element, event )
				return IsCodCaster( controller )
			end
		},
		{
			stateName = "Demo",
			condition = function ( menu, element, event )
				return IsDemoPlaying()
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
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.VSglow:close()
		self.LoadingScreenVSCirclePnl:close()
		self.Team2IconAndNameWidget:close()
		self.Team1IconAndNameWidget:close()
		self.FrameForCodCasterRight:close()
		self.FrameForCodCasterLeft:close()
		self.LoadingScreenFactionIcon:close()
		self.LoadingScreenFactionIcon0:close()
		self.FactionNameCDP:close()
		self.FactionNameBlackOps:close()
		self.FactionNameRightCodCaster:close()
		self.FactionNameLeftCodCaster:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

