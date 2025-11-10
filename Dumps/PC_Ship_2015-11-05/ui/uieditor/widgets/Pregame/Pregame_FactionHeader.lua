require( "ui.uieditor.widgets.HUD.PrematchCountdown.PrematchCountdown_IconGlowPanel" )
require( "ui.uieditor.widgets.StartGameFlow.TeamIconAndNameWidget" )
require( "ui.uieditor.widgets.StartGameFlow.LoadingScreenVSCirclePnl" )
require( "ui.uieditor.widgets.StartGameFlow.TeamIconAndNameWidgetForCodCaster" )
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
	
	local Team1IconAndNameWidget = CoD.TeamIconAndNameWidget.new( menu, controller )
	Team1IconAndNameWidget:setLeftRight( false, false, -367, 33 )
	Team1IconAndNameWidget:setTopBottom( true, false, 32.88, 117.88 )
	self:addElement( Team1IconAndNameWidget )
	self.Team1IconAndNameWidget = Team1IconAndNameWidget
	
	local FrameForCodCasterRight = CoD.TeamIconAndNameWidgetForCodCaster.new( menu, controller )
	FrameForCodCasterRight:setLeftRight( true, false, 640.5, 1105.5 )
	FrameForCodCasterRight:setTopBottom( true, false, 32.78, 117.78 )
	FrameForCodCasterRight:setAlpha( 0 )
	FrameForCodCasterRight.PanelLine:setYRot( 180 )
	self:addElement( FrameForCodCasterRight )
	self.FrameForCodCasterRight = FrameForCodCasterRight
	
	local FrameForCodCasterLeft = CoD.TeamIconAndNameWidgetForCodCaster.new( menu, controller )
	FrameForCodCasterLeft:setLeftRight( true, false, 212.5, 677.5 )
	FrameForCodCasterLeft:setTopBottom( true, false, 31.88, 116.88 )
	FrameForCodCasterLeft:setAlpha( 0 )
	self:addElement( FrameForCodCasterLeft )
	self.FrameForCodCasterLeft = FrameForCodCasterLeft
	
	local LoadingScreenFactionIcon0 = CoD.LoadingScreenFactionIcon.new( menu, controller )
	LoadingScreenFactionIcon0:setLeftRight( true, false, 688.5, 826.25 )
	LoadingScreenFactionIcon0:setTopBottom( true, false, 4.03, 141.78 )
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
	LoadingScreenFactionIcon:setLeftRight( true, false, 487.38, 625.13 )
	LoadingScreenFactionIcon:setTopBottom( true, false, 4.03, 141.78 )
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
				self:setupElementClipCounter( 0 )
			end,
			StreakEdit = function ()
				self:setupElementClipCounter( 2 )
				local VSlabelFrame2 = function ( VSlabel, event )
					if not event.interrupted then
						VSlabel:beginAnimation( "keyframe", 330, false, false, CoD.TweenType.Linear )
					end
					VSlabel:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( VSlabel, event )
					else
						VSlabel:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				VSlabel:completeAnimation()
				self.VSlabel:setAlpha( 1 )
				VSlabelFrame2( VSlabel, {} )
				local Team1LineFrame2 = function ( Team1Line, event )
					if not event.interrupted then
						Team1Line:beginAnimation( "keyframe", 250, false, false, CoD.TweenType.Linear )
					end
					Team1Line:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( Team1Line, event )
					else
						Team1Line:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Team1Line:completeAnimation()
				self.Team1Line:setAlpha( 0.2 )
				Team1LineFrame2( Team1Line, {} )
			end
		}
	}
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.VSglow:close()
		element.Team2IconAndNameWidget:close()
		element.LoadingScreenVSCirclePnl:close()
		element.Team1IconAndNameWidget:close()
		element.FrameForCodCasterRight:close()
		element.FrameForCodCasterLeft:close()
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

